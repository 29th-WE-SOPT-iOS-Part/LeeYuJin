//
//  VideoTableViewCell.swift
//  Youtube-Clone
//
//  Created by 이유진 on 2021/10/29.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    static let identifier = "VideoTableViewCell"
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var menuButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setData(videoInfo: VideoInfo){
        
        thumbnailImageView.image = videoInfo.getThumbnailImage();
        channelImageView.image = videoInfo.getChannelImage();
        titleLabel.text = videoInfo.videoTitle
        subTitleLabel.text = "\(videoInfo.channelName) · 조회수 \(videoInfo.totalViews)회 · \(videoInfo.date)"
    }
    
}
