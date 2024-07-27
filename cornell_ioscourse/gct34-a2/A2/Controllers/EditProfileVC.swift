//
//  EditProfileVC.swift
//  A2
//
//  Created by Vin Bui on 6/4/23.
//

import UIKit

class EditProfileVC: UIViewController {
    
    // MARK: - Properties (view)
    
    let profileImageView = UIImageView()
    
    let homeTextField = UITextField()
    let schoolTextField = UITextField()
    let majorTextField = UITextField()
    let appTextField = UITextField()
    
    let nameLabel = UILabel()
    let bioLabel = UILabel()
    let homeLabel = UILabel()
    let schoolLabel = UILabel()
    let bookLabel = UILabel()
    let appStoreLabel = UILabel()
    
    let saveButton = UIButton()
    
    // MARK: - Properties (data)
    private var bioText:String = ""
    private var homeText:String = ""
    private var schoolText:String = ""
    private var majorText:String = ""
    private var appText:String = ""
    private weak var delegate: (UpdateTextDelegate)?
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        //Setup Background color for opening screen
        UINavigationBar.appearance().backIndicatorImage = UIImage(systemName: "chevron.left")?.withTintColor(UIColor.a2.black)
        UINavigationBar.appearance().backIndicatorTransitionMaskImage =  UIImage(systemName: "chevron.left")?.withTintColor(UIColor.a2.black)

        
        super.viewDidLoad()
        self.title = "Edit Profile"
        view.backgroundColor = UIColor.a2.white
        
        setupProfileImageView()
        setupNameLabelView()
        setupBioLabelView()
        
        setupHomeLabelView()
        setupSchoolLabelView()
        setupBookLabelView()
        setupAppStoreLabelView()
        setupSaveProfileButton()
        
