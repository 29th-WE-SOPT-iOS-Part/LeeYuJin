//
//  ChannelInfoModel.swift
//  Youtube-Clone
//
//  Created by 이유진 on 2021/10/29.
//

import UIKit

struct ChannelInfo{
    
    
    let channelName: String
    let channelImageName: String
   
    
    func getChannelImage() -> UIImage? {
        return UIImage(named: channelImageName)
    }
    
    
    
    
    
}

