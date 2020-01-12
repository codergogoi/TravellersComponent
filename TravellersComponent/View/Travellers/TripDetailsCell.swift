//
//  TripDetailsCell.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/5/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class TripDetailsCell : CollectionBaseCell {
        
    var didTap:(()->())?

    let lblTripInfo:  UILabel = {
        let lbl = UILabel()
        lbl.text = "Kolkata -> Delhi"
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    }()
    
    let lblDateNPaxInfo:  UILabel = {
        let lbl = UILabel()
        lbl.text = "5 Dec 2019 6 Travellers"
        lbl.font = UIFont.systemFont(ofSize: 13)
        return lbl
    }()
    
    override func setupView() {
        self.addSubview(bgView)
        self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: bgView)
        self.addConstraintWithFormat(formate: "V:|-5-[v0]-5-|", views: bgView)
        
        let btn  = UIButton()
        let attrText = NSAttributedString(string: "VIEW DETAILS", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.rgba(r: 37, g: 72, b: 134, a: 1)])
        
        btn.setAttributedTitle(attrText, for: .normal)
        btn.addTarget(self, action: #selector(onTapDetails(_:)), for: .touchUpInside)
        
        self.bgView.addSubview(btn)
        self.bgView.addSubview(lblTripInfo)
        self.bgView.addSubview(lblDateNPaxInfo)
            
        self.bgView.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: lblTripInfo)
        self.bgView.addConstraintWithFormat(formate: "H:|-10-[v0]", views: lblDateNPaxInfo)
        self.bgView.addConstraintWithFormat(formate: "V:|-10-[v0]-5-[v1(15)]", views: lblTripInfo, lblDateNPaxInfo)
        self.bgView.addConstraintWithFormat(formate: "H:[v0(130)]|", views: btn)
        self.bgView.addConstraintWithFormat(formate: "V:[v0(40)]-10-|", views: btn)
        
    }
    
    @objc func onTapDetails(_ sender: UIButton){
        sender.onTapAnimation()
        self.didTap?()
        
    }
    

}

