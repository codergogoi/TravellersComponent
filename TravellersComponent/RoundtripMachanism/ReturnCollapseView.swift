//
//  ReturnCollapseView.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 1/6/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


struct FlightCollapseData {
    
    var flightName: String
    var depTime: String
    var arrTime: String
    var price: String
    
}

class ReturnCollapseView : UIView {
    
    // set value to the label and Image from Struct on didSet
    var dataModel: FlightCollapseData? {
        
        didSet{
            
            if let dataModel = self.dataModel{
                
                self.lblFlightName.text = dataModel.flightName
                self.lblDepTime.text = dataModel.depTime
                self.lblArrTime.text = dataModel.arrTime
                self.lblPrice.text = dataModel.price
                
            }
        }
        
    }
    
    
    let lblFlightName: UILabel = {
        let lbl = UILabel()
        lbl.text = "SpiceJet"
        lbl.font = UIFont.appFont(fSize: 18)
        return lbl
    }()
    
    let lblDepTime: UILabel = {
        let lbl = UILabel()
        lbl.text  = "20:20"
        lbl.lineBreakMode = .byWordWrapping
        lbl.font = UIFont.appFont(fSize: 16)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let lblArrTime: UILabel = {
       let lbl = UILabel()
       lbl.text  = "15:45"
       lbl.lineBreakMode = .byWordWrapping
        lbl.font = UIFont.appFont(fSize: 16)
       lbl.numberOfLines = 0
       return lbl
   }()
    
    let imgAirlineIcon: UIImageView = {
        let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "G8")
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    let lblPrice: UILabel = {
        let lbl = UILabel()
        lbl.text = "₹ 2000"
        lbl.font = UIFont.appBoldFont(fSize: 20)
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, isReturn: Bool) {
        super.init(frame: frame)
        self.setupView(isReturn)
        
    }
    
    func setupView(_ isReturn: Bool){
        
        let lineLbl = UILabel()
        lineLbl.text = "-------------------"
        lineLbl.textColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.2)
        
        self.addSubview(lineLbl)
        self.addSubview(lblFlightName)
        self.addSubview(lblDepTime)
        self.addSubview(lblArrTime)
        self.addSubview(imgAirlineIcon)
        self.addSubview(lblPrice)
        
        self.addConstraintWithFormat(formate: "H:[v0]", views: lblArrTime)
        self.addConstraintWithFormat(formate: "V:[v0]", views: lblArrTime)
        
        
        if(isReturn){ // all left
            lblFlightName.textAlignment = .left
            lblPrice.textAlignment = .left
            self.addConstraintWithFormat(formate: "H:|[v0]", views: lineLbl)
            self.addConstraintWithFormat(formate: "H:|-10-[v0]", views: lblPrice)
            self.addConstraintWithFormat(formate: "V:[v0][v1]-10-|", views: lineLbl,lblPrice)
            self.addConstraintWithFormat(formate: "H:|-10-[v0]", views: lblFlightName)
            self.addConstraintWithFormat(formate: "V:|-10-[v0]-10-[v1(40)]", views: lblFlightName, imgAirlineIcon)
            self.addConstraintWithFormat(formate: "H:|-10-[v0(40)]-10-[v1]", views: imgAirlineIcon, lblDepTime)
           
            self.addConstraint(NSLayoutConstraint(item: lblDepTime, attribute: .top, relatedBy: .equal, toItem: imgAirlineIcon, attribute: .top, multiplier: 1, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: lblArrTime, attribute: .left, relatedBy: .equal, toItem: lblDepTime, attribute: .left, multiplier: 1, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: lblArrTime, attribute: .bottom, relatedBy: .equal, toItem: lblDepTime, attribute: .bottom, multiplier: 1, constant: 20))
            
            
        }else{ // all right
            lblFlightName.textAlignment = .right
            lblPrice.textAlignment = .right
            self.addConstraintWithFormat(formate: "H:[v0]|", views: lineLbl)
            self.addConstraintWithFormat(formate: "H:[v0]-10-|", views: lblPrice)
            self.addConstraintWithFormat(formate: "V:[v0][v1]-10-|", views: lineLbl,lblPrice)
            self.addConstraintWithFormat(formate: "H:[v0]-10-|", views: lblFlightName)
            self.addConstraintWithFormat(formate: "V:|-10-[v0]-10-[v1(40)]", views: lblFlightName, imgAirlineIcon)
            self.addConstraintWithFormat(formate: "H:[v1]-10-[v0(40)]-10-|", views: imgAirlineIcon, lblDepTime)
            self.addConstraint(NSLayoutConstraint(item: lblDepTime, attribute: .top, relatedBy: .equal, toItem: imgAirlineIcon, attribute: .top, multiplier: 1, constant: 0))
            
            self.addConstraint(NSLayoutConstraint(item: lblArrTime, attribute: .left, relatedBy: .equal, toItem: lblDepTime, attribute: .left, multiplier: 1, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: lblArrTime, attribute: .bottom, relatedBy: .equal, toItem: lblDepTime, attribute: .bottom, multiplier: 1, constant: 20))
        }
        
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
}

