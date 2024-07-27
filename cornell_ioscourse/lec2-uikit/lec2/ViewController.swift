//
//  ViewController.swift
//  lec2
//
//  Created by Vin Bui on 9/3/23.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties(view)
    
    private let nameLabel = UILabel()
    private let profileImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        setupLabel()
        setupProfileImage()
        
    }

//    Abstract views into functions and private so other classes can not access
    private func setupLabel(){
        nameLabel.text = "Hot Babe"
        nameLabel.font = UIFont.systemFont(ofSize: 32)
        nameLabel.textColor = UIColor.black
        
//        Not showing because have not added a postion or added to the view

        view.addSubview(nameLabel)
        
//        Have to set to false because of story boarding
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//      Namelabel anchor = top of screen
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
    }
    
    private func setupProfileImage(){
        profileImageView.image = UIImage(named: "caitlin")
        
        view.addSubview(profileImageView)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([profileImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 24),
                                     profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     profileImageView.widthAnchor.constraint(equalToConstant: 256),
                                     profileImageView.heightAnchor.constraint(equalToConstant: 256)])
    
        
        
    }

}

