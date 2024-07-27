//
//  ProfileVC.swift
//  A2
//
//  Created by Vin Bui on 6/4/23.
//

import UIKit


protocol UpdateTextDelegate: AnyObject{
    func updateText(newHome:String,newSchool:String,newMajor:String,newApp:String)
}

class ProfileVC: UIViewController {
    
    // MARK: - Properties (view)
    
    let profileImageView = UIImageView()
    let homeImageView = UIImageView()
    let schoolImageView = UIImageView()
    let bookImageView = UIImageView()
    let appStoreImageView = UIImageView()
    
    let nameLabel = UILabel()
    let bioLabel = UILabel()
    
    let homeLabel = UILabel()
    let schoolLabel = UILabel()
    let bookLabel = UILabel()
    let appStoreLabel = UILabel()
    
    let editProfileButton = UIButton()
    
    // MARK: - Properties (data)
    private var nameText:String = "Vin Bui"
    private var bioText:String = "I like turtles"
    private var homeText:String = "Atlanta,GA"
    private var schoolText:String = "Cornell"
    private var majorText:String = "CS"
    private var appText:String = "IOS"
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        //Setup Background color for opening screen
        super.viewDidLoad()
        
        self.title = "My Profile"
        view.backgroundColor = UIColor.a2.white
        
        setupProfileImageView()
        setupNameLabelView()
        setupBioLabelView()
        
        setupHomeImageView()
        setupSchoolImageView()
        setupBookImageView()
        setupAppStoreImageView()
        
