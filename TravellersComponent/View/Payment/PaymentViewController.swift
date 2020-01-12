//
//  PaymentViewController.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/9/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class PaymentViewController : UIViewController {
    
    let topNavView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var topConst = NSLayoutConstraint()
    
    //Identifiers
    let paymentStatusIdentifier = "paymentStatus"
    let utilityPaymentIdentifier = "utilityPayment"
    let tripDetailsIdentifier = "tripDetailsIdentifier"
    let promocodeIdentifier = "promocodeIdentifier"
    let paymentOptionIdentifier = "PaymentOptionIdentifier"
    let paymentHeaderIdentifier = "PaymentHeaderIdentifier"
    
    var isUtilityPayment = false
    
    var visibleSections: [AvailableOption] = []
    
    var paymentStatus = PaymentStatus(refNumber: "135624356", fare: "$347832", status: true)
    
    var paymentOptions: [PaymentOption] = []
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor = .clear
        return collView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        self.setupPaymentOptions()

        if self.isUtilityPayment{
           self.setupUtilityPaymentOptions()
        }else{
           self.setupNormalPaymentOptions()
        }
        
        setupCollectionView()
       
    }
    
    
    fileprivate func setupCollectionView() {
        
        self.view.addSubview(topNavView)
        self.view.addSubview(collectionView)
        
        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: topNavView)
        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
        self.view.addConstraintWithFormat(formate: "V:|[v0]-10-[v1]-43-|", views: topNavView ,collectionView)
        let heightConst = topNavView.heightAnchor.constraint(equalToConstant: 83)
        topNavView.addConstraint(heightConst)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(PaymentStatusCell.self, forCellWithReuseIdentifier: paymentStatusIdentifier) // 0 after failed payment
        collectionView.register(UtilityPaymentCell.self, forCellWithReuseIdentifier: utilityPaymentIdentifier) // if from utility payment
        collectionView.register(TripDetailsCell.self, forCellWithReuseIdentifier: tripDetailsIdentifier) // if it is normal payment flow
        collectionView.register(PromocodeCell.self, forCellWithReuseIdentifier: promocodeIdentifier) // if normal flow
        collectionView.register(PaymentOptionCell.self, forCellWithReuseIdentifier: paymentOptionIdentifier)
        collectionView.register(PaymentOptionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: paymentHeaderIdentifier)
        collectionView.layoutMargins = .init(top: 0, left: 0, bottom: 0, right: 0)
    }

    
    func updatePaymentStatus(){
        
        let paymentUpdateCell = AvailableOption(identifier: paymentStatusIdentifier, cellHeight: 450, Celltype: .PAYMENT_STATUS)

        if !self.visibleSections.contains(paymentUpdateCell){
            self.visibleSections.insert(paymentUpdateCell, at: 0)
        }

    }
    
    //MARK: - Setup Utility Payment
    func setupUtilityPaymentOptions(){
        self.visibleSections = [
            AvailableOption(identifier: utilityPaymentIdentifier, cellHeight: 500, Celltype: .UTILITY_PAYMENT),
            AvailableOption(identifier: paymentOptionIdentifier, cellHeight: 80, Celltype: .PAYMENT_OPTIONS, isPaymentCell: true),
        ]
    }
    
    //MARK: - Setup Normal Paymemnt Flow
    func setupNormalPaymentOptions(){
        
        self.visibleSections = [
            AvailableOption(identifier: tripDetailsIdentifier, cellHeight: 80, Celltype: .TRIP_DETAILS),
            AvailableOption(identifier: promocodeIdentifier, cellHeight: 80, Celltype: .PROMOCODE ),
            AvailableOption(identifier: paymentOptionIdentifier, cellHeight: 80, Celltype: .PAYMENT_OPTIONS, isPaymentCell: true),
        ]
    }

    /* Setup Payment Options based on API  : by - Jayanta
     * @parameters required: NA
     * @return type or Object: NA
     */
    
    func setupPaymentOptions(){
        
        
        // api Data Setup from Payment Routing API 
        
        self.paymentOptions = [
            PaymentOption(type: .UPI, options: [.UPI_RZR, ], icon: #imageLiteral(resourceName: "upi")),
            PaymentOption(type: .CC, options: [.CC_PAYU, .CC_RZR], icon: #imageLiteral(resourceName: "debit-card")),
            PaymentOption(type: .DC, options: [.DC_RZR, .DC_PAYU], icon: #imageLiteral(resourceName: "credit-card")),
            PaymentOption(type: .NB, options: [.NB_RZR], icon: #imageLiteral(resourceName: "net-banking")),
            PaymentOption(type: .PAYPAL, options: [.PAYPAL, .PAYPAL], icon: #imageLiteral(resourceName: "paypal")),
            PaymentOption(type: .PHONEPE, options: [.PHONEPE], icon: #imageLiteral(resourceName: "phonepe")),
            PaymentOption(type: .CCEMI, options: [ .EMI ], icon: #imageLiteral(resourceName: "credit-card-emi")),
            PaymentOption(type: .WALET, options: [.PHONEPE], icon: #imageLiteral(resourceName: "wallet")),
            
        ]
        
    }
    
    func onTapPayment(paymentOption: PaymentOption){
        
        if paymentOption.type == .WALET {
            
            let walletVC = WalletViewController()
            self.navigationController?.pushViewController(walletVC, animated: true)
            
        }else{
            let cardViewController = CardViewController()
                   self.navigationController?.pushViewController(cardViewController, animated: true)
               cardViewController.onUpdateOnTap = { [weak self] in
                   DispatchQueue.main.async {
                       self?.topConst.constant = 0
                       self?.topNavView.isHidden = true
                       self?.updatePaymentStatus()
                       self?.view.layoutIfNeeded()
                       self?.collectionView.reloadData()
                   }
                  
               }
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.collectionView.reloadData()
    }
    
}

extension PaymentViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return self.visibleSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.visibleSections[section].isPaymentCell != false ? self.paymentOptions.count : 1
    }
    
    //MARK: - Header for Payment Options
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if self.visibleSections[indexPath.section].isPaymentCell {

            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: paymentHeaderIdentifier, for: indexPath) as? PaymentOptionHeader {
                return headerView;
            }
        }
        return UICollectionReusableView()
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        if self.visibleSections[section].isPaymentCell{
            return CGSize(width: collectionView.frame.width, height: 80)
        }

        return CGSize.zero

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let currentType = self.visibleSections[indexPath.section].Celltype
        
        switch currentType {
        case .PAYMENT_STATUS:
            let paymentStatusCell = collectionView.dequeueReusableCell(withReuseIdentifier: paymentStatusIdentifier, for: indexPath) as! PaymentStatusCell
            //setup data
            paymentStatusCell.status = self.paymentStatus
            return paymentStatusCell
        case .UTILITY_PAYMENT:
            let utilityCell = collectionView.dequeueReusableCell(withReuseIdentifier: utilityPaymentIdentifier, for: indexPath) as! UtilityPaymentCell
            return utilityCell
        case .TRIP_DETAILS:
            let tripCell = collectionView.dequeueReusableCell(withReuseIdentifier: tripDetailsIdentifier, for: indexPath) as! TripDetailsCell
            tripCell.didTap = self.onTapTripDetails
            return tripCell
        case .PROMOCODE:
             let promocodeCell = collectionView.dequeueReusableCell(withReuseIdentifier: promocodeIdentifier, for: indexPath) as! PromocodeCell
            return promocodeCell
            
        default:
            let paymentOptionCell = collectionView.dequeueReusableCell(withReuseIdentifier: paymentOptionIdentifier, for: indexPath) as! PaymentOptionCell
            paymentOptionCell.dataModel = self.paymentOptions[indexPath.row]
            paymentOptionCell.isFirst = indexPath.row == 0
            paymentOptionCell.isLast = indexPath.row == (paymentOptions.count - 1)

            //call back
            paymentOptionCell.didTap = self.onTapPaymentCell // Or closure with Weak Self
           return paymentOptionCell
        }
     
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let currentOption = self.visibleSections[indexPath.section]
        
        return CGSize(width: collectionView.frame.size.width, height:  currentOption.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if self.visibleSections[section].isPaymentCell {
            return -3
        }
        
        return 5
       
    }
    
}


extension PaymentViewController{
    
    //OnTap Closure
    func onTapPaymentCell(for dataModel: PaymentOption?){
        let bookingVC = BookingViewController()
        self.navigationController?.pushViewController(bookingVC, animated: true)
        
    }
    
    
    func onTapTripDetails(){
        
        //View trip Details
        
    }
     
    
}


