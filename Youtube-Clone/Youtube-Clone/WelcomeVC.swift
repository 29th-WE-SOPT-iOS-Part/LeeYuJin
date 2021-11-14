//
//  WelcomeVC.swift
//  29th-week1-homework
//
//  Created by 이유진 on 2021/10/08.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
  
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBAction func touchUpOtherAccount(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "LogInVC")as? LogInVC else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .crossDissolve
        self.present(nextVC, animated: true, completion: nil)
        
    }
    @IBAction func touchUpConfirmButton(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "TabBarController")as? TabBarController else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .crossDissolve
        self.present(nextVC, animated: true, completion: nil)
        
        
    }
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        setWelcomeLabel()
        layout()
        
    }
    
    func layout(){
        
     
        confirmButton.setTitleColor(.white,for: .normal)
        confirmButton.layer.cornerRadius = 10
        confirmButton.backgroundColor = .facebookblue
        
     
         
        
    }
    
    func setWelcomeLabel(){
        if let msg = name{
            welcomeLabel.text = msg + "님 \n 환영합니다!"
        }
    }
    

   

}
