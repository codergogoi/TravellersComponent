//
//  OnwardContainer.swift
//  LoaderView
//
//  Created by JAYANTA GOGOI on 11/28/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit



class OnwardContainer: UIView {
    
    var isReturn = false

    var isMiniView: Bool = false{
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    
    let  identifier = "OnwardCell"
    
    var collectionView: UICollectionView = {
       
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .vertical
       let  collView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
       
       return collView
   }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.addSubview(collectionView)
        collectionView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(ReturnFlightCell.self, forCellWithReuseIdentifier: identifier)
        self.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
        self.addConstraintWithFormat(formate: "V:|[v0]|", views: collectionView)
        
    }
    
}



extension OnwardContainer : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ReturnFlightCell
        cell.isReturn = self.isReturn
        cell.isMiniView = self.isMiniView
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
       return CGSize(width: self.collectionView.frame.size.width, height: 160)
        
   }
    
}

