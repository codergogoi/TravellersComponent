//
//  SSRDetailsCell.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/6/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

enum SSRTYPE {
    case SEAT
    case BAG
    case MEAL
    case PCI // priority Checkin
    case BOF // baggage out first
}

struct SSROption{
    var type: SSRTYPE
    var title:  String
    var img: UIImage
}


class SSRDetailsCell: CollectionBaseCell {
    
        weak var rootViewController: ViewController?

        let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collView.backgroundColor = .clear
            collView.showsHorizontalScrollIndicator = false
            
            return collView
        }()
    
       
        let leadingConst = NSLayoutConstraint()
    
        var ssrOptions: [SSROption] = []
    
        override func setupView() {
            self.addSubview(bgView)
            
            self.ssrOptions = [SSROption(type: .MEAL,title: "Add Meal", img: #imageLiteral(resourceName: "suitcase-2")), SSROption(type: .BAG,title: "Add baggage", img: #imageLiteral(resourceName: "suitcase-2")),SSROption(type: .SEAT,title: "Add Seat", img: #imageLiteral(resourceName: "suitcase-2")), SSROption(type: .PCI, title: "Add Proirity Checkin", img: #imageLiteral(resourceName: "suitcase-2")), SSROption(type: .BOF, title: "Add Baggage Out First", img: #imageLiteral(resourceName: "suitcase-2"))]
            
            self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: bgView)
            self.addConstraintWithFormat(formate: "V:|-5-[v0]-5-|", views: bgView)
        
            self.bgView.addSubview(collectionView)
            self.collectionView.register(SSRCell.self, forCellWithReuseIdentifier: "ssrCellId")
            
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            
            self.bgView.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
            self.bgView.addConstraintWithFormat(formate: "V:|[v0]|", views: collectionView)
             
        }
    
    }


    //MARK: - OnTap Actions

    extension SSRDetailsCell {
        
        @objc func onTabSSRCell(_ sender: UIButton){
            sender.onTapAnimation()
//            self.rootViewController?.togglePaxDetails()
        }
        
        
    }

extension SSRDetailsCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ssrCellId", for: indexPath) as! SSRCell
        cell.dataModel = ssrOptions[indexPath.row]
            
        cell.didTapSSR = {[weak self] dataModel in
            
            self?.rootViewController?.performSSRAction(ssrOption: dataModel)
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width/4.5, height: collectionView.frame.size.height)
        
    }
    
    
}


class SSRCell: CollectionBaseCell {
    
    var dataModel: SSROption?{
        didSet{
            if let ssr = self.dataModel{
                self.lblFeaturesName.text = "\(ssr.title)"
                self.optionImg.image = ssr.img
            }
        }
    }
    
    var didTapSSR: ((SSROption?) -> Void)?
    
    let lblFeaturesName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let optionImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    override func setupView() {
        
        self.addSubview(optionImg)
        self.addSubview(lblFeaturesName)
        self.addConstraintWithFormat(formate: "H:|[v0]|", views: lblFeaturesName)
        self.addConstraintWithFormat(formate: "H:[v0(32)]", views: optionImg)
        self.addConstraintWithFormat(formate: "V:|-10-[v0(32)]-10-[v1]", views: optionImg,lblFeaturesName)
        self.addConstraint(NSLayoutConstraint(item: optionImg, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapCell))
        self.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func onTapCell(){
        self.onTapAnimation()
        didTapSSR?(self.dataModel)
 
    }
}

