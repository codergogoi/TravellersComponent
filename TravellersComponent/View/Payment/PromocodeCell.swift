//
//  PromocodeCell.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/10/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class PromocodeCell : CollectionBaseCell {
    
   
    
    let lblPromocode: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.text = "Apply Promo Code"
        return lbl
    }()
    
    
    override func setupView() {
         
        self.addSubview(bgView)
        self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: bgView)
        self.addConstraintWithFormat(formate: "V:|-5-[v0]-5-|", views: bgView)
        
        setupPromoView()
        
    }
    
    func setupPromoView(){
        
        let promoImg = UIImageView(image: #imageLiteral(resourceName: "suitcase-2"))
        promoImg.contentMode = .scaleAspectFit
        
        let btnApplyPromo = UIButton(type: .custom)
        btnApplyPromo.setImage(#imageLiteral(resourceName: "suitcase-2"), for: .normal)
        btnApplyPromo.addTarget(self, action: #selector(onTapApplyPromo(_:)), for: .touchUpInside)
        bgView.addSubview(promoImg)
        bgView.addSubview(lblPromocode)
        bgView.addSubview(btnApplyPromo)
        
        bgView.addConstraintWithFormat(formate: "H:|-10-[v0(32)]-10-[v1]-10-[v2(40)]-20-|", views: promoImg,lblPromocode,btnApplyPromo)
        bgView.addConstraintWithFormat(formate: "V:[v0(32)]", views: promoImg)
        bgView.addConstraintWithFormat(formate: "V:[v0(32)]", views: lblPromocode)
        bgView.addConstraintWithFormat(formate: "V:[v0(40)]", views: btnApplyPromo)
        
        bgView.addConstraint(NSLayoutConstraint(item: promoImg, attribute: .centerY, relatedBy: .equal, toItem: bgView, attribute: .centerY, multiplier: 1, constant: 0))
        bgView.addConstraint(NSLayoutConstraint(item: lblPromocode, attribute: .centerY, relatedBy: .equal, toItem: bgView, attribute: .centerY, multiplier: 1, constant: 0))
       bgView.addConstraint(NSLayoutConstraint(item: btnApplyPromo, attribute: .centerY, relatedBy: .equal, toItem: bgView, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
    
    
    @objc func onTapApplyPromo(_ sender: UIButton){
        sender.onTapAnimation()
        
    }
    
    
}
