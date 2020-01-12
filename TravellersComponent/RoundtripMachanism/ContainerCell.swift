//
//  ContainerCell.swift
//  LoaderView
//
//  Created by JAYANTA GOGOI on 11/28/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class ContainerCell:  CollectionBaseCell {
    
    weak var rootViewController: RoundTripViewController?
    
    let topView: UIView = {
        let v = UIView()
        return v
    }()
    
    let bottomView: UIView = {
       let v = UIView()
       return v
           
    }()
    
    
    //Onward and Return Container
    let onwardView: OnwardContainer = {
        let view = OnwardContainer(frame: CGRect.zero)
        return view
    }()
    
    let returnView: ReturnContainer = {
       let view = ReturnContainer(frame: CGRect.zero)
        return view
    }()
    
    let tripView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    var lblOnwardWidthConst = NSLayoutConstraint()
    
    let lblOnwardInfo: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
   
    let lblReturnInfo: UILabel = {
           let lbl = UILabel()
           return lbl
    }()
    
    //Buttons User the Existing Logics for View Logic
    
    
    let btnOnwardTime: UIButton = {
        let btn = UIButton()
        let attrString = NSMutableAttributedString()
        attrString.append(NSAttributedString(string: "TIME", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black] ))
        btn.setAttributedTitle(attrString, for: .normal)
        return btn
    }()
    
    let btnOnwardDuration: UIButton = {
        let btn = UIButton()
        let attrString = NSMutableAttributedString()
        attrString.append(NSAttributedString(string: "DURATION", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black] ))
        btn.setAttributedTitle(attrString, for: .normal)
        return btn
    }()
    
    let btnOnwardPrice: UIButton = {
        let btn = UIButton()
        let attrString = NSMutableAttributedString()
       attrString.append(NSAttributedString(string: "PRICE", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black] ))
       btn.setAttributedTitle(attrString, for: .normal)
       return btn
    }()
    
    let btnReturnTime: UIButton = {
        let btn = UIButton()
        let attrString = NSMutableAttributedString()
       attrString.append(NSAttributedString(string: "TIME", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black] ))
       btn.setAttributedTitle(attrString, for: .normal)
       return btn
       }()
    
    let btnReturnDuration: UIButton = {
       let btn = UIButton()
        let attrString = NSMutableAttributedString()
       attrString.append(NSAttributedString(string: "DURATION", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black] ))
       btn.setAttributedTitle(attrString, for: .normal)
       return btn
    }()
   
    let btnReturnPrice: UIButton = {
       let btn = UIButton()
       let attrString = NSMutableAttributedString()
       attrString.append(NSAttributedString(string: "PRICE", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black] ))
       btn.setAttributedTitle(attrString, for: .normal)
       return btn
    }()
    

    func attrTitleSet(_ title: String) -> NSAttributedString {
        
        let attrString = NSMutableAttributedString()
        attrString.append(NSAttributedString(string: title.uppercased(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.black] ))
        
        return attrString
    }
    
    @objc func onTapButton(_ sender: UIButton){
        sender.onTapAnimation()
        
    }
    
    override func setupView() {
        super.setupView()
        self.addSubview(topView)
        self.addSubview(bottomView)
        self.bottomView.addSubview(onwardView)
        self.bottomView.addSubview(returnView)
        self.addConstraintWithFormat(formate: "H:|[v0]|", views: topView)
        self.addConstraintWithFormat(formate: "H:|[v0]|", views: bottomView)
        self.addConstraintWithFormat(formate: "V:|[v0(110)][v1]|", views: topView,bottomView)
        self.bottomView.addConstraintWithFormat(formate: "H:|[v0][v1(v0)]|", views: onwardView, returnView)
        self.bottomView.addConstraintWithFormat(formate: "V:|[v0]|", views: onwardView)
        self.bottomView.addConstraintWithFormat(formate: "V:|[v0]|", views: returnView)
        
        setupTopView()
        setupTripView()
        
    }
    
    func setupTopView(){
        
        tripView.backgroundColor = .white
        
        topView.addSubview(tripView)
        
        let onwardDurationView = UIView(frame: CGRect.zero)
        topView.addSubview(onwardDurationView)
        
        let returnDurationView = UIView(frame: CGRect.zero)
       topView.addSubview(returnDurationView)
        
        self.topView.addConstraintWithFormat(formate: "H:|[v0]|", views: tripView)
        self.topView.addConstraintWithFormat(formate: "H:|[v0]-10-[v1(v0)]|", views: onwardDurationView,returnDurationView)
        self.topView.addConstraintWithFormat(formate: "V:|[v0]-5-[v1(46)]-5-|", views: tripView, onwardDurationView)
        self.topView.addConstraintWithFormat(formate: "V:[v0(v1)]", views: returnDurationView, onwardDurationView)
        self.topView.addConstraint(NSLayoutConstraint(item: returnDurationView, attribute: .top, relatedBy: .equal, toItem: onwardDurationView, attribute: .top, multiplier: 1, constant: 0))
        
        onwardDurationView.addSubview(btnOnwardTime)
        onwardDurationView.addSubview(btnOnwardDuration)
        onwardDurationView.addSubview(btnOnwardPrice)
        
        btnOnwardTime.addTarget(self, action: #selector(onTapButton(_:)), for: .touchUpInside)
        btnOnwardDuration.addTarget(self, action: #selector(onTapButton(_:)), for: .touchUpInside)
        btnOnwardPrice.addTarget(self, action: #selector(onTapButton(_:)), for: .touchUpInside)
        
        onwardDurationView.addConstraintWithFormat(formate: "V:|[v0]|", views: btnOnwardTime)
        onwardDurationView.addConstraintWithFormat(formate: "V:|[v0]|", views: btnOnwardDuration)
        onwardDurationView.addConstraintWithFormat(formate: "V:|[v0]|", views: btnOnwardPrice)
        
        onwardDurationView.addConstraintWithFormat(formate: "H:|-10-[v0][v1(v0)][v2(v1)]-10-|", views: btnOnwardTime, btnOnwardDuration, btnOnwardPrice)
        
        returnDurationView.addSubview(btnReturnTime)
        returnDurationView.addSubview(btnReturnDuration)
        returnDurationView.addSubview(btnReturnPrice)
        
        btnReturnTime.addTarget(self, action: #selector(onTapButton(_:)), for: .touchUpInside)
        btnReturnDuration.addTarget(self, action: #selector(onTapButton(_:)), for: .touchUpInside)
        btnReturnPrice.addTarget(self, action: #selector(onTapButton(_:)), for: .touchUpInside)
               
        returnDurationView.addConstraintWithFormat(formate: "V:|[v0]|", views: btnReturnTime)
        returnDurationView.addConstraintWithFormat(formate: "V:|[v0]|", views: btnReturnDuration)
        returnDurationView.addConstraintWithFormat(formate: "V:|[v0]|", views: btnReturnPrice)
       
        returnDurationView.addConstraintWithFormat(formate: "H:|-10-[v0][v1(v0)][v2(v1)]-10-|", views: btnReturnTime, btnReturnDuration, btnReturnPrice)
        
    }
    
    
    func setupTripView(){
        
        let onwardTripView = UIView()
        let returnTripViw = UIView()
        
        self.tripView.addSubview(onwardTripView)
        self.tripView.addSubview(returnTripViw)
        
        self.tripView.addConstraintWithFormat(formate: "H:|[v0]-10-[v1(v0)]|", views: onwardTripView, returnTripViw)
        self.tripView.addConstraintWithFormat(formate: "V:|[v0]|", views: onwardTripView)
        self.tripView.addConstraintWithFormat(formate: "V:|[v0]|", views: returnTripViw)
        
        //Onward Trip Information
        let onwardButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 32))
        onwardButton.backgroundColor = .black
        onwardButton.setAttributedTitle(NSAttributedString(string: "ONWARD", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]), for: .normal)
        onwardButton.layer.cornerRadius = 3
        onwardTripView.addSubview(onwardButton)
        
        lblOnwardInfo.text = "BOM - AMD, Wed 25 Dec"
        lblOnwardInfo.font = UIFont.systemFont(ofSize: 15)
        onwardTripView.addSubview(lblOnwardInfo)
        
        onwardTripView.addConstraintWithFormat(formate: "H:[v0(80)]-10-[v1]-5-|", views: onwardButton,lblOnwardInfo)
        onwardTripView.addConstraintWithFormat(formate: "V:[v0(28)]", views: onwardButton)
        onwardTripView.addConstraintWithFormat(formate: "V:[v0]", views: lblOnwardInfo)

        self.lblOnwardWidthConst = lblOnwardInfo.widthAnchor.constraint(equalToConstant: 180)
        lblOnwardInfo.addConstraint(self.lblOnwardWidthConst)
        
        onwardTripView.addConstraint(NSLayoutConstraint(item: onwardButton, attribute: .centerY, relatedBy: .equal, toItem: onwardTripView, attribute: .centerY, multiplier: 1, constant: 0))
        onwardTripView.addConstraint(NSLayoutConstraint(item: lblOnwardInfo, attribute: .centerY, relatedBy: .equal, toItem: onwardTripView, attribute: .centerY, multiplier: 1, constant: 0))
        
        //Return Trip  Information
        
        let returnButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 32))
       returnButton.backgroundColor = .black
       returnButton.setAttributedTitle(NSAttributedString(string: "RETURN", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]), for: .normal)
       returnButton.layer.cornerRadius = 3
       returnTripViw.addSubview(returnButton)
       
        //set data
       lblReturnInfo.text = "BOM - AMD, Wed 25 Dec"
       lblReturnInfo.font = UIFont.systemFont(ofSize: 15)
       returnTripViw.addSubview(lblReturnInfo)
       
       returnTripViw.addConstraintWithFormat(formate: "H:|-10-[v0(80)]-10-[v1]|", views: returnButton,lblReturnInfo)
       returnTripViw.addConstraintWithFormat(formate: "V:[v0(28)]", views: returnButton)
       returnTripViw.addConstraintWithFormat(formate: "V:[v0]", views: lblReturnInfo)
       returnTripViw.addConstraint(NSLayoutConstraint(item: returnButton, attribute: .centerY, relatedBy: .equal, toItem: returnTripViw, attribute: .centerY, multiplier: 1, constant: 0))
       returnTripViw.addConstraint(NSLayoutConstraint(item: lblReturnInfo, attribute: .centerY, relatedBy: .equal, toItem: returnTripViw, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
    
    func onChangeSwipe(_ needToHide: Bool){
        
        DispatchQueue.main.async {
        
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.9, options: .curveEaseInOut, animations: {
                   
                       self.lblOnwardInfo.removeConstraint(self.lblOnwardWidthConst)
                          if(needToHide){
                              self.lblOnwardInfo.removeConstraint(self.lblOnwardWidthConst)
                              self.lblOnwardWidthConst = self.lblOnwardInfo.widthAnchor.constraint(equalToConstant: 1)
                              self.lblOnwardInfo.isHidden = true
                               self.lblReturnInfo.isHidden = false
                            
                                //Set Mini View Active
                                self.onwardView.isMiniView = true
                                self.onwardView.isReturn = true

                                self.returnView.isMiniView = false


                          }else{
                              self.lblOnwardInfo.removeConstraint(self.lblOnwardWidthConst)
                              self.lblOnwardWidthConst = self.lblOnwardInfo.widthAnchor.constraint(equalToConstant: 180)
                               self.lblOnwardInfo.isHidden = false
                               self.lblReturnInfo.isHidden = true
                                //Set Mini View Active
                                self.onwardView.isReturn = false
                               self.onwardView.isMiniView = false
                               self.returnView.isMiniView = true
                          }
                    self.lblOnwardInfo.addConstraint(self.lblOnwardWidthConst)
                    self.layoutSubviews()
                    self.layoutIfNeeded()

               }, completion: nil)
            

        }
        
    }
    
    
    
    
    
}
 
