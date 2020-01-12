//
//  PopupViewController.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/10/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

enum Month : String {
    case JAN = "Jan 01"
    case FEB = "Feb 02"
    case MAR = "Mar 03"
    case APR = "Apr 04"
    case MAY = "May 05"
    case JUN = "Jun 06"
    case JUL = "Jul 07"
    case AUG = "Aug 08"
    case SEP = "Sep 09"
    case OCT = "Oct 10"
    case NOV = "Nov 11"
    case DEC = "Dec 12"
}



class PopupViewController:  UIViewController {
    
        
    var didMonthSelected: ((Month?) -> Void)?
    var didYearSelected: ((String?) -> Void)?
    
    var popType: PopType?
    
    var months: [Month] = []
    
    var years = Array(2020...2050)
    
    
    let monthPicker: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    
    let btnDone: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Done", for: .normal)
        btn.layer.cornerRadius = 10
        btn.layer.backgroundColor =  UIColor.rgba(r: 172, g: 24, b: 19, a: 1).cgColor
        return btn
    }()
    
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
        
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.months = [.JAN, .FEB, .MAR, .APR, .MAY, .JUN, .JUL, .AUG, .SEP, .OCT
                  , .NOV, .DEC];
        
        self.view.backgroundColor = UIColor.clear
        
        self.view.addSubview(bgView)
        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: bgView)
        self.view.addConstraintWithFormat(formate: "V:[v0(300)]|", views: bgView)
        self.bgView.addSubview(btnDone)
        self.bgView.addConstraintWithFormat(formate: "V:|-20-[v0(40)]", views: btnDone)
        self.bgView.addConstraintWithFormat(formate: "H:[v0(100)]-20-|", views: btnDone)
        self.btnDone.addTarget(self, action: #selector(onTapDoneBtn(_:)), for: .touchDragInside)
        
        self.setupMonths()
    }
    
    func setupMonths(){
        
        self.bgView.addSubview(monthPicker)
        monthPicker.dataSource = self
        monthPicker.delegate = self
        self.bgView.addConstraintWithFormat(formate: "H:|-20-[v0]-20-|", views: monthPicker)
        self.bgView.addConstraintWithFormat(formate: "V:|-50-[v0]-20-|", views: monthPicker)
        
    }
       
       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
       
       override func viewDidAppear(_ animated: Bool) {
           
           super.viewDidAppear(animated)
           
           DispatchQueue.main.async {
               
               UIView.animate(withDuration: 0.3, animations: {
                   
                self.view.backgroundColor =  UIColor.rgba(r: 0, g: 0, b: 0, a: 0.3)
                   
               }, completion: nil)
               
           }
           
       }
       
       @objc func onTapDoneBtn(_ sender: UIButton){
           
           sender.onTapAnimation()
           
           DispatchQueue.main.async {
               
               UIView.animate(withDuration: 0.3, animations: {
                   self.view.backgroundColor =  UIColor.rgba(r: 0, g: 0, b: 0, a: 0)
               }, completion: {(finished) in
                    // change triggered value
                   self.dismiss(animated: true, completion: nil)
                   
               })
              
           }
           
       }
    
    deinit{
        print("Deinit... Popup")
    }

    
    
}

extension PopupViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
        if let popType = self.popType{
            if popType == .EXP_MONTH {
                return self.months.count
            }else if popType == .EXP_YEAR {
                return self.years.count
            }
        }
        
        return 0
            

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if let popType = self.popType{
           if popType == .EXP_MONTH {
                self.didMonthSelected?(self.months[row])
           }else if popType == .EXP_YEAR{
                self.didYearSelected?("\(self.years[row])")
           }
       }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if let popType = self.popType{
            if popType == .EXP_MONTH {
                return "\(self.months[row].rawValue)"
            }else if popType == .EXP_YEAR{
                return "\(self.years[row])"
            }
        }
        return ""
    }
    
    
    
}

