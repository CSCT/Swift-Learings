from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import ForeignKey, DateTime, text
from sqlalchemy.orm import Mapped, mapped_column, relationship
from typing import List
from datetime import datetime

db = SQLAlchemy()

class User(db.Model):
  """
  User model.
  """
  __tablename__ = "user"

  id: Mapped[int] = mapped_column(primary_key=True)
  username: Mapped[str] = mapped_column(unique=True)
  bio: Mapped[str]
  posts: Mapped[List["Post"]] = relationship('Post', back_populates='creator')
  # The votes this user has done.
  votes: Mapped[List["Vote"]] = relationship('Vote', back_populates='user')

  def serialize(self, includePostCount=False):
    response = {
      "id": self.id,
      "username": self.username,
      "bio": self.bio
    }
    if includePostCount:
      response["num_of_posts"] = len(self.posts)
    return response
  
class Post(db.Model):
  """
  Post model
  """
  __tablename__ = "post"

  id: Mapped[int] = mapped_column(primary_key=True)
  # The time this post was created. Automatically filled when creating a Post.
  timestamp: Mapped[DateTime] = mapped_column(DateTime, server_default=text('CURRENT_TIMESTAMP'), nullable=False)
  creator_id: Mapped[int] = mapped_column(ForeignKey('user.id'))
  creator: Mapped[User] = relationship('User', back_populates='posts')
  images: Mapped[List["Image"]] = relationship('Image', back_populates='post')
  
  def serialize(self, imageVotedFor:'Image'=None):
    return {
      "id": self.id,
      "timestamp": datetime.isoformat(self.timestamp),
      "creator": self.creator.serialize(),
      "images": [image.serialize() for image in self.images],
      "imageVotedFor": imageVotedFor.serialize() if imageVotedFor else {}
    }
  
class Image(db.Model):
  """
  Image model
  """
  __tablename__ = "image" 

  id: Mapped[int] = mapped_column(primary_key=True)
  # Filename of the image we will use to fetch from server.
  # TODO: add a Unique constraint here after testing. We will want to have this 
  # filename provided by AWS server.
  filename: Mapped[str] = mapped_column()
  # The post this image belongs to.
  post_id: Mapped[int] = mapped_column(ForeignKey('post.id'))
  post: Mapped[Post] = relationship('Post', back_populates='images')
  # The votes on this image.
  votes: Mapped[List["Vote"]] = relationship('Vote', back_populates='image')

  def serialize(self):
    return {
      "id": self.id,
      "filename": self.filename
    }
  
class Vote(db.Model):
  """
  Vote model

  Represents a user and the image they voted on.
  """
  __tablename__ = "vote"

  id: Mapped[int] = mapped_column(primary_key=True)
  user_id: Mapped[int] = mapped_column(ForeignKey('user.id'), nullable=False)
  user: Mapped[User] = relationship('User', back_populates='votes')

  post_id: Mapped[int] = mapped_column(ForeignKey('post.id'), nullable=False)

  image_id: Mapped[int] = mapped_column(ForeignKey('image.id'))
  image: Mapped[Image] = relationship('Image', back_populates='votes')

  def serialize(self):
    return {
      "id": self.id,
      "post_id": self.post_id,
      "user": self.user.serialize(),
      "image": self.image.serialize()
    }
