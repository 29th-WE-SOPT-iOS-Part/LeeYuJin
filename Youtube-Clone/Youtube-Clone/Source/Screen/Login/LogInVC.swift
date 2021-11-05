//
//  LogInVC.swift
//  29th-week1-homework
//
//  Created by 이유진 on 2021/10/08.
//

import UIKit

class LogInVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var infoTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var joinButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    

    @IBAction func touchUpJoinButton(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "JoinVC") else {return}
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func touchUpNextButton(_ sender: Any) {
        
        guard let nextVC=self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
        
        nextVC.name = nameTextField.text
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(deactivate), name: UITextField.textDidChangeNotification, object: nil)
        
       layout()
       

    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameTextField.text = ""
        infoTextField.text = ""
        pwTextField.text = ""
    }
    
    func layout() {
        
        nextButton.isUserInteractionEnabled = false
        nextButton.tintColor = UIColor.gray
        
        nameTextField.layer.cornerRadius = 10
        nameTextField.layer.borderColor = UIColor.textfieldborder?.cgColor
        nameTextField.layer.borderWidth = 1.0
        nameTextField.addLeftPadding()
        
        infoTextField.layer.cornerRadius = 10
        infoTextField.layer.borderColor = UIColor.textfieldborder?.cgColor
        infoTextField.layer.borderWidth = 1.0
        infoTextField.addLeftPadding()
        
        pwTextField.layer.cornerRadius = 10
        pwTextField.layer.borderColor = UIColor.textfieldborder?.cgColor
        pwTextField.layer.borderWidth = 1.0
        pwTextField.addLeftPadding()
        
        
    }
    
    
    @objc func deactivate(){
        let filteredArray = [nameTextField,infoTextField,pwTextField].filter { $0?.text == "" }
        if !filteredArray.isEmpty {
            nextButton.isUserInteractionEnabled = false
            nextButton.tintColor = UIColor.gray
            
        } else {
    
            nextButton.isUserInteractionEnabled = true
            nextButton.tintColor = .facebookblue
     
        }
    }

   
}

extension UITextField{
    func addLeftPadding() {
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: self.frame.height))
            self.leftView = paddingView
            self.leftViewMode = ViewMode.always
        
    }
}

extension UIColor{
    class var facebookblue: UIColor? {return UIColor(named: "facebookblue")}
    class var textfieldborder: UIColor? {return UIColor(named: "textfieldborder")}
   
    
}