        setupHomeLabelView()
        setupBookLabelView()
        setupSchoolLabelView()
        setupAppStoreLabelView()
        setupEditProfileButton()
        

    }
    
    // MARK: - Set Up Views
    private func setupProfileImageView(){
        //Assign picture
        profileImageView.image = UIImage(named: "Ellipse 1")
        
        // Add to view
        view.addSubview(profileImageView)
        
        //Constrain
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40),
                                     profileImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                                     profileImageView.widthAnchor.constraint(equalToConstant: 128),
                                     profileImageView.heightAnchor.constraint(equalToConstant: 128)])
    }
    private func setupNameLabelView(){
        //Setup Title
        nameLabel.text = nameText
        nameLabel.font = UIFont.boldSystemFont(ofSize: 32)
        nameLabel.textColor = UIColor.a2.black
        
        // Add to view
        view.addSubview(nameLabel)
        
        //Constrain
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor,constant: 16),
                                     nameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)])
    }    
    
    private func setupBioLabelView(){
        //Setup Title
        bioLabel.text = bioText
        bioLabel.font = UIFont.italicSystemFont(ofSize: 16)
        bioLabel.textColor = UIColor.a2.black
        
        // Add to view
        view.addSubview(bioLabel)
        
        //Constrain
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 8),
                                     bioLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)])
    }
    
    
    private func setupHomeImageView(){
        //Assign picture
        homeImageView.image = UIImage(named: "Home")
        
        // Add to view
        view.addSubview(homeImageView)
        
        //Constrain
        homeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([homeImageView.topAnchor.constraint(equalTo: bioLabel.safeAreaLayoutGuide.bottomAnchor,constant: 48),
                                     homeImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 32),
                                     homeImageView.widthAnchor.constraint(equalToConstant: 24),
                                     homeImageView.heightAnchor.constraint(equalToConstant: 24)])
    }  
    
    
    private func setupHomeLabelView(){
        //Setup Title
        homeLabel.text = homeText
        homeLabel.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        homeLabel.textColor = UIColor.a2.black
        
        // Add to view
        view.addSubview(homeLabel)
        
        //Constrain
        homeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([homeLabel.leadingAnchor.constraint(equalTo: homeImageView.trailingAnchor,constant: 16),
                                     homeLabel.topAnchor.constraint(equalTo: homeImageView.topAnchor, constant: 2.5)])
    }
    
    
    
    private func setupSchoolImageView(){
        //Assign picture
        schoolImageView.image = UIImage(named: "School Building")
        
        // Add to view
        view.addSubview(schoolImageView)
        
        //Constrain
        schoolImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([schoolImageView.topAnchor.constraint(equalTo: homeImageView.safeAreaLayoutGuide.bottomAnchor,constant: 24),
                                     schoolImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 32),
                                     schoolImageView.widthAnchor.constraint(equalToConstant: 24),
                                     schoolImageView.heightAnchor.constraint(equalToConstant: 24)])
    }    
    private func setupBookImageView(){
        //Assign picture
        bookImageView.image = UIImage(named: "Book And Pencil")
        
        // Add to view
        view.addSubview(bookImageView)
        
        //Constrain
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([bookImageView.topAnchor.constraint(equalTo: schoolImageView.safeAreaLayoutGuide.bottomAnchor,constant: 24),
                                     bookImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 32),
                                     bookImageView.widthAnchor.constraint(equalToConstant: 24),
                                     bookImageView.heightAnchor.constraint(equalToConstant: 24)])
    }
    
    private func setupAppStoreImageView(){
        //Assign picture
        appStoreImageView.image = UIImage(named: "App Store")
        
        // Add to view
        view.addSubview(appStoreImageView)
        
        //Constrain
        appStoreImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([appStoreImageView.topAnchor.constraint(equalTo: bookImageView.safeAreaLayoutGuide.bottomAnchor,constant: 24),
                                     appStoreImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 32),
                                     appStoreImageView.widthAnchor.constraint(equalToConstant: 24),
                                     appStoreImageView.heightAnchor.constraint(equalToConstant: 24)])
    }
    
    private func setupSchoolLabelView(){
        //Setup Title
        schoolLabel.text = schoolText
        schoolLabel.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        schoolLabel.textColor = UIColor.a2.black
        
        // Add to view
        view.addSubview(schoolLabel)
        
        //Constrain
        schoolLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([schoolLabel.leadingAnchor.constraint(equalTo: schoolImageView.trailingAnchor,constant: 16),
                                     schoolLabel.topAnchor.constraint(equalTo: schoolImageView.topAnchor, constant: 2.5)])
    }
    
    private func setupBookLabelView(){
        //Setup Title
        bookLabel.text = majorText
        bookLabel.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        bookLabel.textColor = UIColor.a2.black
        
        // Add to view
        view.addSubview(bookLabel)
        
        //Constrain
        bookLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([bookLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor,constant: 16),
                                     bookLabel.topAnchor.constraint(equalTo: bookImageView.topAnchor, constant: 2.5)])
    }
    
    private func setupAppStoreLabelView(){
        //Setup Title
        appStoreLabel.text = appText
        appStoreLabel.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        appStoreLabel.textColor = UIColor.a2.black
        
        // Add to view
        view.addSubview(appStoreLabel)
        
        //Constrain
        appStoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([appStoreLabel.leadingAnchor.constraint(equalTo: appStoreImageView.trailingAnchor,constant: 16),
                                     appStoreLabel.topAnchor.constraint(equalTo: appStoreImageView.topAnchor, constant: 2.5)])
    }    
    private func setupEditProfileButton(){
        //Setup Title
        editProfileButton.setTitle("Edit Profile", for: .normal)
        editProfileButton.setTitleColor(UIColor.a2.white, for: .normal)
        editProfileButton.backgroundColor = UIColor.a2.ruby
        editProfileButton.layer.cornerRadius = 16
        
        //What the button does when you click the button
        editProfileButton.addTarget(self, action: #selector(pushEditProfile), for: .touchUpInside)
        
        // Add to view
        view.addSubview(editProfileButton)
        
        //Constrain
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([editProfileButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -64),
                                     editProfileButton.heightAnchor.constraint(equalToConstant: 55),
                                     editProfileButton.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor,constant: 32),
                                     editProfileButton.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor,constant: -32)])
    }
    
    //MARK: Button Helpers
    @objc private func pushEditProfile(){
        //TODO: Push Edit Profile
        //Create object for edit profile
        let editProfileVC = EditProfileVC(homeText:homeText, bioText:bioText,schoolText:schoolText,majorText:majorText,appText:appText, delegate: self)
        navigationController?.pushViewController(editProfileVC, animated: true)
    }
    
}

extension ProfileVC:UpdateTextDelegate{
    func updateText(newHome: String, newSchool: String, newMajor: String, newApp: String) {
        homeText = newHome
        schoolText = newSchool
        majorText = newMajor
        appText = newApp
        
        homeLabel.text = newHome
        schoolLabel.text = newSchool
        bookLabel.text = newMajor
        appStoreLabel.text = newApp
    }
}
