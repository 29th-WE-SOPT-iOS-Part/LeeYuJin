//
//  RankCollectionViewCell.swift
//  29th-week3-seminar
//
//  Created by 이유진 on 2021/10/23.
//

import UIKit

class RankCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RankCollectionViewCell"
    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    
    
    func setData(appName: String,appImage:UIImage?){
        appNameLabel.text = appName
        appIconImageView.image = appImage
        
    }
}
