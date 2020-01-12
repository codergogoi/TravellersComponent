//
//  GSTDetailsCell.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/6/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class GSTDetailsCell : CollectionBaseCell {

    weak var rootViewController: ViewController?
    
    
    let btnAdd: UIButton = {
        let btn = UIButton()
       let attrText = NSAttributedString(string: "ADD", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.rgba(r: 25, g: 71, b: 138, a: 1)])
       btn.setAttributedTitle(attrText, for: .normal)
       btn.backgroundColor = .white
       btn.layer.borderColor = UIColor.rgba(r: 25, g: 71, b: 138, a: 1).cgColor
       btn.layer.borderWidth = 1
       btn.layer.cornerRadius = 5
       return btn
        
    }()
    
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.1)
        return view
    }()
    
    var isMax: Bool = true
    
    var  widthConst = NSLayoutConstraint()
    
    
    //Akbar Login
    
    let txtGSTIN: UITextField = {
           let txt = UITextField()
            txt.placeholder = "GSTIN"
            txt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 40))
            txt.leftViewMode = .always
           return txt
       }()
       
       let txtGSTHolderName: UITextField = {
            let txt = UITextField()
            txt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 40))
            txt.placeholder = "GST Holder Name"
            txt.leftViewMode = .always
           return txt
       }()
    
    let btnSaveGSTDetails: UIButton = {
             let btn = UIButton()
             let attrText = NSAttributedString(string: "Save GST Details", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.black])
             btn.setAttributedTitle(attrText, for: .normal)
             btn.layer.cornerRadius = 5
             return btn
                 
       }()
   
    
    override func setupView() {
        self.addSubview(bgView)
        self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: bgView)
        self.addConstraintWithFormat(formate: "V:|-5-[v0]-5-|", views: bgView)
                
        btnAdd.addTarget(self, action: #selector(onTapDetails(_:)), for: .touchUpInside)
        btnSaveGSTDetails.addTarget(self, action: #selector(onTapSaveGSTDetails(_:)), for: .touchUpInside)
        
        let lblGSTNText = UILabel()
        lblGSTNText.text = "Use GSTIN  for this booking"
        lblGSTNText.numberOfLines = 2
        lblGSTNText.font = UIFont.systemFont(ofSize: 16)
        lblGSTNText.lineBreakMode = .byWordWrapping
        
        let icon = UIImageView(image: #imageLiteral(resourceName: "suitcase-2"))
        
        let lblOptionalText = UILabel()
        lblOptionalText.text = "(Optional)"
        lblOptionalText.textColor = .darkGray
        lblOptionalText.font = UIFont.systemFont(ofSize: 13)
        
        self.bgView.addSubview(icon)
        self.bgView.addSubview(lblOptionalText)
        self.bgView.addSubview(btnAdd)
        self.bgView.addSubview(lblGSTNText)
        self.bgView.addSubview(lineView)
        self.bgView.addSubview(btnSaveGSTDetails)
        
        self.bgView.addSubview(txtGSTIN)
        self.bgView.addSubview(txtGSTHolderName)
        self.bgView.addSubview(btnAdd)
        
        self.configureTextField(txtGSTIN)
        self.configureTextField(txtGSTHolderName)
            
        self.bgView.addConstraintWithFormat(formate: "H:|-10-[v0(32)]-5-[v1]", views: icon,lblGSTNText)
        self.bgView.addConstraintWithFormat(formate:"V:|-20-[v0(32)]", views: icon)
        self.bgView.addConstraintWithFormat(formate:"V:|-20-[v0]", views: lblGSTNText)
        self.bgView.addConstraintWithFormat(formate:"H:[v0(100)]", views: lblOptionalText)
        self.bgView.addConstraintWithFormat(formate:"V:[v0]", views: lblOptionalText)
        bgView.addConstraint(NSLayoutConstraint(item: lblOptionalText, attribute: .left, relatedBy: .equal, toItem: lblGSTNText, attribute: .left, multiplier: 1, constant: 0))
        
        bgView.addConstraint(NSLayoutConstraint(item: lblOptionalText, attribute: .bottom, relatedBy: .equal, toItem: lblGSTNText, attribute: .bottom, multiplier: 1, constant: 20))

        self.bgView.addConstraintWithFormat(formate: "H:|[v0]|", views: lineView)
        self.bgView.addConstraintWithFormat(formate: "V:|-80-[v0(1)]-[v1(40)]-20-[v2(40)]-20-[v3(40)]", views: lineView, txtGSTIN, txtGSTHolderName, btnSaveGSTDetails)
        self.bgView.addConstraintWithFormat(formate: "H:|-20-[v0]-10-|", views: txtGSTIN)
        self.bgView.addConstraintWithFormat(formate: "H:|-20-[v0]-10-|", views: txtGSTHolderName)
        self.bgView.addConstraintWithFormat(formate: "H:|-20-[v0(180)]", views: btnSaveGSTDetails)


        self.bgView.addConstraintWithFormat(formate: "H:[v0]-10-|", views: btnAdd)
        self.bgView.addConstraintWithFormat(formate: "V:|-20-[v0(40)]", views: btnAdd)
        self.widthConst = btnAdd.widthAnchor.constraint(equalToConstant:60)
        self.btnAdd.addConstraint(widthConst)
        
      
        

        self.hideLoginInfo(true)
        
    }
    
    func configureTextField(_ txtField: UIView){
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor.rgba(r: 211, g: 47, b: 47, a: 1)
        txtField.addSubview(lineView)
        txtField.addConstraintWithFormat(formate: "H:|[v0]|", views: lineView)
        txtField.addConstraintWithFormat(formate: "V:[v0(1)]|", views: lineView)
        
    }
    
    func setAttrText(_ title: String, isBold: Bool = false) -> NSAttributedString {
        
        if isBold{
            let attrText = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.white])
            return attrText
        }else{
            let attrText = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.white])
            return attrText
        }
    }
    
    func hideLoginInfo(_ isHide: Bool = false){
        
        self.lineView.isHidden = isHide
        self.txtGSTHolderName.isHidden =  isHide
        self.txtGSTIN.isHidden = isHide
        self.btnSaveGSTDetails.isHidden = isHide
        
    }

}


