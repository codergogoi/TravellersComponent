//
//  ReturnFullView.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 1/6/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class ReturnFullView: UIView {
    
     // set value to the label and Image from Struct on didSet
     var dataModel: FlightCollapseData? {
         
         didSet{
             
             if let dataModel = self.dataModel{
                 self.lblFlightName.attributedText = self.flightAttrText(flightName: "Indigo", flightNumber: "6E-2453")
                 self.lblDepTime.text = dataModel.depTime
                 self.lblArrTime.text = dataModel.arrTime
                 self.lblPrice.text = dataModel.price
             }
         }
         
     }
    
     
     let lblFlightName: UILabel = { // flight name and Number
         let lbl = UILabel()
         return lbl
     }()
    
    
    let lblPromoCode: UILabel = {
        let lbl = UILabel()
        lbl.text = "Promo ARFLY"
        lbl.font = UIFont.appBoldFont(fSize: 12)
        lbl.textColor = .green
        return lbl
    }()
    
    let imgAirlineIcon: UIImageView = {
            let imgView = UIImageView()
            imgView.image = #imageLiteral(resourceName: "G8")
            imgView.contentMode = .scaleAspectFill
            return imgView
        }()
    
     let lblDepTime: UILabel = {
         let lbl = UILabel()
         lbl.text  = "20:20"
         lbl.lineBreakMode = .byWordWrapping
         lbl.font = UIFont.appBoldFont(fSize: 16)
         return lbl
     }()
     
     let lblArrTime: UILabel = {
        let lbl = UILabel()
        lbl.text  = "15:45"
        lbl.font = UIFont.appBoldFont(fSize: 16)
        return lbl
    }()
    
    let lblDuration: UILabel = { // attributed
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 3
        return lbl
    }()
    
    let lblFromAirport: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.appFont(fSize: 16)
        lbl.text = "AMD"
        lbl.textColor = .black
        return lbl
    }()
        
    let lblToAirport: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.appFont(fSize: 16)
        lbl.text = "BOM"
        lbl.textColor = .black
        return lbl
    }()
    
    let imgMealIcon: UIImageView = {
        let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "free_meal")
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let lblGrossPrice: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.appFont(fSize: 14)
        lbl.textColor = .black
        return lbl
    }()
    
     let lblPrice: UILabel = {
         let lbl = UILabel()
         lbl.text = "₹ 2000"
         lbl.font = UIFont.appBoldFont(fSize: 20)
         return lbl
     }()
     
     
     override init(frame: CGRect) {
         super.init(frame: frame)
        self.setupView()

     }
      
     
     func setupView(){
        
        let liveView = UILabel()
        liveView.text = "-----------------------------------------"
        liveView.textColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.2)
        liveView.lineBreakMode = .byClipping
        liveView.numberOfLines = 1
        
        addSubview(lblFlightName)
        addSubview(lblPromoCode)
        addSubview(imgAirlineIcon)
        addSubview(lblDepTime)
        addSubview(lblArrTime)
        addSubview(lblFromAirport)
        addSubview(lblToAirport)
        addSubview(lblDuration)
        addSubview(liveView)
        addSubview(lblGrossPrice)
        addSubview(lblPrice)
        
        //setup label data
        self.lblFlightName.attributedText = self.flightAttrText(flightName: "Indigo", flightNumber: "6E-2453")
        self.lblDuration.attributedText = self.durationAttrText(duration: "01h 20m", stopInfo: "Non Stop")
         
        addConstraintWithFormat(formate: "H:|-10-[v0]", views: lblFlightName)
        addConstraintWithFormat(formate: "H:[v0]-10-|", views: lblPromoCode)
        addConstraintWithFormat(formate: "H:|-5-[v0(40)]-5-[v1]", views: imgAirlineIcon, lblDepTime)
        addConstraintWithFormat(formate: "H:[v0]-10-|", views: lblArrTime)
        addConstraintWithFormat(formate: "H:|[v0]|", views: liveView)
        addConstraintWithFormat(formate: "H:[v0]-10-|", views:lblGrossPrice)
        addConstraintWithFormat(formate: "H:[v0]-10-|", views:lblPrice)
        addConstraintWithFormat(formate: "H:[v0]", views: lblDuration)
        addConstraintWithFormat(formate: "H:[v0]", views: lblToAirport)
        addConstraintWithFormat(formate: "H:[v0]", views: lblFromAirport)

        
        addConstraintWithFormat(formate: "V:|-10-[v0(20)]-10-[v1(40)]-[v2(10)]", views:lblFlightName, imgAirlineIcon,liveView)
        addConstraintWithFormat(formate: "V:[v0]", views: lblFromAirport)
        addConstraintWithFormat(formate: "V:[v0]", views: lblToAirport)
        addConstraintWithFormat(formate: "V:[v0]", views: lblDuration)
        addConstraintWithFormat(formate: "V:|-10-[v0]", views: lblPromoCode)
        addConstraintWithFormat(formate: "V:[v0]", views: lblGrossPrice)
        addConstraintWithFormat(formate: "V:[v0]-10-|", views: lblPrice)
    
        addConstraint(NSLayoutConstraint(item: lblDuration, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: lblDuration, attribute: .top, relatedBy: .equal, toItem: imgAirlineIcon, attribute: .top, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: lblDepTime, attribute: .top, relatedBy: .equal, toItem: imgAirlineIcon, attribute: .top, multiplier: 1, constant: 0))
         addConstraint(NSLayoutConstraint(item: lblArrTime, attribute: .top, relatedBy: .equal, toItem: imgAirlineIcon, attribute: .top, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: lblFromAirport, attribute: .left, relatedBy: .equal, toItem: lblDepTime, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: lblToAirport, attribute: .left, relatedBy: .equal, toItem: lblArrTime, attribute: .left, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: lblFromAirport, attribute: .topMargin, relatedBy: .equal, toItem: lblDepTime, attribute: .topMargin, multiplier: 1, constant: 20))
        
        addConstraint(NSLayoutConstraint(item: lblToAirport, attribute: .topMargin, relatedBy: .equal, toItem: lblArrTime, attribute: .topMargin, multiplier: 1, constant: 20))
        
        
     }
    
    
    private func flightAttrText(flightName: String, flightNumber: String) ->  NSAttributedString {
        
        let attrString = NSMutableAttributedString()
        attrString.append(NSAttributedString(string: flightName, attributes: [NSAttributedString.Key.font: UIFont.appFont(fSize: 18)]))
        attrString.append(NSAttributedString(string: " | \(flightNumber)", attributes: [NSAttributedString.Key.font: UIFont.appFont(fSize: 13), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        return attrString
    }
    
    private func durationAttrText(duration: String, stopInfo: String) ->  NSAttributedString {
           let attrString = NSMutableAttributedString()
            attrString.append(NSAttributedString(string: duration, attributes: [NSAttributedString.Key.font: UIFont.appFont(fSize: 14)]))
        attrString.append(NSAttributedString(string: "\n- - - - - - - - - \n", attributes: [NSAttributedString.Key.font: UIFont.appFont(fSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
            attrString.append(NSAttributedString(string: "\(stopInfo)", attributes: [NSAttributedString.Key.font: UIFont.appFont(fSize: 12), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
           return attrString
       }
    
     
     required init?(coder: NSCoder) {
         super.init(coder: coder)
     }
     
    
    
}
