//
//  PaymentOptionCell.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/9/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

//For display Purpose
enum PaymentType: String {
    case CC = "Credit Card"
    case DC = "Debit Card for Me"
    case UPI = "UPI"
    case NB = "Net Banking"
    case CCEMI = "Credit Card EMI"
    case WALET = "Wallet"
    case PAYPAL = "Paypal"
    case PHONEPE = "Phonepe"
    case AMZ = "Amaxon Pay Payment"
    case FCA = "Free Charge"
    case MBK = "Mobikwik"
    case PYU = "Payu Money"
    case PZA = "PayZAP"
}

// options
enum Gateway: String{
    case CC_PAYU
    case DC_PAYU
    case CC_RZR
    case DC_RZR
    case UPI_PAYU
    case UPI_RZR
    case NB_PAYU
    case NB_CCA
    case NB_RZR
    case MBK
    case PAYPAL
    case PHONEPE
    case EMI
    case AMZ
    case FCA
    case PYU
    case PZA
    
}

struct PaymentOption {

    var type: PaymentType
    var options: [Gateway]
    var icon: UIImage?
}


class PaymentOptionCell: CollectionBaseCell {
    
    var didTap:((PaymentOption?)->())?
    
    var dataModel: PaymentOption?{
        didSet{
            if let dataModel = self.dataModel{
                self.lblPaymentType.text = dataModel.type.rawValue
                self.imgPaymentIcon.image = dataModel.icon
            }
        }
    }
    
    var isLast: Bool = false {
        didSet{
            if self.isLast{
                DispatchQueue.main.async {
                    self.bgView.customCorner(corners: [.bottomLeft, .bottomRight], radius: 10)
                }
            }
        }
    }
    
    var isFirst: Bool = false{
        didSet{
            if self.isFirst{
                DispatchQueue.main.async {
                    self.bgView.customCorner(corners: [.topLeft, .topRight], radius: 10)
                }
            }
        }
    }
    

    let imgPaymentIcon: UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "net-banking"))
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let imgCheckIcon: UIImageView = {
          let imgView = UIImageView(image: #imageLiteral(resourceName: "radio_normal"))
          imgView.contentMode = .scaleAspectFit
          return imgView
    }()
        
    
    let lblPaymentType: UILabel = {
        let lbl = UILabel()
        lbl.text = "Credit Card"
        lbl.font = UIFont.systemFont(ofSize: 16)
        return lbl
    }()
    
    override func setupView() {
        
        backgroundColor = .clear
        
        bgView.layer.cornerRadius = 0
        
        self.addSubview(bgView)
        
        self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: bgView)
        
        self.addConstraintWithFormat(formate: "V:|[v0]|", views: bgView)
        
        bgView.addSubview(imgPaymentIcon)
        bgView.addSubview(lblPaymentType)
        bgView.addSubview(imgCheckIcon)
        bgView.addConstraintWithFormat(formate: "H:|-20-[v0(32)]-10-[v1]-[v2(20)]-10-|", views: imgPaymentIcon, lblPaymentType, imgCheckIcon)
        bgView.addConstraintWithFormat(formate: "V:|[v0]|", views: imgPaymentIcon)
        bgView.addConstraintWithFormat(formate: "V:|[v0]|", views: lblPaymentType)
        bgView.addConstraintWithFormat(formate: "V:|[v0]|", views: imgCheckIcon)
        
        bgView.addConstraint(NSLayoutConstraint(item: imgPaymentIcon, attribute: .centerY, relatedBy: .equal, toItem: bgView, attribute: .centerY, multiplier: 1, constant: 0))
        bgView.addConstraint(NSLayoutConstraint(item: lblPaymentType, attribute: .centerY, relatedBy: .equal, toItem: bgView, attribute: .centerY, multiplier: 1, constant: 0))
        bgView.addConstraint(NSLayoutConstraint(item: imgCheckIcon, attribute: .centerY, relatedBy: .equal, toItem: bgView, attribute: .centerY, multiplier: 1, constant: 0))
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapSelectPaymentOption))
        self.bgView.addGestureRecognizer(tapGesture)
        
     }
    
    @objc func onTapSelectPaymentOption(){
        self.onTapAnimation()
        self.didTap?(self.dataModel)
        
    }
    
}
 

