//
//  CheckBoxView.swift
//  29th-week1-homework
//
//  Created by 이유진 on 2021/10/08.
//

import UIKit

class CheckBoxView: UIView{
    
 

    @IBOutlet var checkBoxView: UIView!
    
    @IBOutlet weak var checkBoxUIView: UIView!
    @IBOutlet weak var checkLabel: UILabel!
    
    var delegate: CheckBoxDelegate?
    

    
    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        private func commonInit(){
           
            let bundle = Bundle(for:CheckBoxView.self)
            bundle.loadNibNamed("CheckBoxView", owner: self, options: nil)
            addSubview(checkBoxView)
            checkBoxView.frame = self.bounds
            checkBoxView.layer.borderColor = UIColor.gray.cgColor
            checkBoxView.layer.borderWidth = 1.0
            checkBoxView.layer.cornerRadius = 5
            checkBoxView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            checkLabel.isHidden = true
            
            self.checkBoxView.isUserInteractionEnabled = true
            self.checkBoxView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.checkBoxClicked(_:))))
        }
    
    @objc func checkBoxClicked(_ sender: Any) {
            // CheckBoxDelegate 함수 호출
            delegate?.checkBoxHighlight(cb: self)
        }
}
