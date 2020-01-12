//
//  CardViewController.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/10/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

enum PopType {
    case EXP_MONTH
    case EXP_YEAR
}


class CardViewController : UIViewController {
    
    var viewModel = CardViewModel()
    
    var onUpdateOnTap:(()->())?
    
    let tripIdentifier = "tripIdentifier"
    let cardCellIdentifier = "cardIdentifier"
    
    var cardInfo: Card = Card(cardNumber: "", nameOnCard: "", expiryMonth: .JAN, expiryYear: "", cvvNumber: "")

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor = .clear
        return collView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1)

        self.view.addSubview(collectionView)
        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
        self.view.addConstraintWithFormat(formate: "V:|-84-[v0]-43-|", views: collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(TripDetailsCell.self, forCellWithReuseIdentifier: tripIdentifier)
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: cardCellIdentifier)

    }
    
    
    func onViewPopup(_ type: PopType ){
        
        let popupViewController = PopupViewController()
        popupViewController.popType = type
        popupViewController.modalPresentationStyle = .overFullScreen
        self.present(popupViewController, animated: true, completion: nil)
        popupViewController.didMonthSelected = {[weak self] month in
                        
            if let currentMonth = month{
                self?.cardInfo.expiryMonth = currentMonth
                self?.collectionView.reloadData()
            }
        }
 
        popupViewController.didYearSelected = {[weak self] year in
                               
           if let currentYear = year{
               self?.cardInfo.expiryYear = currentYear
               self?.collectionView.reloadData()
           }
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        self.view.endEditing(true)
        self.onUpdateOnTap?()
        self.navigationController?.popViewController(animated: true)
    }
}


extension CardViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tripIdentifier, for: indexPath) as! TripDetailsCell
            return cell
        default:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cardCellIdentifier, for: indexPath) as! CardCell
            cell.txtCardNumber.delegate = self
            cell.txtNameOnCard.delegate = self
            cell.txtCVV.delegate = self
            cell.rootViewController = self
            cell.cardInfo = self.cardInfo
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.size.width, height:  80)

        }
        
        return CGSize(width: collectionView.frame.size.width, height:  500)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 50
    }
    
}



extension CardViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.collectionView.reloadData()
        textField.resignFirstResponder()
        return true
    }
    

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let cell = collectionView.cellForItem(at: IndexPath(item: 0, section: 1)) as? CardCell {

            if textField == cell.txtCardNumber {
                if let cardNumber = cell.txtCardNumber.text{
                    self.cardInfo.cardNumber = cardNumber
                }
                
            }else if textField == cell.txtNameOnCard {
                if let nameOnCard = cell.txtNameOnCard.text{
                    self.cardInfo.nameOnCard = nameOnCard
                }
            }
        }
        return true
    }
    
}
