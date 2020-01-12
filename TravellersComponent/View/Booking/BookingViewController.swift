//
//  BookingViewController.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/18/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController {
    
    
    let bookingIdentifier = "bookingIdentifier"
    let tripIdentifier = "tripIdentifier"
    
    var bookingStatus =  PaymentStatus(refNumber: "135624356", fare: "$347832", status: false)


    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection =  .vertical
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }
    
    func setupCollectionView(){
        
        view.addSubview(collectionView)
        
        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
        self.view.addConstraintWithFormat(formate: "V:|[v0]|", views: collectionView)
        
        collectionView.register(BookingCell.self, forCellWithReuseIdentifier: bookingIdentifier)
        collectionView.register(TripDetailsCell.self, forCellWithReuseIdentifier: tripIdentifier)
        
        collectionView.backgroundColor =  UIColor(white: 0.9, alpha: 1)

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}


//MARK: - Collection View Functionality

extension BookingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 1 {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tripIdentifier, for: indexPath) as! TripDetailsCell
            return cell
        }
        
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bookingIdentifier, for: indexPath) as! BookingCell
        cell.status = bookingStatus
        cell.didClose = { [weak self] in
            
            self?.navigationController?.popViewController(animated: true)
            
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return  CGSize(width: collectionView.frame.size.width, height: indexPath.row == 0 ? collectionView.frame.size.height - 200 : 80)
    }
    
}



