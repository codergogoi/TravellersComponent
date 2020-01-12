//
//  AppNavigation.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/24/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class AppNavigationBar: UIView {
    
    var title: String?{
        didSet{
            if let titleString = title{
                navTitle.text = titleString
            }
        }
    }
    
    let onTap : UIButton  = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "prev_arrow"), for: .normal)
        return btn
    }()
    
    let navTitle: UILabel = {
       
        let lbl = UILabel()
        lbl.font = UIFont.appBoldFont(fSize: 20)
        lbl.textColor = .white
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white 
        setupSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupSubView(){
        
        addSubview(onTap)
        addSubview(navTitle)
        
        addConstraintWithFormat(formate: "H:|-20-[v0(35)]-10-[v1]-|", views: onTap, navTitle)
        addConstraintWithFormat(formate: "V:[v0(35)]-10-|", views: onTap)
        addConstraintWithFormat(formate: "V:[v0(40)]", views: navTitle)
        
        addConstraint(NSLayoutConstraint(item: navTitle, attribute: .centerY, relatedBy: .equal, toItem: onTap, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
}
