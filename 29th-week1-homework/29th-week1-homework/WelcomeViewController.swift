//
//  WelcomeViewController.swift
//  29th-week1-homework
//
//  Created by 이유진 on 2021/10/08.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
  
    @IBOutlet weak var confirmButton: UIButton!
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        setWelcomeLabel()
        layout()
        
    }
    
    func layout(){
        
     
        confirmButton.setTitleColor(.white,for: .normal)
        confirmButton.layer.cornerRadius = 10
        confirmButton.backgroundColor = UIColor(red: 66/255, green: 133/255, blue: 244/255, alpha: 1)
        
     
         
        
    }
    
    func setWelcomeLabel(){
        if let msg = name{
            welcomeLabel.text = msg + "님 환영합니다!"
        }
    }
    

   

}
