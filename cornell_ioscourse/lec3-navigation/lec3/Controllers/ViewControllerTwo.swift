//
//  ViewControllerTwo.swift
//  lec3
//
//  Created by Vin Bui on 6/3/23.
//

import UIKit


class ViewControllerTwo: UIViewController {
    
    // MARK: - Properties (view)
    
    private let popVCButton = UIButton()
    private let textField = UITextField()
    
    //MARK: -Propertied(data)
    private var text:String = ""
    private weak var delegate: UpdateTextDelegate?
    
    
    // MARK: - viewDidLoad and init

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ViewController Two"
        view.backgroundColor = .systemBackground
        
        setupPopVCButton()
        setupTextField()
    }
    
    init(text:String,delgate:UpdateTextDelegate ){
        self.text = text
        self.delegate = delgate
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Setup Views
    
    private func setupPopVCButton() {
        popVCButton.setTitle("Pop VC", for: .normal)
        popVCButton.setTitleColor(.systemBackground, for: .normal)
        popVCButton.backgroundColor = .systemBlue
        popVCButton.layer.cornerRadius = 10
        popVCButton.addTarget(self, action: #selector(popVC), for: .touchUpInside)
        
        view.addSubview(popVCButton)
        popVCButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            popVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popVCButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popVCButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupTextField() {
        textField.placeholder = text

        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.bottomAnchor.constraint(equalTo: popVCButton.topAnchor, constant: -10),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - Button Helpers
    
    @objc private func popVC() {
        // TODO: Pop this ViewController
        navigationController?.popViewController(animated: true)
    }

}

extension ViewControllerOne: UpdateTextDelegate{
    func updateText(newText: String) {
        delegate?.updateText(newText: textField.text ?? "")
    }
}
