//
//  CategoryCollectionViewCell.swift
//  Youtube-Clone
//
//  Created by 이유진 on 2021/11/11.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    
    @IBOutlet weak var categoryButton: UIButton!
    
   
    func layout(){
        categoryButton.backgroundColor = .categoryFill
        categoryButton.layer.borderColor = UIColor.categoryBorder?.cgColor
        categoryButton.layer.borderWidth = 1.0
        categoryButton.titleLabel?.textColor = .black
        categoryButton.layer.cornerRadius = 18
    }
    
    func setData(categoryInfo: CategoryInfo){
        categoryButton.titleLabel?.text = categoryInfo.categoryName
    }
}