//MARK: - OnTap Actions

extension GSTDetailsCell {
    
    @objc func onTapDetails(_ sender: UIButton){
           sender.onTapAnimation()
           
           self.isMax = self.isMax ? false : true
           
           UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: {
               if self.isMax{
                    let attrText = NSAttributedString(string: "ADD", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.rgba(r: 25, g: 71, b: 138, a: 1)])
                    sender.setAttributedTitle(attrText, for: .normal)
                    sender.backgroundColor = .white
                    sender.layer.borderColor = UIColor.rgba(r: 25, g: 71, b: 138, a: 1).cgColor
                    sender.layer.borderWidth = 1
                    sender.layer.cornerRadius = 5
                    self.widthConst.constant = 60                
                   }else{
                       let attrText = NSAttributedString(string: "X", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.white])
                       sender.setAttributedTitle(attrText, for: .normal)
                       self.widthConst.constant = 50
                        sender.layer.borderWidth = 0

                       sender.setAttributedTitle(attrText, for: .normal)
                       sender.backgroundColor = UIColor.rgba(r: 211, g: 47, b: 47, a: 1)
                       sender.layer.cornerRadius = 5
                
                   }
               self.layoutIfNeeded()
               
           }, completion: nil)
           
           self.hideLoginInfo(self.isMax)
           
           self.rootViewController?.toggleGSTDetails()
       }
    
    @objc func onTapSaveGSTDetails(_ sender: UIButton){
           sender.onTapAnimation()
           
           
    }
    
    
}
