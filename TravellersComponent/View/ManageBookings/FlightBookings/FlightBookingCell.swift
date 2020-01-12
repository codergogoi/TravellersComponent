//
//  FlightBookingCell.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/31/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class FlightBookingCell: CollectionBaseCell {
    
    let flightCellIdentifier = "myBookingIdentifier"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return collView
    }()
    
    override func setupView() {
        self.backgroundColor = UIColor(white: 0.9, alpha: 1)
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        self.addSubview(collectionView)
        self.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
        self.addConstraintWithFormat(formate: "V:|[v0]|", views: collectionView)
        collectionView.register(FlightsCell.self, forCellWithReuseIdentifier: flightCellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        
    }
    
}

//MARK: - Collection View Functionality
extension FlightBookingCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: flightCellIdentifier, for: indexPath) as! FlightsCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}


