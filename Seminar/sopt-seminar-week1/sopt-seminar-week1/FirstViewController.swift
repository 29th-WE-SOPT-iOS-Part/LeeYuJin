//
//  FirstViewController.swift
//  sopt-seminar-week1
//
//  Created by 이유진 on 2021/10/02.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var sendButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func touchUpToSend(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as? SecondViewController else {return}
        
        nextVC.message = textField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)

       
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
