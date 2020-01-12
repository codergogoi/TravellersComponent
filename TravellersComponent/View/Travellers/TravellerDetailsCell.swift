//
//  TravellerDetailsCell.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/5/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

// R8779123

import UIKit

struct PaxInfo{
    
    var adultCount: Int
    var childCount: Int
    var infantCount: Int
    
}

class TravellerDetailsCell: CollectionBaseCell {
    
        weak var rootViewController: ViewController?
    
        let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collView.backgroundColor = .cyan
            return collView
        }()
    
        var paxCount: PaxInfo?{
            didSet{
                
            }
        }
    
        var heightConst: HeightConst? {
            didSet{
                if self.heightConst != nil{
                    self.collectionView.reloadData()
                }
            }
        }
    
        let btnAdd: UIButton = {
            let btn = UIButton()
            let attrText = NSAttributedString(string: "ADD", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: UIColor.rgba(r: 25, g: 71, b: 138, a: 1)])
            btn.setAttributedTitle(attrText, for: .normal)
            btn.backgroundColor = .white
            btn.layer.borderColor = UIColor.rgba(r: 25, g: 71, b: 138, a: 1).cgColor
            btn.layer.borderWidth = 1
            btn.layer.cornerRadius = 5
            return btn
            
        }()
        
        let lineView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.1)
            return view
        }()
        
        var isMax: Bool = true
        
        var  widthConst = NSLayoutConstraint()
        
        let lblAdultCount: UILabel = {
            let lbl = UILabel()
            return lbl
        }()
           
        let lblChildCount: UILabel = {
            let lbl = UILabel()
            return lbl
        }()

        let lblInfantCount: UILabel = {
            let lbl = UILabel()
            return lbl
        }()
       
      
        let addTravellerView: UIView = {
            let view = UIView()
            view.backgroundColor = .lightGray
            return view
        }()
        
        
        override func setupView() {
            self.addSubview(bgView)
            self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: bgView)
            self.addConstraintWithFormat(formate: "V:|-5-[v0]-5-|", views: bgView)
        
            self.bgView.addSubview(collectionView)
            self.collectionView.register(PaxCell.self, forCellWithReuseIdentifier: "cellId")
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            
            self.bgView.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
            self.bgView.addConstraintWithFormat(formate: "V:|-60-[v0]|", views: collectionView)
            
            let lblTitle = UILabel()
            lblTitle.text = "Traveller Details"
            lblTitle.font =  UIFont.boldSystemFont(ofSize: 20)
            
            self.bgView.addSubview(lblTitle)
            self.bgView.addSubview(lineView)
            self.bgView.addSubview(addTravellerView)

            self.bgView.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: lblTitle)
            self.bgView.addConstraintWithFormat(formate: "V:|-20-[v0]-15-[v1(1)][v2(56)]", views: lblTitle,lineView, addTravellerView)
            self.bgView.addConstraintWithFormat(formate: "H:|[v0]|", views: lineView)
            self.bgView.addConstraintWithFormat(formate: "H:|[v0]|", views: addTravellerView)
            
            self.addTravellerView.addSubview(btnAdd)
            self.addTravellerView.addConstraintWithFormat(formate: "H:[v0(60)]-20-|", views: btnAdd)
            self.addTravellerView.addConstraintWithFormat(formate: "V:[v0(40)]", views: btnAdd)
            self.addTravellerView.addConstraint(NSLayoutConstraint(item: btnAdd, attribute: .centerY, relatedBy: .equal, toItem: self.addTravellerView, attribute: .centerY, multiplier: 1, constant: 0))
            self.btnAdd.addTarget(self, action: #selector(onTapAddPax(_:)), for: .touchUpInside)
            
            lblAdultCount.font =  UIFont.systemFont(ofSize: 16)
            
            addTravellerView.addSubview(lblAdultCount)
            addTravellerView.addSubview(lblChildCount)
            addTravellerView.addSubview(lblInfantCount)
            lblAdultCount.text =  "".checkPlural(count:  3, word: "Adult")
            lblChildCount.text =  "| "+"".checkPlural(count: 2, word: "Child")
            lblInfantCount.text =  "| "+"".checkPlural(count:  1, word: "Infant")
            
            addTravellerView.addConstraintWithFormat(formate: "H:|-10-[v0]-5-[v1]-5-[v2]", views: lblAdultCount,lblChildCount,lblInfantCount)
            addTravellerView.addConstraintWithFormat(formate: "V:[v0(16)]", views: lblAdultCount)
            addTravellerView.addConstraintWithFormat(formate: "V:[v0(16)]", views: lblChildCount)
            addTravellerView.addConstraintWithFormat(formate: "V:[v0(16)]", views: lblInfantCount)
            
            addTravellerView.addConstraint(NSLayoutConstraint(item: lblAdultCount, attribute: .centerY, relatedBy: .equal, toItem: addTravellerView, attribute: .centerY, multiplier: 1, constant: 0))
            addTravellerView.addConstraint(NSLayoutConstraint(item: lblChildCount, attribute: .centerY, relatedBy: .equal, toItem: addTravellerView, attribute: .centerY, multiplier: 1, constant: 0))
            addTravellerView.addConstraint(NSLayoutConstraint(item: lblInfantCount, attribute: .centerY, relatedBy: .equal, toItem: addTravellerView, attribute: .centerY, multiplier: 1, constant: 0))

        }
    
    }


    //MARK: - OnTap Actions

    extension TravellerDetailsCell {
        
        @objc func onTapAddPax(_ sender: UIButton){
            sender.onTapAnimation()
            self.rootViewController?.togglePaxDetails()
        }
        
        
    }



extension TravellerDetailsCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 6 // assign deopends on the numbers of Passengers
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PaxCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: collectionView.frame.size.width, height: 60)

    }
    
    
}


class PaxCell: CollectionBaseCell {
    
    override func setupView() {
        
        self.backgroundColor = .red
        
        
    }
}
