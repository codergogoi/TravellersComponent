//
//  LocationPermissionViewController.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/20/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class LocationPermissionViewController: UIViewController {
    
   
    
    let imgLocationIcon: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let lblNotificationTitle:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        return lbl
    }()
    
    let lblWhyNeedPermission: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16)
        return lbl
    }()
    
    let btnAllow: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    let btnShowMeMore: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
    }
    
    
    
    fileprivate func setupView(){
        
        
    }
    
}
