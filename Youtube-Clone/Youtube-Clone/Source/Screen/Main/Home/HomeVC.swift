//
//  HomeVC.swift
//  Youtube-Clone
//
//  Created by 이유진 on 2021/10/22.
//

import UIKit

class HomeVC: UIViewController {
    
    var videoInfoList: [VideoInfo] = []
    
    var channelInfoList: [ChannelInfo] = []

    @IBOutlet weak var channelCollectionView: UICollectionView!
    @IBOutlet weak var videoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initVideoInfoList()
        initChannelInfoList()
        
        registerXib()
        setDelegation()
        
        
        
    }
    
    func setDelegation(){
        videoTableView.dataSource = self
        videoTableView.delegate = self
        
        channelCollectionView.dataSource = self
        channelCollectionView.delegate = self
        
    }
    
    func registerXib() {
        let xibName = UINib(nibName: VideoTableViewCell.identifier, bundle: nil)
        videoTableView.register(xibName, forCellReuseIdentifier: VideoTableViewCell.identifier)
    }
    func initVideoInfoList(){
        videoInfoList.append(contentsOf: [
            VideoInfo(videoTitle: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", channelName: "WE SOPT", totalViews: "100만", date: "3주 전", channelImageName: "wesoptProfile", thumbnailImageName: "wesoptiOSPart"),
            VideoInfo(videoTitle: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", channelName: "WE SOPT", totalViews: "100만", date: "3주 전", channelImageName: "wesoptProfile", thumbnailImageName: "wesoptiOSPart"),
            VideoInfo(videoTitle: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", channelName: "WE SOPT", totalViews: "100만", date: "3주 전", channelImageName: "wesoptProfile", thumbnailImageName: "wesoptiOSPart"),
            VideoInfo(videoTitle: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", channelName: "WE SOPT", totalViews: "100만", date: "3주 전", channelImageName: "wesoptProfile", thumbnailImageName: "wesoptiOSPart"),
            VideoInfo(videoTitle: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", channelName: "WE SOPT", totalViews: "100만", date: "3주 전", channelImageName: "wesoptProfile", thumbnailImageName: "wesoptiOSPart"),
            VideoInfo(videoTitle: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", channelName: "WE SOPT", totalViews: "100만", date: "3주 전", channelImageName: "wesoptProfile", thumbnailImageName: "wesoptiOSPart")
        
        ])
        
        
    }
    
    func initChannelInfoList(){
        channelInfoList.append(contentsOf: [
            ChannelInfo(channelName: "iOSPart", channelImageName: "ggamju1"),
            ChannelInfo(channelName: "AndroidPart", channelImageName: "ggamju2"),
            ChannelInfo(channelName: "ServerPart", channelImageName: "ggamju3"),
            ChannelInfo(channelName: "DesignPart", channelImageName: "ggamju4"),
            ChannelInfo(channelName: "PlanPart", channelImageName: "ggamju5"),
            ChannelInfo(channelName: "OperationPart", channelImageName: "ggamju6"),
            ChannelInfo(channelName: "MediaPart", channelImageName: "ggamju7"),
            ChannelInfo(channelName: "LeaderPart", channelImageName: "ggamju8"),
        
        ])
        
    }
    


}


extension HomeVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
    
    
    
}

extension HomeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VideoTableViewCell.identifier) as? VideoTableViewCell else { return UITableViewCell()}
        
        cell.setData(videoInfo: videoInfoList[indexPath.row])
        
        return cell
    }
    
    
}


extension HomeVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channelInfoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCollectionViewCell.identifier, for: indexPath) as? ChannelCollectionViewCell else { return UICollectionViewCell()}
        
        cell.setData(channelInfo: channelInfoList[indexPath.row])
        
        return cell
    }
    
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 104)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
