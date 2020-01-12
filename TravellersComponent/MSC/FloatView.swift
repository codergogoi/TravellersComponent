//
//  FloatView.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/4/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class FloatView: UIView {
    
    let axctionBtn: UIButton = {
        let btn = UIButton()
        
        return btn
    }()
    
    let btnFav: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    let lblTitle: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    
    let progressBar: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let btnClose: UIButton = {
        let btn = UIButton()
        
        return btn
    }()
    
    let lblDetails: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    let imgView: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    
    private func setupView(){
        
        
    }

    
    
}
