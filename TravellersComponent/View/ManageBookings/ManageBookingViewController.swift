//
//  ManageBookingViewController.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/30/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class ManageBookingViewController: UIViewController {

    let containerIdentifier = "container"
    let optionsIdentifier = "options"
    
    var currentSelection: OptionsDataModel?{
        didSet{
            self.collectionView.reloadSections(IndexSet(integer: 1))
        }
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection =  .vertical
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor =   UIColor(white: 0.9, alpha: 1)
        return collView
    }()
    
    let navView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  UIColor(white: 0.9, alpha: 1)
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        self.view.addSubview(navView)
        self.view.addSubview(collectionView)
        view.addConstraintWithFormat(formate: "H:|[v0]|", views: navView)
        view.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
        view.addConstraintWithFormat(formate: "V:|[v0(120)][v1]|", views: navView,collectionView)
        collectionView.register(BookingContainer.self, forCellWithReuseIdentifier: containerIdentifier)
        collectionView.register(BookingOptions.self, forCellWithReuseIdentifier: optionsIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
}


//MARK: - Collection View Functionality

extension ManageBookingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: optionsIdentifier, for: indexPath) as! BookingOptions
            cell.onChangeSelection = { [weak self] dataModel in
                self?.currentSelection = dataModel
            }
           
            return cell
            
        }else{

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: containerIdentifier, for: indexPath) as! BookingContainer
            cell.currentSelection = self.currentSelection
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        let height: CGFloat = indexPath.section == 0 ? 60 : (self.collectionView.frame.size.height - 60) // frame height - NavView - SelectionHeight
        
        
        return CGSize(width: collectionView.frame.size.width, height: height)
    }
    
    
}
