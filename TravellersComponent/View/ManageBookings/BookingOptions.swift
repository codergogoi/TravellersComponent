//
//  BookingOptions.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/31/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import Foundation
import UIKit

enum OptionType{
    
    case ALL
    case FLIGHT
    case HOTEL
    case BUS
    
}


struct OptionsDataModel {
    
    var title: String
    var type: OptionType
}

class SelectionCell: CollBaseCell {
    
    var  dataModel: OptionsDataModel?{
        didSet{
            if let title = self.dataModel?.title{
                self.title.text = title
            }
        }
    }
    
    var onSelectOption:((OptionsDataModel?) ->())?
    
    
    let title: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.appBoldFont(fSize: 20)
        lbl.text = "ALL"
        lbl.textAlignment = .center
        return lbl
    }()
    
    override func setupView() {
        self.backgroundColor = .white
        self.addSubview(title)
        self.addConstraintWithFormat(formate: "H:|[v0]|", views: title)
        self.addConstraintWithFormat(formate: "V:|[v0]|", views: title)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapSelectOption))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func onTapSelectOption(){
            self.onTapAnimation()
            self.onSelectOption?(self.dataModel)
    }
}


class BookingOptions: CollBaseCell {
    
    
    var options: [OptionsDataModel] = []
    
    let selectionIdentifier = "SelectionIdentifier"
    
    var onChangeSelection:((OptionsDataModel?)->())?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return collView
    }()
    
    override func setupView() {
        self.backgroundColor = .red
        
        self.options = [OptionsDataModel(title: "ALL", type: .ALL), OptionsDataModel(title: "FLIGHT", type: .FLIGHT), OptionsDataModel(title: "HOTEL", type: .HOTEL), OptionsDataModel(title: "BUS", type: .BUS)]
        
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        self.addSubview(collectionView)
        self.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
        self.addConstraintWithFormat(formate: "V:|[v0]|", views: collectionView)
        collectionView.register(SelectionCell.self, forCellWithReuseIdentifier: selectionIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
     
}

//MARK: - Collection View Functionality

extension BookingOptions: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: selectionIdentifier, for: indexPath) as! SelectionCell
        cell.dataModel = self.options[indexPath.row]
        cell.onSelectOption = { [weak self] dataModel in
            self?.onChangeSelection?(dataModel)
         }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.frame.size.width/4, height: collectionView.frame.size.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
