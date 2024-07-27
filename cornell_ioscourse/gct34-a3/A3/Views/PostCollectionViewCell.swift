//
//  PostCollectionViewCell.swift
//  A3
//
//  Created by Graceson Thompson on 10/30/23.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell{
    
    // MARK: - Properties (view)
    private let profileImage = UIImageView()
    private let timeLabel = UILabel()
    private let anonymousLabel = UILabel()
    private let commentLabel = UILabel()
    private let likeButton = UIButton()
    private let numberLikesLabel = UILabel()
    
    static let reuse = "PostCollectionViewCellReuse"
    
    //MARK: -Data
    private var cellPostID : String = ""
    private var numberOfLikes: Int = 0
    
    // MARK: - init
    override init (frame:CGRect){
        super.init(frame: frame)
        
        backgroundColor = UIColor.a3.white
        layer.cornerRadius = 16
        
        setupProfileImage()
        setupAnonymousLabel()
        setupTimeLabel()
        setupCommentLabel()
        setupLikeButton()
        setupNumberLikesLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - configure
    func configure(post:Post){
        cellPostID = post.id
        commentLabel.text = post.message
        numberOfLikes = post.likes.count
        numberLikesLabel.text = "\(String(post.likes.count)) likes"
        timeLabel.text = post.time.convertToAgo()
        if post.likes.contains("gct34"){
            likeButton.setImage(UIImage(named: "liked"), for: .normal)
        }
        else{
            //Only need to set image will set size later
            likeButton.setImage(UIImage(named: "unliked"), for: .normal)
        }
    }
    
    // MARK: - Set Up Views
    
    private func setupProfileImage(){
        profileImage.image = UIImage(named: "ellipse")
        profileImage.contentMode = .scaleAspectFit
        
        //ContentView not view
        contentView.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        //Constrain
        NSLayoutConstraint.activate([profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
                                     profileImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 24),
                                     profileImage.widthAnchor.constraint(equalToConstant: 32),
                                     profileImage.heightAnchor.constraint(equalToConstant: 32)])
    }
    
    private func setupAnonymousLabel(){
        
        anonymousLabel.text = "Anonymous"
        anonymousLabel.textColor = UIColor.a3.black
        anonymousLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        //ContentView not view
        contentView.addSubview(anonymousLabel)
        anonymousLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Constrain
        NSLayoutConstraint.activate([anonymousLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor,constant: 8),
                                     anonymousLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
                                     anonymousLabel.topAnchor.constraint(equalTo: profileImage.topAnchor)])
    }
    
    private func setupTimeLabel(){
        timeLabel.textColor = UIColor.a3.silver
        timeLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        
        //ContentView not view
        contentView.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Constrain
        NSLayoutConstraint.activate([timeLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor,constant: 8),
                                     timeLabel.topAnchor.constraint(equalTo: anonymousLabel.bottomAnchor)])
    }
    
    private func setupCommentLabel(){
        commentLabel.textColor = UIColor.a3.black
        commentLabel.font = .systemFont(ofSize: 12, weight: .medium)
        
        //ContentView not view
        contentView.addSubview(commentLabel)
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.numberOfLines = 3


        
        
        //Constrain
        NSLayoutConstraint.activate([commentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
                                     commentLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor,constant: 16),
                                     commentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -24)])
    }
    
    private func setupLikeButton(){        
        //TODO: Will need to create likePost function later
        likeButton.addTarget(self, action: #selector(likeAPost), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(unlikeAPost), for: .touchUpInside)
        
        
        contentView.addSubview(likeButton)
        
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([likeButton.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 16),
                                     likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
                                     likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
                                     likeButton.widthAnchor.constraint(equalToConstant: 24),
                                     likeButton.heightAnchor.constraint(equalToConstant: 24)])
    }
    private func setupNumberLikesLabel(){
        numberLikesLabel.textColor = UIColor.a3.black
        numberLikesLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        
        //ContentView not view
        contentView.addSubview(numberLikesLabel)
        numberLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Constrain
        NSLayoutConstraint.activate([numberLikesLabel.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor,constant: 4),
                                     numberLikesLabel.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor)])
        
    }
    
    
    // MARK: - Button Helpers
    
    //Like a post Posts from backend
    @objc private func likeAPost(){
        if likeButton.currentImage != UIImage(named: "liked"){
            //weak stuff explained later
            NetworkManager.shared.likePost(postID: cellPostID){[weak self] success in
                guard let self = self else {return}
                //Puts task on main thread always due on UI task
                if success == true{
                    DispatchQueue.main.async {
                        self.likeButton.setImage(UIImage(named: "liked"), for: .normal)
                        self.numberOfLikes += 1
                        self.numberLikesLabel.text = "\(self.numberOfLikes) likes"
                    }
                }
                
            }
        }
    }
    @objc private func unlikeAPost(){
        if likeButton.currentImage != UIImage(named: "unliked"){
            //weak stuff explained later
            NetworkManager.shared.unlikePost(postID: cellPostID){[weak self] success in
                guard let self = self else {return}
                //Puts task on main thread always due on UI task
                if success == true{
                    DispatchQueue.main.async {
                        self.likeButton.setImage(UIImage(named: "unliked"), for: .normal)
                        self.numberOfLikes -= 1
                        self.numberLikesLabel.text = "\(self.numberOfLikes) likes"
                    }
                }
                
            }
        }
    }
}
