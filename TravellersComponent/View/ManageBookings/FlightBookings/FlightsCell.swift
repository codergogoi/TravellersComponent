//
//  FlightsCell.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/31/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class FlightsCell: CollBaseCell {
    
    let lblBookingDate: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    let lblTripFromTo: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.text = "Ahmedabad -> Mumbai"
        lbl.textColor = .black
        return lbl
    }()
    
    let lblFirstPaxName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.text = "Test Test"
        lbl.textColor = .darkGray
        return lbl
    }()
    
    let lblAirlineName: UILabel = {
        let lbl = UILabel()
        lbl.text = "Go Air G8 234"
        return lbl
    }()
    
    let imgBookingTypeIcon: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = #imageLiteral(resourceName: "payzapp")
        return img
    }()
    
    let imgFlightIcon: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "payzapp")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let lblDepDateTime: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.text = "05:30 \nMon, oct 14, 19"
        lbl.numberOfLines = 2
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    let lblArrDateTime: UILabel = {
       let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.text = "23:30 \nMon, oct 14, 19"
        lbl.numberOfLines = 2
        lbl.lineBreakMode = .byWordWrapping
       return lbl
    }()
    
    let lblDuration: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        lbl.text = "1 h 20 m \n ----------------"
        lbl.textAlignment = .center
        lbl.numberOfLines = 2
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    let lblRefNumber: UILabel = {
        let lbl = UILabel()
        lbl.text = "REF NO. \nAT34765444"
        lbl.numberOfLines = 2
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    let lblBookingStatus: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textColor = .white
        lbl.text = "FAILD"
        lbl.textAlignment = .center
        return lbl
    }()
    
    let statusView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    override func setupView() {
        super.setupView()
        self.addSubview(lblBookingDate)
        self.addSubview(bgView)
        self.addConstraintWithFormat(formate: "V:|-15-[v0]-15-[v1]-10-|", views: lblBookingDate, bgView)
        self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: lblBookingDate)
        self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: bgView)
        self.lblBookingDate.attributedText = self.attributedDate(dateStr: "19 July 2019")
        self.setupLayout()
    }
    
    private func setupLayout(){
        
        bgView.addSubview(imgBookingTypeIcon)
        bgView.addSubview(statusView)
        bgView.addSubview(lblTripFromTo)
        bgView.addSubview(lblFirstPaxName)
        bgView.addSubview(lblAirlineName)
        bgView.addSubview(lblDepDateTime)
        bgView.addSubview(lblDuration)
        bgView.addSubview(lblArrDateTime)
        bgView.addSubview(imgFlightIcon)
        bgView.addSubview(lblRefNumber)
        
        let hrLine1 = UIView()
        hrLine1.backgroundColor = .lightGray
        bgView.addSubview(hrLine1)
        
        let hrLine2 = UIView()
        hrLine2.backgroundColor = .lightGray
        bgView.addSubview(hrLine2)
        
        bgView.addConstraintWithFormat(formate: "H:|-5-[v0(40)]-5-[v1]", views: imgBookingTypeIcon, lblTripFromTo)
        bgView.addConstraintWithFormat(formate: "H:[v0]", views: lblFirstPaxName)
        
        bgView.addConstraintWithFormat(formate: "H:[v0(80)]-10-|", views: statusView)
        bgView.addConstraintWithFormat(formate: "H:|[v0]|", views: hrLine1)
        bgView.addConstraintWithFormat(formate: "H:|-10-[v0]", views: lblAirlineName)
        bgView.addConstraintWithFormat(formate: "H:|-10-[v0(40)]-5-[v1(100)]-[v2]-[v3(100)]-10-|", views: imgFlightIcon, lblDepDateTime, lblDuration, lblArrDateTime)
        bgView.addConstraintWithFormat(formate: "H:|[v0]|", views: hrLine2)
        
        bgView.addConstraintWithFormat(formate: "H:[v0]-10-|", views: lblRefNumber)
        
        bgView.addConstraintWithFormat(formate: "V:|-10-[v0(30)][v1(15)]-10-[v2(1)]-20-[v3(20)]-[v4]-10-[v5(1)]-5-[v6(60)]-5-|", views: lblTripFromTo, lblFirstPaxName, hrLine1,lblAirlineName, lblDepDateTime, hrLine2, lblRefNumber)
       
        bgView.addConstraintWithFormat(formate: "V:[v0(40)]", views: imgBookingTypeIcon)
        bgView.addConstraintWithFormat(formate: "V:[v0(40)]", views: imgFlightIcon)
        bgView.addConstraintWithFormat(formate: "V:[v0(30)]", views: statusView)
        bgView.addConstraintWithFormat(formate: "V:[v0]", views: lblDuration)
        
        
        bgView.addConstraint(NSLayoutConstraint(item: imgBookingTypeIcon, attribute: .top, relatedBy: .equal, toItem: lblTripFromTo, attribute: .top, multiplier: 1, constant: 0))
        bgView.addConstraint(NSLayoutConstraint(item: statusView, attribute: .top, relatedBy: .equal, toItem: lblTripFromTo, attribute: .top, multiplier: 1, constant: 0))

        bgView.addConstraint(NSLayoutConstraint(item: imgFlightIcon, attribute: .top, relatedBy: .equal, toItem: lblDepDateTime, attribute: .top, multiplier: 1, constant: 0))
        bgView.addConstraint(NSLayoutConstraint(item: lblFirstPaxName, attribute: .left, relatedBy: .equal, toItem: lblTripFromTo, attribute: .left, multiplier: 1, constant: 0))
        bgView.addConstraint(NSLayoutConstraint(item: lblArrDateTime, attribute: .top, relatedBy: .equal, toItem: lblDepDateTime, attribute: .top, multiplier: 1, constant: 0))
        
        
        bgView.addConstraint(NSLayoutConstraint(item: lblDuration, attribute: .top, relatedBy: .equal, toItem: lblDepDateTime, attribute: .top, multiplier: 1, constant: 0))
         
        
    }

}


extension FlightsCell {
    
    private func attributedDate(dateStr: String) -> NSAttributedString {
           let attrString = NSMutableAttributedString()
           attrString.append(NSAttributedString(string: "Booked on - ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.darkGray]))
           attrString.append(NSAttributedString(string: "\(dateStr)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black]))
           return attrString
       }
    
}
