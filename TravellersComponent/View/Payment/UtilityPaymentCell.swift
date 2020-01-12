//
//  UtilityPaymentCell.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/13/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class UtilityPaymentCell : CollectionBaseCell {
    
    override func setupView() {
          self.addSubview(bgView)
          self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: bgView)
          self.addConstraintWithFormat(formate: "V:|-10-[v0]-10-|", views: bgView)
    }
    
}

