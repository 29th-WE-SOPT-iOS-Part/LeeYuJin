//
//  PlayViewController.swift
//  Youtube-Clone
//
//  Created by 이유진 on 2022/01/07.
//

import UIKit

class PlayViewController: UIViewController {
    
    var thumbnailImage: UIImage?
    var titleText: String?
    var subTitleText: String?

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBAction func touchUpBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        thumbnailImageView.image = thumbnailImage
        titleLabel.text = titleText
        subTitleLabel.text  = subTitleText

    }
    


}