        setupHomeTextField()
        setupSchoolTextField()
        setupMajorTextField()
        setupAppTextField()
    }
    
    
    init(homeText:String, bioText:String,schoolText:String,majorText:String,appText:String,delegate:UpdateTextDelegate){
        self.homeText = homeText
        self.bioText = bioText
        self.schoolText = schoolText
        self.majorText = majorText
        self.appText = appText
        self.delegate = delegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Set Up Views
    
    private func setupProfileImageView(){
        //Assign picture
        profileImageView.image = UIImage(named: "Ellipse 1")
        
        // Add to view
        view.addSubview(profileImageView)
        
        //Constrain
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 32),
                                     profileImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 32),
                                     profileImageView.widthAnchor.constraint(equalToConstant: 128),
                                     profileImageView.heightAnchor.constraint(equalToConstant: 128)])
    }
    private func setupNameLabelView(){
        //Setup Title
        nameLabel.text = "Vin Bui"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 32)
        nameLabel.textColor = UIColor.a2.black
        
        // Add to view
        view.addSubview(nameLabel)
        
        //Constrain
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 55),
                                     nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor,constant: 16)])
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
        
        NSLayoutConstraint.activate([bioLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor,constant: 56),
                                     bioLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor,constant: 16)])
    }
    
    
    
    private func setupHomeLabelView(){
        //Setup Title
        homeLabel.text = "Hometown"
        homeLabel.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        homeLabel.textColor = UIColor.a2.black
        
        // Add to view
        view.addSubview(homeLabel)
        
        //Constrain
        homeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([homeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 32),
                                     homeLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 40)])
    }
    
    
    
    private func setupSchoolLabelView(){
        //Setup Title
        schoolLabel.text = "School"
        schoolLabel.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        schoolLabel.textColor = UIColor.a2.black
        
        // Add to view
        view.addSubview(schoolLabel)
        
        //Constrain
        schoolLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([schoolLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 32),
                                     schoolLabel.topAnchor.constraint(equalTo: homeLabel.bottomAnchor, constant: 68)])
    }
    
    private func setupBookLabelView(){
        //Setup Title
        bookLabel.text = "Major"
        bookLabel.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        bookLabel.textColor = UIColor.a2.black
        
        // Add to view
        view.addSubview(bookLabel)
        
        //Constrain
        bookLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([bookLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 32),
                                     bookLabel.topAnchor.constraint(equalTo: schoolLabel.bottomAnchor, constant: 68)])
    }
    
    private func setupAppStoreLabelView(){
        //Setup Title
        appStoreLabel.text = "Favorite AppDev App"
        appStoreLabel.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        appStoreLabel.textColor = UIColor.a2.black
        
        // Add to view
        view.addSubview(appStoreLabel)
        
        //Constrain
        appStoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([appStoreLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 32),
                                     appStoreLabel.topAnchor.constraint(equalTo: bookLabel.bottomAnchor, constant: 68)])
    }
    private func setupSaveProfileButton(){
        //Setup Title
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(UIColor.a2.white, for: .normal)
        saveButton.backgroundColor = UIColor.a2.ruby
        saveButton.layer.cornerRadius = 16
        saveButton.addTarget(self, action: #selector(saveProfile), for: .touchUpInside)
        
        // Add to view
        view.addSubview(saveButton)
        
        //Constrain
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -64),
                                     saveButton.heightAnchor.constraint(equalToConstant: 55),
                                     saveButton.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor,constant: 32 ),
                                     saveButton.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor,constant: -32)])
    }
    
    private func setupHomeTextField(){
        
        //setup view
        homeTextField.placeholder = homeText
        homeTextField.layer.borderWidth = 1
        homeTextField.layer.borderColor = UIColor.a2.silver.cgColor
        homeTextField.layer.cornerRadius = 8
        
        
        // Add view
        view.addSubview(homeTextField)
        
        //Constrain
        homeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([homeTextField.topAnchor.constraint(equalTo: homeLabel.bottomAnchor,constant: 4),
                                     homeTextField.bottomAnchor.constraint(equalTo: homeTextField.topAnchor,constant: 40),
                                     homeTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
                                     homeTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32)])
        
    }

    private func setupSchoolTextField(){
        
        //setup view
        schoolTextField.placeholder = schoolText
        schoolTextField.layer.borderWidth = 1
        schoolTextField.layer.borderColor = UIColor.a2.silver.cgColor
        schoolTextField.layer.cornerRadius = 8
        
        // Add view
        view.addSubview(schoolTextField)
        
        //Constrain
        schoolTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([schoolTextField.topAnchor.constraint(equalTo: schoolLabel.bottomAnchor,constant: 4),
                                     schoolTextField.bottomAnchor.constraint(equalTo: schoolTextField.topAnchor,constant: 40),
                                     schoolTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
                                     schoolTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32)])
    }
    
    private func setupMajorTextField(){
        
        //setup view
        majorTextField.placeholder = majorText
        majorTextField.layer.borderWidth = 1
        majorTextField.layer.borderColor = UIColor.a2.silver.cgColor
        majorTextField.layer.cornerRadius = 8
        
        // Add view
        view.addSubview(majorTextField)
        
        //Constrain
        majorTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([majorTextField.topAnchor.constraint(equalTo: bookLabel.bottomAnchor,constant: 4),
                                     majorTextField.bottomAnchor.constraint(equalTo: majorTextField.topAnchor,constant: 40),
                                     majorTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
                                     majorTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32)])
    }
    
    private func setupAppTextField(){
        
        //setup view
        appTextField.placeholder = appText
        appTextField.layer.borderWidth = 1
        appTextField.layer.borderColor = UIColor.a2.silver.cgColor
        appTextField.layer.cornerRadius = 8
        
        // Add view
        view.addSubview(appTextField)
        
        //Constrain
        appTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([appTextField.topAnchor.constraint(equalTo: appStoreLabel.bottomAnchor,constant: 4),
                                     appTextField.bottomAnchor.constraint(equalTo: appTextField.topAnchor,constant: 40),
                                     appTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
                                     appTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32)])
    }
    
    //MARK: Button Helpers
    @objc private func saveProfile(){
        navigationController?.popViewController(animated: true)
        //TextField.text is value currently in textfield
        
        if homeTextField.text == ""{
            homeTextField.text = homeText
        }        
        if schoolTextField.text == ""{
            schoolTextField.text = schoolText
        }
        if majorTextField.text == ""{
            majorTextField.text = majorText
        }
        if appTextField.text == ""{
            appTextField.text = appText
        }
            
        delegate?.updateText(newHome: homeTextField.text ?? homeText, newSchool: schoolTextField.text ?? schoolText, newMajor: majorTextField.text ?? majorText, newApp: appTextField.text ?? appText)
    }
    
}
