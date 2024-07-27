//
//  RecipeCollectionViewCell.swift
//  A4
//
//  Created by Graceson Thompson on 11/12/23.
//

import SnapKit
import UIKit

class RecipeCollectionViewCell : UICollectionViewCell{
    
    // MARK: - Properties (view)
    private let foodImage = UIImage()
    private let recipeTitleLabe = UILabel()
    private let ratingAndDifficultyLabel = UILabel()
    
    static let reuse = "RecipeCollectionViewCellReuse"
    //MARK: - Data
    
    // MARK: - init
    override init (frame:CGRect){
        super.init(frame: frame)
        
        backgroundColor = UIColor.a4.white
        layer.cornerRadius = 16
        
//        setupFoodImage()
//        setupRecipeTitleLabel()
//        setupRatingAndDifficultyLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(recipe:Recipe){
        }
    }
    // MARK: - Set Up Views
    
    // MARK: - Button Helpers
}
