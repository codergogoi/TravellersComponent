//
//  FlightCell.swift
//  LoaderView
//
//  Created by JAYANTA GOGOI on 12/2/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class ReturnFlightCell : CollBaseCell  {
    
    var isReturn: Bool = false
    
    var isMiniView: Bool = false{
        didSet{
            self.onChangeMiniView()
        }
    }
    
    //Custom View refer to reuse component
    let owCollapseView: ReturnCollapseView = {
        let view =  ReturnCollapseView(frame: CGRect.zero, isReturn: false)
        return view
    }()
    
    let retCollapseView: ReturnCollapseView = {
        let view =  ReturnCollapseView(frame: CGRect.zero, isReturn: true)
        return view
    }()
    

    let selectionView: UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor.rgba(r: 211, g: 47, b: 47, a: 1)
        DispatchQueue.main.async {
            view.customCorner(corners: [.bottomLeft, .bottomRight], radius: 10)
        }
        return view
    }()
    
    let returnFullView: ReturnFullView = {
        let view = ReturnFullView()
        return view
    }()
    
     
    override func setupView() {
        self.addSubview(bgView)
        self.addConstraintWithFormat(formate: "H:|-5-[v0]-5-|", views: bgView)
        self.addConstraintWithFormat(formate: "V:|-5-[v0]-5-|", views: bgView)
        self.bgView.addSubview(selectionView)
        self.bgView.addConstraintWithFormat(formate: "H:|[v0]|", views: selectionView)
        self.bgView.addConstraintWithFormat(formate: "V:[v0(5)]|", views: selectionView)
        self.setupMainView()
        self.setupCollepseView()
        
        //settingup data
        self.owCollapseView.dataModel = FlightCollapseData(flightName: "Indigo", depTime: "20:15", arrTime: "16:45", price: "₹  800")
        self.retCollapseView.dataModel = FlightCollapseData(flightName: "SpiceJet", depTime: "17:20", arrTime: "17:45", price: "₹ 900")
        self.returnFullView.dataModel =  FlightCollapseData(flightName: "Indigo", depTime: "20:15", arrTime: "16:45", price: "₹  800")
    }
    
    
    func setupCollepseView(){
        
        self.addSubview(owCollapseView)
        self.addSubview(retCollapseView)
        
        self.addConstraintWithFormat(formate: "H:|-5-[v0(200)]", views: retCollapseView)
        self.addConstraintWithFormat(formate: "V:|-5-[v0]-5-|", views: retCollapseView)
        
        self.addConstraintWithFormat(formate: "H:[v0(200)]-5-|", views: owCollapseView)
        self.addConstraintWithFormat(formate: "V:|[v0]-5-|", views: owCollapseView)
       
    }
    
    func setupMainView(){
        self.addSubview(returnFullView)
        self.addConstraintWithFormat(formate: "H:|-5-[v0]-5-|", views: returnFullView)
        self.addConstraintWithFormat(formate: "V:|-5-[v0]-5-|", views: returnFullView)
        
    }
    
    
    
    func onChangeMiniView(){
                
        self.owCollapseView.isHidden = true
        self.retCollapseView.isHidden = true
        
        UIView.animate(withDuration: 0.2) {
            if self.isMiniView{

                self.returnFullView.isHidden = true
                
                if self.isReturn == true {
                    self.owCollapseView.isHidden = false
                }else {
                    self.retCollapseView.isHidden = false
                }

            }else{
                self.returnFullView.isHidden = false
            }
        }
        
            
    }
    
}
