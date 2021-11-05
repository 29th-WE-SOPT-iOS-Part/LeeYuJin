//
//  ChannelCollectionViewCell.swift
//  Youtube-Clone
//
//  Created by 이유진 on 2021/10/29.
//

import UIKit

class ChannelCollectionViewCell: UICollectionViewCell {
    static let identifier = "ChannelCollectionViewCell"
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var channelIconImageView: UIImageView!
    
    
    func setData(channelInfo: ChannelInfo){
        
        
        channelIconImageView.image = channelInfo.getChannelImage();
        channelNameLabel.text = channelInfo.channelName
       
    }
    
}
