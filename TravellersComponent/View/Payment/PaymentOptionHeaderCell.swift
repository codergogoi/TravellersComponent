//
//  PaymentOptionHeaderCell.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/16/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class PaymentOptionHeader : UICollectionReusableView {
    
    
    let lblPaymentOptions: UILabel = {
              let  lbl = UILabel()
              lbl.text = "Payment Options"
              lbl.font = UIFont.boldSystemFont(ofSize: 23)
              return lbl
      }()
      
      let lblSessionText: UILabel = {
          let  lbl = UILabel()
          lbl.text = "Session Will be Expired in 30 Minutes"
          lbl.textColor = .darkGray
          lbl.font = UIFont.systemFont(ofSize: 13)
         return lbl
     }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        self.setupTitleView()
    
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
       func setupTitleView(){
           
           self.addSubview(lblPaymentOptions)
           self.addSubview(lblSessionText)
           self.addConstraintWithFormat(formate: "V:|-10-[v0(40)][v1]", views: lblPaymentOptions,lblSessionText)
           self.addConstraintWithFormat(formate: "H:|-15-[v0]-15-|", views: lblPaymentOptions)
           self.addConstraintWithFormat(formate: "H:|-15-[v0]-15-|", views: lblSessionText)

       }
    
}
