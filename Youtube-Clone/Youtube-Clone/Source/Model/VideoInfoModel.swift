//
//  VideoInfoModel.swift
//  Youtube-Clone
//
//  Created by 이유진 on 2021/10/29.
//

import UIKit

struct VideoInfo{
    let videoTitle: String
    
    let channelName: String
    let totalViews: String
    let date: String
    
    
    let channelImageName: String
    let thumbnailImageName: String
    
    func getChannelImage() -> UIImage? {
        return UIImage(named: channelImageName)
    }
    
    func getThumbnailImage() -> UIImage? {
        return UIImage(named: thumbnailImageName)
    }
    
    
    
    
    
}
