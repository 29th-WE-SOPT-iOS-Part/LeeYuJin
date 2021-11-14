//
//  JoinVC.swift
//  29th-week1-homework
//
//  Created by 이유진 on 2021/10/08.
//

import UIKit

class JoinVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var infoTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var checkBoxView: CheckBoxView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkBoxView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(deactivate), name: UITextField.textDidChangeNotification, object: nil)
        
        layout()
        
        
    }
    
    @IBAction func touchUpNextButton(_ sender: Any) {
        
        requestJoin()
    }
    
    
    func moveToWelcome(){
        guard let nextVC=self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
        
        nextVC.name = nameTextField.text
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        print("movetowelcome")
   
    }
    func popAlert(title: String, message: String, isSuccess: Bool) {
            let alert = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
        switch(isSuccess){
        case true :
            let okAction = UIAlertAction(title: "확인" ,style: .default){action -> Void in self.moveToWelcome()}
                alert.addAction(okAction)
        case false :
            let okAction = UIAlertAction(title: "확인" ,style: .default)
            alert.addAction(okAction)
        }
        
            present(alert, animated: true)
    }
    
    func layout(){
        
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 10
        nextButton.isUserInteractionEnabled = false
        nextButton.backgroundColor = UIColor.gray
         

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
            nextButton.backgroundColor = UIColor.gray
            
        } else {
    
            nextButton.isUserInteractionEnabled = true
            nextButton.backgroundColor = .facebookblue
        }
    }
    
    
    
   
    

}


extension JoinVC: CheckBoxDelegate {
    //Delegate 함수 구현
    func checkBoxHighlight(cb: CheckBoxView) {
        //비밀번호 표시 체크 해제 할때
        if cb.checkLabel.isHidden == false {
            cb.checkLabel.isHidden = true
            cb.checkBoxView.layer.borderColor = UIColor.textfieldborder?.cgColor
            cb.checkBoxView.layer.borderWidth = 1
            cb.checkBoxUIView.backgroundColor = UIColor.white
            
            pwTextField.isSecureTextEntry = true
            
        } else{// 비밀번호 표시 체크 할 때
            cb.checkLabel.isHidden = false
            cb.checkLabel.textColor = UIColor.white
            cb.checkBoxView.layer.borderWidth = 0
            cb.checkBoxUIView.layer.cornerRadius = 5
            cb.checkBoxUIView.backgroundColor = .facebookblue
            
            pwTextField.isSecureTextEntry = false
        }
    }
}

extension JoinVC{
    
    func requestJoin(){
        UserSignService.shared.Join(email: infoTextField.text ?? "", name: nameTextField.text ?? "",password: pwTextField.text ?? "") { responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else {return}
                if let userData = response.data {
                    self.popAlert(title: "회원가입", message: response.message, isSuccess: true)
                   
                }
                
                
            case .requestErr(let msg):
                
                if let msg = msg as? String{
                    self.popAlert(title: "회원가입", message: msg, isSuccess: false)
                }
                
                
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            
        }
    }
    
    

    
  
}

