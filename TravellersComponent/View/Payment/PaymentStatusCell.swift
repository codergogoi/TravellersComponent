//
//  PaymentStatusCell.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/13/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit


struct PaymentStatus {
    
    var refNumber: String
    var fare: String // with Currency Icon
    var status: Bool // success  = true // false
    var payThrough: String = "Credit Card"
    var isOnProgress: Bool = false
    
}

struct BookingProgress{
    
    var refNumber: String
    var status: Bool
}



class PaymentStatusCell : CollectionBaseCell {
    
    var status:  PaymentStatus? {
        didSet{
            if let status = self.status{
                self.updateSuccessFail(currentStatus: status)
            }
        }
    }
    
    let statusView: UIView = {
        let view = UIView()
        DispatchQueue.main.async {
          view.customCorner(corners: [.topLeft, .topRight], radius: 5)
       }
        view.layer.backgroundColor = UIColor.rgba(r: 211, g: 47, b: 47, a: 1).cgColor

        return view
    }()
    
    let statusIcon: UIImageView = {
        let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "payment_failed")
        return imgView
    }()
    
    let lblPaymentStatus: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 28)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let lblRefNumber: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    override func setupView() {
        self.addSubview(bgView)
       
        self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: bgView)
        self.addConstraintWithFormat(formate: "V:|-10-[v0]-10-|", views: bgView)
        setupContentWithInformation()
    }
    
    //MARK: - SetupContentView
    fileprivate func setupContentWithInformation(){
        
          bgView.addSubview(statusView)
          bgView.addSubview(lblRefNumber)
          bgView.addConstraintWithFormat(formate: "H:|[v0]|", views: lblRefNumber)
          bgView.addConstraintWithFormat(formate: "H:|[v0]|", views: statusView)
          bgView.addConstraintWithFormat(formate: "V:|[v0(100)][v1]-20-|", views: statusView,lblRefNumber)
          statusView.addSubview(statusIcon)
          statusView.addSubview(lblPaymentStatus)
          
          let closeBtn = UIButton()
          let attachment = NSTextAttachment()
          let image = UIImage(imageLiteralResourceName: "close")
          attachment.image = image.withRenderingMode(.alwaysOriginal)
          attachment.bounds = CGRect(x: 0, y: 0, width: 28, height: 28)
          closeBtn.setAttributedTitle( NSAttributedString(attachment: attachment), for: .normal)
          
          statusView.addSubview(closeBtn)
          closeBtn.addTarget(self, action: #selector(onTapCloseBtn(_:)), for: .touchUpInside)
          
          statusView.addConstraintWithFormat(formate: "H:[v0(42)]-10-|", views: closeBtn)
          statusView.addConstraintWithFormat(formate: "V:|-10-[v0(42)]", views: closeBtn)
          statusView.addConstraintWithFormat(formate: "V:[v0(30)]", views: lblPaymentStatus)
          statusView.addConstraint(NSLayoutConstraint(item:lblPaymentStatus, attribute: .centerY, relatedBy: .equal, toItem: statusView, attribute: .centerY, multiplier: 1, constant: 0))
          statusView.addConstraint(NSLayoutConstraint(item:lblPaymentStatus, attribute: .centerX, relatedBy: .equal, toItem: statusView, attribute: .centerX, multiplier: 1, constant: 0))

          statusView.addConstraintWithFormat(formate: "H:[v0]", views: lblPaymentStatus)
          statusView.addConstraintWithFormat(formate: "H:[v0(40)]", views: statusIcon)
          statusView.addConstraintWithFormat(formate: "V:[v0(40)]", views: statusIcon)
          statusView.addConstraint(NSLayoutConstraint(item: statusIcon, attribute: .left, relatedBy: .equal, toItem: lblPaymentStatus, attribute: .left, multiplier: 1, constant: -52))
          statusView.addConstraint(NSLayoutConstraint(item: statusIcon, attribute: .centerY, relatedBy: .equal, toItem: lblPaymentStatus, attribute: .centerY, multiplier: 1, constant: 0))
       
    }
    
    fileprivate func updateSuccessFail(currentStatus: PaymentStatus){
        
        if currentStatus.status{
            self.statusIcon.image = #imageLiteral(resourceName: "payment_success")
            self.statusView.layer.backgroundColor = UIColor.rgba(r: 63, g: 140, b: 76, a: 1).cgColor
            self.lblPaymentStatus.text = "Transaction Successful"
            self.lblPaymentStatus.font = UIFont.boldSystemFont(ofSize: 23)
            self.lblRefNumber.attributedText = self.attrrString(refNumber: "\(currentStatus.refNumber)", fare: "\(currentStatus.fare)", status: true, paythrough: "Credit Card")
        }else{
            self.statusView.layer.backgroundColor = UIColor.rgba(r: 211, g: 47, b: 47, a: 1).cgColor
            self.lblPaymentStatus.text = "Payment Failed!"
            self.lblRefNumber.attributedText = self.attrrString(refNumber: "\(currentStatus.refNumber)", fare: "\(currentStatus.fare)")
        }
        
    }
    
    
    fileprivate func attrrString(refNumber: String, fare: String, status: Bool = false, paythrough: String = "") -> NSAttributedString {
        
        let attrText = NSMutableAttributedString()
        
        if status { // success
            attrText.append(NSAttributedString(string: "Thank you. We have received your payment.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.darkGray]))
            
            attrText.append(NSAttributedString(string: "\n\nFare\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.darkGray]))
            attrText.append(NSAttributedString(string: "\(fare)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 40)]))
            attrText.append(NSAttributedString(string: "\nPaid Through \(paythrough).", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.darkGray]))
            
            attrText.append(NSAttributedString(string: "\n\n\nTrip ID: \(refNumber).", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.darkGray]))
            
        }else{ // fail
            attrText.append(NSAttributedString(string: "Reference number\n", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]))

           attrText.append(NSAttributedString(string: "\(refNumber)\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.rgba(r: 172, g: 24, b: 19, a: 1)]))
           attrText.append(NSAttributedString(string: "\nOops! There was a problem with your \n payment. You have not been charged.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]))

           attrText.append(NSAttributedString(string: "\n\nDon't like waiting? Give us a call\n", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]))

           attrText.append(NSAttributedString(string: "+91 2240 666 444", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)]))
           attrText.append(NSAttributedString(string: "\n\nFare\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.darkGray]))
            attrText.append(NSAttributedString(string: "\(fare)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)]))

        }
       
        return attrText
        
    }
    
    
    
    //MARK: - onTap Actions
    
    @objc func onTapCloseBtn(_ sender: UIButton){
        sender.onTapAnimation()
        
    }
    
    
    
    
}
