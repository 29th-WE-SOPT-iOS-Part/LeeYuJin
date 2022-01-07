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
    
    var categoryNameList: [CategoryInfo] = []

    @IBOutlet weak var channelCollectionView: UICollectionView!
    @IBOutlet weak var videoTableView: UITableView!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBAction func touchUpProfileButton(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "UINavigationController") else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .crossDissolve
        self.present(nextVC,animated: true,completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initVideoInfoList()
        initChannelInfoList()
        initCategoryNameList()
        
        
        registerXib()
        
        setDelegation()
        
       
        
        
        
        
        
        
    }
    
    func setDelegation(){
        videoTableView.dataSource = self
        videoTableView.delegate = self
        
        channelCollectionView.dataSource = self
        channelCollectionView.delegate = self
        
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
    
        
    }
    
    
    func registerXib() {
        let xibName = UINib(nibName: VideoTableViewCell.identifier, bundle: nil)
        videoTableView.register(xibName, forCellReuseIdentifier: VideoTableViewCell.identifier)
    }

    
    func initCategoryNameList(){
        
        
        categoryNameList.append(contentsOf:[CategoryInfo(categoryName: "전체"),CategoryInfo(categoryName: "오늘"),CategoryInfo(categoryName: "이어서 시청하기"),CategoryInfo(categoryName: "시청하지 않음"),CategoryInfo(categoryName: "음악"),CategoryInfo(categoryName: "뷰티팁"),CategoryInfo(categoryName: "요리 프로그램"),CategoryInfo(categoryName: "공예")])
        
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

extension HomeVC: UITableViewDataSource,UIGestureRecognizerDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VideoTableViewCell.identifier) as? VideoTableViewCell else { return UITableViewCell()}
        
        cell.setData(videoInfo: videoInfoList[indexPath.row])
        cell.tapThumbnailImageDelegate = self
        return cell
    }
    
   
    
}

extension HomeVC: TapThumbnailImageDelegate{
    func tapThumbnailImage(cell: VideoTableViewCell){
       print("tapped")
        
    }
    
}


extension HomeVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case channelCollectionView:
            return channelInfoList.count
        case categoryCollectionView:
            return categoryNameList.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
        case channelCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCollectionViewCell.identifier, for: indexPath) as? ChannelCollectionViewCell else { return UICollectionViewCell()}
            
            cell.setData(channelInfo: channelInfoList[indexPath.row])
            return cell
        case categoryCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell()}
            cell.setData(categoryInfo: categoryNameList[indexPath.row])
            cell.layout()
            return cell
        default:
            return UICollectionViewCell()
            
        }
        
        
       
    }
    
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView{
        case channelCollectionView:
            return CGSize(width: 72, height: 104)
        case categoryCollectionView:
            return CGSize(width: 30+15*categoryNameList[indexPath.row].categoryName.count, height: 38)
        default:
            return CGSize(width: 10, height: 10)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView{
        case channelCollectionView:
            return UIEdgeInsets.zero
        case categoryCollectionView:
            return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5)
        default:
            return UIEdgeInsets.zero
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


extension UIColor{
    class var categoryBorder: UIColor? {return UIColor(named: "categoryBorder")}
    class var categoryFill: UIColor? {return UIColor(named: "categoryFill")}
   
    
}
