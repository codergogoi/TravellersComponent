//
//  ContactDetailsCell.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/6/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class ContactDetailsCell : CollectionBaseCell {

    weak var rootViewController: ViewController?
    
    let lblContactTitle:  UILabel = {
          let lbl = UILabel()
          lbl.text = "Contact Information"
          lbl.font = UIFont.boldSystemFont(ofSize: 20)
          return lbl
      }()

    let lineView: UIView = {
         let view = UIView()
         view.backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.1)
         return view
     }()

    let txtCode: UITextField = {
           let txt = UITextField()
            txt.placeholder = "Code"
            txt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 40))
            txt.leftViewMode = .always
           return txt
       }()
       
       let txtMobileNumber: UITextField = {
            let txt = UITextField()
            txt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 40))
            txt.placeholder = "MobileNumber"
            txt.leftViewMode = .always
           return txt
       }()
    
    let txtEmail: UITextField = {
           let txt = UITextField()
           txt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 40))
           txt.placeholder = "Email"
           txt.leftViewMode = .always
          return txt
      }()
    
    
    
    override func setupView() {
        self.addSubview(bgView)
        self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: bgView)
        self.addConstraintWithFormat(formate: "V:|-5-[v0]-5-|", views: bgView)
        
        configureTextField(txtCode)
        configureTextField(txtMobileNumber)
        configureTextField(txtEmail)
        
        bgView.addSubview(lblContactTitle)
        bgView.addSubview(lineView)
        bgView.addSubview(txtCode)
        bgView.addSubview(txtMobileNumber)
        bgView.addSubview(txtEmail)
        
        bgView.addConstraintWithFormat(formate: "H:|-10-[v0(50)]-20-[v1]-10-|", views: txtCode, txtMobileNumber)
        bgView.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: txtEmail)
        bgView.addConstraintWithFormat(formate: "H:|-20-[v0]|", views: lblContactTitle)
        bgView.addConstraintWithFormat(formate: "H:|[v0]|", views: lineView)
        bgView.addConstraintWithFormat(formate: "V:|-10-[v0(40)]-[v1(1)]-20-[v2(40)]-20-[v3(40)]", views: lblContactTitle, lineView, txtCode, txtEmail)
        bgView.addConstraintWithFormat(formate: "V:[v0(40)]", views: txtMobileNumber)
        bgView.addConstraint(NSLayoutConstraint(item: txtMobileNumber, attribute: .top, relatedBy: .equal, toItem: txtCode, attribute: .top, multiplier: 1, constant: 0))
         
        
    }
    
    func configureTextField(_ txtField: UITextField){
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor.rgba(r: 211, g: 47, b: 47, a: 1)
        txtField.addSubview(lineView)
        txtField.addConstraintWithFormat(formate: "H:|[v0]|", views: lineView)
        txtField.addConstraintWithFormat(formate: "V:[v0(1)]|", views: lineView)
        
    }
 

}


//MARK: - OnTap Actions

extension TravellerLoginCell {
    
//
//    @objc func onTapRememberMe(_ sender: UIButton){
//           sender.onTapAnimation()
//
//
//    }
//
//    @objc func onTapPassword(_ sender: UIButton){
//           sender.onTapAnimation()
//
//
//    }
//
//    @objc func onTapAkbarLogin(_ sender: UIButton){
//           sender.onTapAnimation()
//
//
//    }
//
//    @objc func onTapFacebookLogin(_ sender: UIButton){
//           sender.onTapAnimation()
//
//
//    }
//
//    @objc func onTapGoogleLogin(_ sender: UIButton){
//           sender.onTapAnimation()
//
//
//    }
    
}

