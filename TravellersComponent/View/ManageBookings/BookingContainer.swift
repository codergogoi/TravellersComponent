//
//  ManageBookingContainer.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/31/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class BookingContainer: CollBaseCell {
    
    let mybookingIdentifier = "myBookingIdentifier"
    
    var currentSelection: OptionsDataModel?{
        didSet{
            if let selection = self.currentSelection{
                switch selection.type {
                case .ALL:
                    self.collectionView.reloadData()
                    self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
                case .FLIGHT:
                   self.collectionView.reloadData()
                   self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 1), at: .centeredHorizontally, animated: true)
                case .HOTEL:
                   self.collectionView.reloadData()
                   self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 2), at: .centeredHorizontally, animated: true)
                case .BUS:
                   self.collectionView.reloadData()
                   self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 3), at: .centeredHorizontally, animated: true)
                }
            }
        }
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return collView
    }()
    
    override func setupView() {
        super.setupView()
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        self.addSubview(collectionView)
        self.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
        self.addConstraintWithFormat(formate: "V:|[v0]|", views: collectionView)
        collectionView.register(FlightBookingCell.self, forCellWithReuseIdentifier: mybookingIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

//MARK: - Collection View Functionality
extension BookingContainer: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mybookingIdentifier, for: indexPath) as! FlightBookingCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


