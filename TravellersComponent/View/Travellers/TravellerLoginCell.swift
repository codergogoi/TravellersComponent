//
//  TravellerLoginCell.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/5/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class TravellerLoginCell : CollectionBaseCell {

    weak var rootViewController: ViewController?
    
    
    let btnLogin: UIButton = {
        let btn = UIButton()
        let attrText = NSAttributedString(string: "LOG IN", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.white])
        btn.setAttributedTitle(attrText, for: .normal)
        btn.backgroundColor = UIColor.rgba(r: 211, g: 47, b: 47, a: 1)
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
    
    let txtUserName: UITextField = {
           let txt = UITextField()
            txt.placeholder = "User your email"
            txt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 40))
            txt.leftViewMode = .always
           return txt
       }()
       
       let txtPassword: UITextField = {
            let txt = UITextField()
            txt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 40))
            txt.placeholder = "Enter your password"
            txt.leftViewMode = .always
           return txt
       }()
    
    let btnRememberMe: UIButton = {
              let btn = UIButton()
              let attrText = NSAttributedString(string: "Remember Me", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.black])
              btn.setAttributedTitle(attrText, for: .normal)
              btn.layer.cornerRadius = 5
              return btn
              
    }()
    
    let btnForgotPassword: UIButton = {
                 let btn = UIButton()
        let attrText = NSAttributedString(string: "Forgot Password ?", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.rgba(r: 211, g: 47, b: 47, a: 1), NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
                 btn.setAttributedTitle(attrText, for: .normal)
                 btn.layer.cornerRadius = 5
                 return btn
                 
       }()
    
    
    let btnAkbarLogin: UIButton = {
           let btn = UIButton()
           let attrText = NSAttributedString(string: "LOG IN", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.white])
           btn.setAttributedTitle(attrText, for: .normal)
           btn.backgroundColor = UIColor.rgba(r: 211, g: 47, b: 47, a: 1)
           btn.layer.cornerRadius = 5
           return btn
           
       }()
    
    
    let btnFacebook: UIButton = {
           let btn = UIButton()
           let attrText = NSAttributedString(string: "Facebook", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.black])
           btn.setAttributedTitle(attrText, for: .normal)
           btn.backgroundColor = UIColor.white
           btn.layer.cornerRadius = 5
           return btn
           
       }()
    
    
    let btnGoogle: UIButton = {
        let btn = UIButton()
        let attrText = NSAttributedString(string: "Google", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.black])
        btn.setAttributedTitle(attrText, for: .normal)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 5
        return btn
        
    }()
     
    let socialLoginView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    override func setupView() {
        self.addSubview(bgView)
        self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: bgView)
        self.addConstraintWithFormat(formate: "V:|-5-[v0]-5-|", views: bgView)
                
        btnLogin.addTarget(self, action: #selector(onTapDetails(_:)), for: .touchUpInside)
        
        let lblLoginText = UILabel()
        lblLoginText.text = "Log-in to your \n Akbartravels account"
        lblLoginText.numberOfLines = 2
        lblLoginText.font = UIFont.systemFont(ofSize: 16)
        lblLoginText.lineBreakMode = .byWordWrapping
        
        let icon = UIImageView(image: #imageLiteral(resourceName: "suitcase-2"))
        
        self.bgView.addSubview(icon)
        self.bgView.addSubview(btnLogin)
        self.bgView.addSubview(lblLoginText)
        self.bgView.addSubview(lineView)
            
        self.bgView.addConstraintWithFormat(formate: "H:|-10-[v0(32)]-5-[v1]", views: icon,lblLoginText)
        self.bgView.addConstraintWithFormat(formate:"V:|-20-[v0(32)]", views: icon)
        self.bgView.addConstraintWithFormat(formate:"V:|-20-[v0]", views: lblLoginText)
        self.bgView.addConstraintWithFormat(formate: "H:|[v0]|", views: lineView)
        self.bgView.addConstraintWithFormat(formate: "V:|-80-[v0(1)]", views: lineView)
        
        self.bgView.addConstraintWithFormat(formate: "H:[v0]-10-|", views: btnLogin)
        self.bgView.addConstraintWithFormat(formate: "V:|-20-[v0(40)]", views: btnLogin)
        self.widthConst = btnLogin.widthAnchor.constraint(equalToConstant: 100)
        self.btnLogin.addConstraint(widthConst)
        
       
       btnAkbarLogin.setAttributedTitle(setAttrText("Log In", isBold: true), for: .normal)
       btnAkbarLogin.backgroundColor = UIColor.rgba(r: 211, g: 47, b: 47, a: 1)
       btnAkbarLogin.layer.cornerRadius = 5
        
        self.bgView.addSubview(txtUserName)
        self.bgView.addSubview(txtPassword)
        self.bgView.addSubview(btnAkbarLogin)
        self.bgView.addSubview(btnForgotPassword)
        self.bgView.addSubview(btnRememberMe)
        
       socialLoginView.backgroundColor = UIColor.rgba(r: 235, g: 236, b: 240, a: 1)
       self.bgView.addSubview(socialLoginView)
        
        self.btnAkbarLogin.addTarget(self, action: #selector(onTapAkbarLogin(_:)), for: .touchUpInside)
        self.btnRememberMe.addTarget(self, action: #selector(onTapRememberMe(_:)), for: .touchUpInside)
        self.btnForgotPassword.addTarget(self, action: #selector(onTapPassword(_:)), for: .touchUpInside)

        self.bgView.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: txtUserName)
        self.bgView.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: txtPassword)
        self.bgView.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: btnAkbarLogin)
        self.bgView.addConstraintWithFormat(formate: "H:|-20-[v0(100)]", views: btnRememberMe)
        self.bgView.addConstraintWithFormat(formate: "H:[v0(130)]-10-|", views: btnForgotPassword)
        self.bgView.addConstraintWithFormat(formate: "V:[v0(40)]", views: btnForgotPassword)
        self.bgView.addConstraintWithFormat(formate: "H:|[v0]|", views: socialLoginView)

        self.bgView.addConstraintWithFormat(formate: "V:|-100-[v0(40)]-20-[v1(40)]-20-[v2(30)]-20-[v3(50)]-20-[v4(140)]", views: txtUserName, txtPassword, btnRememberMe, btnAkbarLogin, socialLoginView)
        
        self.bgView.addConstraint(NSLayoutConstraint(item: btnForgotPassword, attribute: .top, relatedBy: .equal, toItem: btnRememberMe, attribute: .top, multiplier: 1, constant: 0))
        
        self.configureTextField(txtUserName)
        self.configureTextField(txtPassword)
        
        let labelSocialLogin = UILabel()
        labelSocialLogin.text = "Or Login with"
        labelSocialLogin.textAlignment = .center
        labelSocialLogin.font = UIFont.systemFont(ofSize: 16)
        socialLoginView.addSubview(labelSocialLogin)
        socialLoginView.addSubview(btnFacebook)
        socialLoginView.addSubview(btnGoogle)
        
        self.btnFacebook.addTarget(self, action: #selector(onTapFacebookLogin(_:)), for: .touchUpInside)
        self.btnGoogle.addTarget(self, action: #selector(onTapGoogleLogin(_:)), for: .touchUpInside)
        
        socialLoginView.addConstraintWithFormat(formate: "H:|[v0]|", views: labelSocialLogin)
        socialLoginView.addConstraintWithFormat(formate: "V:|-20-[v0]", views: labelSocialLogin)
        socialLoginView.addConstraintWithFormat(formate: "H:|-30-[v0(160)]", views: btnFacebook)
        socialLoginView.addConstraintWithFormat(formate: "H:[v0(160)]-30-|", views: btnGoogle)
        socialLoginView.addConstraintWithFormat(formate: "V:[v0(50)]-30-|", views: btnFacebook)
        socialLoginView.addConstraintWithFormat(formate: "V:[v0(50)]-30-|", views: btnGoogle)

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
        self.txtUserName.isHidden =  isHide
        self.txtPassword.isHidden = isHide
        self.btnAkbarLogin.isHidden = isHide
        self.btnRememberMe.isHidden = isHide
        self.btnForgotPassword.isHidden = isHide
        self.socialLoginView.isHidden = isHide
        
    }

}


//MARK: - OnTap Actions

extension TravellerLoginCell {
    
    @objc func onTapDetails(_ sender: UIButton){
           sender.onTapAnimation()
           
           self.isMax = self.isMax ? false : true
           
           UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: {
               if self.isMax{
                       let attrText = NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.white])
                       sender.setAttributedTitle(attrText, for: .normal)
                       self.widthConst.constant = 100
                   }else{
                       let attrText = NSAttributedString(string: "X", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.white])
                       sender.setAttributedTitle(attrText, for: .normal)
                       self.widthConst.constant = 50
                   }
               self.layoutIfNeeded()
               
           }, completion: nil)
           
           self.hideLoginInfo(self.isMax)
           
           self.rootViewController?.toggleLogin()
       }
    
    @objc func onTapRememberMe(_ sender: UIButton){
           sender.onTapAnimation()
           
           
    }
    
    @objc func onTapPassword(_ sender: UIButton){
           sender.onTapAnimation()
           
           
    }
    
    @objc func onTapAkbarLogin(_ sender: UIButton){
           sender.onTapAnimation()
           
           
    }
    
    @objc func onTapFacebookLogin(_ sender: UIButton){
           sender.onTapAnimation()
           
           
    }
    
    @objc func onTapGoogleLogin(_ sender: UIButton){
           sender.onTapAnimation()
           
           
    }
    
}
