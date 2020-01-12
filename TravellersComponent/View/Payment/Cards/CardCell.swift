//
//  CardCell.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/10/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class CardCell: CollectionBaseCell {
    
    weak var rootViewController: CardViewController?
    
    var cardInfo: Card?{
        didSet{
            if let card = self.cardInfo{
                txtCardNumber.text = card.cardNumber
                txtNameOnCard.text = card.nameOnCard
                txtCVV.text = card.cvvNumber
                if card.cardNumber.count > 0 && card.nameOnCard.count > 0 {
                    btnExpiryMonth.setAttributedTitle(self.setAttrText(card.expiryMonth.rawValue, isPlaceHolder: false), for: .normal)                }
                
                if card.expiryYear == "" {
                    btnExpiryYear.setAttributedTitle(self.setAttrText("Expiry Year", isPlaceHolder: true), for: .normal)
                }else{
                    btnExpiryYear.setAttributedTitle(self.setAttrText(card.expiryYear, isPlaceHolder: false), for: .normal)
                }
                
            }
        }
    }
    
    let txtCardNumber: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Card Number"
        txt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 2, height: 40))
        txt.leftViewMode = .always
        txt.keyboardType = .numberPad
        txt.returnKeyType = .next
        return txt
    }()
    
    let txtNameOnCard: UITextField = {
         let txt = UITextField()
         txt.placeholder = "Name on Card"
         txt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 2, height: 40))
         txt.leftViewMode = .always
         txt.keyboardType = .alphabet
         txt.spellCheckingType = .no
         txt.autocorrectionType = .no
         txt.returnKeyType = .next
         return txt
    }()
    
    
    let btnExpiryMonth: UIButton = {
        let txt = UIButton(type: .custom)
        txt.contentHorizontalAlignment = .left
        return txt
     }()
    
    let btnExpiryYear: UIButton = {
         let txt = UIButton(type: .custom)
        txt.contentHorizontalAlignment = .left
        return txt
    }()
   
    
    let txtCVV: UITextField = {
          let txt = UITextField()
          txt.placeholder = "CVV"
          txt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 40))
          txt.leftViewMode = .always
          return txt
     }()
    
    let imgCardType: UIImageView = {
        let img = UIImageView(image: #imageLiteral(resourceName: "suitcase-2"))
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let btnInternationalBtn: UIButton = {
        let btn = UIButton(type: .custom)
        return btn
    }()
    
    let imgCardStrip: UIImageView = {
        
        let img = UIImageView(image: #imageLiteral(resourceName: "paymentMode"))
        img.backgroundColor = .cyan
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let imgCVVNumber: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .lightGray
        return img
    }()
    
    let lblCVVGudeline:UILabel = {
        let lbl = UILabel()
        lbl.text = "3 digit prited on \nthe backside of the card"
        lbl.numberOfLines = 2
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.textColor = .darkGray
        return lbl
    }()
    
    let lblTermsNConditions:UILabel = {
        let lbl = UILabel()
        lbl.text = "By proceeding with this booking, you accept the terms \n and conditions and www.akbartravels.com"
        lbl.numberOfLines = 2
        lbl.lineBreakMode =  .byWordWrapping
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    override func setupView() {
        self.addSubview(bgView)
        self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: bgView)
        self.addConstraintWithFormat(formate: "V:|-10-[v0]-10-|", views: bgView)
        self.setupCardView()
    }
    

    func setupCardView(){
        
        txtNameOnCard.delegate = self
        
        
        bgView.addSubview(txtCardNumber)
        bgView.addSubview(imgCardType)
        bgView.addSubview(txtNameOnCard)
        
        //these are button
        bgView.addSubview(btnExpiryMonth)
        btnExpiryMonth.addTarget(self, action: #selector(onTapExpiryMonth(_:)), for: .touchUpInside)
        bgView.addSubview(btnExpiryYear)
        btnExpiryYear.addTarget(self, action: #selector(onTapExpiryYear(_:)), for: .touchUpInside)
        
        self.btnExpiryYear.setAttributedTitle(self.setAttrText("Expiry Year", isPlaceHolder: true), for: .normal)
        self.btnExpiryMonth.setAttributedTitle(self.setAttrText("Expiry Month", isPlaceHolder: true), for: .normal)
        
        bgView.addSubview(txtCVV)
        bgView.addSubview(imgCVVNumber)
        bgView.addSubview(lblCVVGudeline)
        bgView.addSubview(btnInternationalBtn)
        bgView.addSubview(imgCardStrip)
        bgView.addSubview(lblTermsNConditions)
        
        configureTextField(txtCardNumber)
        configureTextField(txtNameOnCard)
        configureTextField(btnExpiryMonth)
        configureTextField(btnExpiryYear)
        configureTextField(txtCVV)
        
        bgView.addConstraintWithFormat(formate: "H:|-20-[v0]-10-[v1(40)]-10-|", views: txtCardNumber, imgCardType)
        bgView.addConstraintWithFormat(formate: "V:[v0(40)]", views: imgCardType)
        bgView.addConstraint(NSLayoutConstraint(item: imgCardType, attribute: .top, relatedBy: .equal, toItem: txtCardNumber, attribute: .top, multiplier: 1, constant: 0))
        
        bgView.addConstraintWithFormat(formate: "H:|-20-[v0]-20-|", views: txtNameOnCard)
        bgView.addConstraintWithFormat(formate: "H:|-20-[v0]-20-[v1(v0)]-20-|", views: btnExpiryMonth, btnExpiryYear)
        bgView.addConstraintWithFormat(formate: "H:|-20-[v0(100)]-[v1(60)]-5-[v2]|", views: txtCVV, imgCVVNumber, lblCVVGudeline)
        bgView.addConstraintWithFormat(formate: "H:|-20-[v0]-10-|", views: btnInternationalBtn)
        bgView.addConstraintWithFormat(formate: "H:|-20-[v0]-10-|", views: imgCardStrip)
        bgView.addConstraintWithFormat(formate: "H:|[v0]|", views: lblTermsNConditions)
        bgView.addConstraintWithFormat(formate: "V:[v0(40)]", views: btnExpiryYear)
        
        bgView.addConstraintWithFormat(formate: "V:|-20-[v0(40)]-20-[v1(40)]-20-[v2(40)]-20-[v3(40)]-20-[v4(50)]-20-[v5(30)]-[v6]-10-|", views: txtCardNumber, txtNameOnCard, btnExpiryMonth, txtCVV,btnInternationalBtn, imgCardStrip, lblTermsNConditions)
        
        bgView.addConstraint(NSLayoutConstraint(item: btnExpiryYear, attribute: .top, relatedBy: .equal, toItem: btnExpiryMonth, attribute: .top, multiplier: 1, constant: 0))
        
         bgView.addConstraint(NSLayoutConstraint(item: imgCVVNumber, attribute: .top, relatedBy: .equal, toItem: txtCVV, attribute: .top, multiplier: 1, constant: 0))
        
         bgView.addConstraint(NSLayoutConstraint(item: lblCVVGudeline, attribute: .top, relatedBy: .equal, toItem: txtCVV, attribute: .top, multiplier: 1, constant: 0))
         
    }
    
    func setAttrText(_ title: String, isPlaceHolder: Bool) -> NSAttributedString{
        
        if isPlaceHolder{
            return NSAttributedString(string: "\(title)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        }else{
            return NSAttributedString(string: "\(title)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        }
        
        
    }
    
    
    func configureTextField(_ txtField: UIView){
           
            let lineView = UIView()
            lineView.backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.5)
            txtField.addSubview(lineView)
            txtField.addConstraintWithFormat(formate: "H:|[v0]|", views: lineView)
            txtField.addConstraintWithFormat(formate: "V:[v0(1)]|", views: lineView)
           
       }
    
    @objc func onTapExpiryMonth(_ sender: UIButton){
        self.txtCardNumber.resignFirstResponder()
        self.txtNameOnCard.resignFirstResponder()
        self.endEditing(true)
        self.rootViewController?.onViewPopup(.EXP_MONTH)
    }
    
    @objc func onTapExpiryYear(_ sender: UIButton){
        self.txtCardNumber.resignFirstResponder()
        self.txtNameOnCard.resignFirstResponder()
        self.endEditing(true)
        self.rootViewController?.onViewPopup(.EXP_YEAR)
    }
    

}

extension CardCell :  UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Working...")
        return true
    }
    
}
