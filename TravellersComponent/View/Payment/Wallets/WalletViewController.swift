//
//  WalletViewController.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/23/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController {

    
    var paymentOptions = [PaymentOption]()
    
    let identifier = "WalletCell"

    let collectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
           collView.backgroundColor = .clear
           return collView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigation(title: "Back", onTap: #selector(onTapBackButton(_:)))
        
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
            
        self.view.addSubview(collectionView)
        collectionView.register(PaymentOptionCell.self, forCellWithReuseIdentifier: identifier)
        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
        self.view.addConstraintWithFormat(formate: "V:|-93-[v0]|", views: collectionView)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        setupPaymentOptions()
        
    }
    
    
    @IBAction func onTapBackButton(_ sender: UIButton) {
            sender.onTapAnimation()
            self.navigationController?.popViewController(animated: true)
       }
    
    
    private func setupPaymentOptions(){
        
        
        self.paymentOptions = [
               PaymentOption(type: .FCA, options: [.FCA, ], icon: #imageLiteral(resourceName: "freecharge")),
               PaymentOption(type: .AMZ, options: [.AMZ], icon: #imageLiteral(resourceName: "amazon_pay")),
               PaymentOption(type: .MBK, options: [.MBK], icon: #imageLiteral(resourceName: "mobikwik")),
               PaymentOption(type: .PYU, options: [.PYU], icon: #imageLiteral(resourceName: "payu")),
               PaymentOption(type: .PZA, options: [.PZA], icon: #imageLiteral(resourceName: "payzapp")),
            ]
               
        
    }
   
}


//MARK: - Collection View Functionality

extension WalletViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.paymentOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PaymentOptionCell
        cell.dataModel = self.paymentOptions[indexPath.row]
        cell.isFirst = indexPath.row == 0
        cell.isLast = indexPath.row == (paymentOptions.count - 1)
        cell.didTap = self.onTapPaymentCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: 80)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return -5
    }
    
}


extension WalletViewController{
    
    //OnTap Closure
    func onTapPaymentCell(for dataModel: PaymentOption?){
       
        //Process Wallet Payment
        print("Wallet is Selected \(dataModel!)")
    }
    
     
    
}



