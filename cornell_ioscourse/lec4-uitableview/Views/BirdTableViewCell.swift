//
//  BirdTableViewCell.swift
//  lec4
//
//  Created by Graceson Thompson on 10/28/23.
//

import UIKit

//Want to create bird specifick cell
class BirdTableViewCell : UITableViewCell{
//    MARK: -Views
    private let birdImageView = UIImageView()
    private let birdNameLabel = UILabel()
    
    static let reuse = "BirdTableViewCellReuse"
    
//    MARK: -Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupImageView()
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Configure
     func configure(birdName:String,birdImage:String){
        birdImageView.image = UIImage(named:birdImage)
        birdNameLabel.text = birdName
    }
    
    //MARK: -Setup Views
    
    private func setupImageView(){
//      How we want the image to display
//      Content View represents the one cell 
        birdImageView.contentMode = .scaleAspectFit
        birdImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(birdImageView)
        
        NSLayoutConstraint.activate([birdImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
                                     birdImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     birdImageView.widthAnchor.constraint(equalToConstant: 64)])
        
    }    
    private func setupLabel(){
//      How we want the image to display
        birdNameLabel.textColor = .black
        birdNameLabel.font = .systemFont(ofSize: 20,weight: .medium)
        birdNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(birdNameLabel)
        
        NSLayoutConstraint.activate([birdNameLabel.leadingAnchor.constraint(equalTo: birdImageView.trailingAnchor,constant: 8),
                                     birdNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     birdNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16)
                                    ])
        
    }
}
