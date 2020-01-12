//
//  AvailableOption.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/20/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit


struct AvailableOption: Equatable {
    
    var identifier: String
    var cellHeight: CGFloat
    var Celltype: CellType
    var isPaymentCell = false
    
    static func ==(lhs: AvailableOption, rhs: AvailableOption) -> Bool {
        return lhs.Celltype == rhs.Celltype
    }
    
}
