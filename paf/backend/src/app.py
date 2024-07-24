import json
from flask import Flask, request
from db import Vote, db, User, Post, Image

# Define database filename.
app = Flask(__name__)
db_filename = "paf.db"

# Set up config.
app.config["SQLALCHEMY_DATABASE_URI"] = f"sqlite:///{db_filename}"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

# Initialize app
db.init_app(app)
with app.app_context():
  # db.drop_all()
  db.create_all()

# Helper response formats.
def success_response(data, code=200):
    return json.dumps(data), code


def failure_response(message, code=404):
    return json.dumps({"error": message}), code

@app.route("/")
def home():
  return success_response({"success": "Hello World!"})

# User Enpoints-----------------------------------------------------------------

@app.route("/dev/user/", methods=["GET"])
def get_users():
  """
  Endpoint for getting all users, sorted by username.
  """
  users = db.session.scalars(db.select(User).order_by(User.username)).all()
  users_serialized = [user.serialize(includePostCount=True) for user in users]
  return success_response({"users": users_serialized})

@app.route("/dev/user/", methods=["POST"])
def create_user():
  """
  Endpoint for creating a User.
  """
  body = json.loads(request.data)
  username = body.get("username")
  bio=body.get("bio")
  if username is None or bio is None:
    return failure_response("Not all required parameters were provided.")

  user = User(
      username=username,
      bio=bio
  )
  db.session.add(user)
  db.session.commit()
  return success_response(user.serialize(), 201)

# Post Enpoints-----------------------------------------------------------------

@app.route("/dev/posts/", methods=["GET"])
def get_posts():
  """
  Endpoint for getting all posts.
  """
  posts = db.session.scalars(db.select(Post)).all()
  response = {"posts": [post.serialize() for post in posts]}
  return success_response(response)

@app.route("/dev/posts/<int:user_id>/", methods=["POST"])
def create_post(user_id):
  """
  Endpoint for creating a post for User with id 'user_id'.
  """
  user = db.session.scalar(db.select(User).filter_by(id=user_id))
  if user is None:
    return failure_response("User does not exist.")

  files_from_request = request.files
  if 'images' not in files_from_request:
    return failure_response("No images provided to create post.")

  image_files = files_from_request.getlist('images')
  # We need a minimum of 2 posts per post.
  if len(image_files) < 2:
    return failure_response("2 or more images must be provided.")

  images = []
  for file in image_files:
     images.append(Image(filename = file.filename))

  post = Post(
    creator_id = user_id,
    images = images
  )
  db.session.add(post)
  db.session.commit()
  response = {"post": post.serialize()}
  return success_response(response, 201)

# Public 
@app.route("/posts/", methods=["GET"])
def get_posts_for_feed():
  """
  Endpoint for getting all posts for a specific user. The response will be a
  list of posts with information needed to render feed for this user.

  body:
  {
    user_id: User.id
  }
  """
  body = json.loads(request.data)
  user_id = body.get("user_id")

  user = db.session.scalar(db.select(User).filter_by(id=user_id))
  if user is None:
    return failure_response("User does not exist.")

  # Get all posts along with any images this user has voted for.
  query = db.select(Post, Image).\
    outerjoin(Vote, (Post.id == Vote.post_id) & (Vote.user_id == user_id)).\
    outerjoin(Image, (Post.id == Image.post_id) & (Vote.image_id == Image.id))
  result = db.session.execute(query).all()

  posts = []
  for row in result:
    post = Post(
      id = row.Post.id,
      timestamp = row.Post.timestamp,
      creator_id = row.Post.creator_id,
      creator = row.Post.creator,
      images = row.Post.images
    )
    posts.append(post.serialize(row.Image))
  
  return success_response({"posts": posts})

# Vote Enpoints-----------------------------------------------------------------

@app.route("/dev/votes/", methods=["GET"])
def get_votes():
  """
  Endpoint for getting all votes.
  """
  votes = db.session.scalars(db.select(Vote)).all()
  votes_serialized = [vote.serialize() for vote in votes]
  return success_response({"votes": votes_serialized})

# TODO: transition these parameters into body JSON.
@app.route("/dev/votes/post/<int:post_id>/image/<int:image_id>/user/<int:user_id>/", methods=["POST"])
def vote_on_post(post_id, image_id, user_id):
  """
  Endpoint for voting on a post.
  """
  post = db.session.scalar(db.select(Post).filter_by(id=post_id))
  user = db.session.scalar(db.select(User).filter_by(id=user_id))
  image = db.session.scalar(db.select(Image).filter_by(id=image_id))
  
  if post is None:
    return failure_response("Not a valid post id.")

  if user is None:
    return failure_response("Not a valid user id.")
  
  if image is None:
    return failure_response("Not a valid image id.")
  
  # For existing vote, we just update the image voted for.
  existingVote = db.session.scalar(db.select(Vote).filter_by(user_id=user_id, post_id=post_id))
  if existingVote:
    existingVote.image_id = image_id
    db.session.commit()
    response = {"vote": existingVote.serialize()}
    return success_response(response, 202)
  
  vote = Vote(
    user_id = user_id,
    post_id = image.post_id,
    image_id = image_id
  )
  db.session.add(vote)
  db.session.commit()
  response = {"vote": vote.serialize()}
  return success_response(response, 202)


if __name__ == "__main__":
  app.run(host="0.0.0.0", port=8000, debug=True)