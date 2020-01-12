//
//  ViewController.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/4/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class TripCell : CollectionBaseCell {

    override func setupView() {
        self.addSubview(bgView)
        self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: bgView)
        self.addConstraintWithFormat(formate: "V:|-5-[v0]-5-|", views: bgView)
    }

}

struct HeightConst{
        
    var minHeight: CGFloat
    var maxHeight: CGFloat
    var isMax: Bool = false
    
}

class ViewController: UIViewController {
 
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collView.backgroundColor = .clear
        collView.showsVerticalScrollIndicator = false
        return collView
    }()
    
    let identifier = "tripCell"
    let tripDetailsIdentifier = "tripDetails"
    let loginCellIdentifier = "loginIdentifier"
    let travellerIdentifier = "travellerIdentifier"
    let ssrIdentifier = "ssrIdentifier"
    let contactDetailsIdentifier = "contactDetailsIdentifier"
    let gstDetailsIdentifier = "gstDetailsIdentifier"
    
    var heightConst: [HeightConst] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.rgba(r: 228, g: 228, b: 228, a: 1)
        
        let numbersOfPax = 6
        
        heightConst = [
                    HeightConst(minHeight: 80, maxHeight: 80), // trip Info
                    HeightConst(minHeight: 80, maxHeight: 480), // Login
                    HeightConst(minHeight: 130, maxHeight: CGFloat((130/2) * numbersOfPax + (130/2))), //Traveller * numbers of Traveller
                    HeightConst(minHeight: 90, maxHeight: 90), // SSR
                    HeightConst(minHeight: 220, maxHeight: 220), // contact Info
                    HeightConst(minHeight: 80, maxHeight: 300), // GST Details
                    HeightConst(minHeight: 100, maxHeight: 100)
                ]
        
        setupView()
       
    }
    
    
    
    func setupView(){
        
        let topView = UIView(frame: .zero)
        view.addSubview(topView)
        view.addSubview(collectionView)
        view.addConstraintWithFormat(formate: "H:|[v0]|", views: topView)
        view.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
        view.addConstraintWithFormat(formate: "V:|[v0(83)]-10-[v1]|", views: topView, collectionView)
        
        collectionView.register(TripCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(TripDetailsCell.self, forCellWithReuseIdentifier: tripDetailsIdentifier)
        collectionView.register(TravellerLoginCell.self, forCellWithReuseIdentifier: loginCellIdentifier)
        collectionView.register(TravellerDetailsCell.self, forCellWithReuseIdentifier: travellerIdentifier)
        collectionView.register(SSRDetailsCell.self, forCellWithReuseIdentifier: ssrIdentifier)
        collectionView.register(ContactDetailsCell.self, forCellWithReuseIdentifier: contactDetailsIdentifier)
        collectionView.register(GSTDetailsCell.self, forCellWithReuseIdentifier: gstDetailsIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    


}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tripDetailsIdentifier, for: indexPath) as! TripDetailsCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCellIdentifier, for: indexPath) as! TravellerLoginCell
            cell.rootViewController = self
            return cell
        case 2:
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: travellerIdentifier, for: indexPath) as! TravellerDetailsCell
           cell.rootViewController = self
           cell.heightConst = self.heightConst[indexPath.section]
           cell.paxCount = PaxInfo(adultCount: 3, childCount: 0, infantCount: 0)
           return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ssrIdentifier, for: indexPath) as! SSRDetailsCell
            cell.rootViewController = self
            return cell
        case 4:
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contactDetailsIdentifier, for: indexPath) as! ContactDetailsCell
              cell.rootViewController = self
              return cell
        case 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: gstDetailsIdentifier, for: indexPath) as! GSTDetailsCell
            cell.rootViewController = self
            return cell
            
        default:
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TripCell
                   
           return cell
        }
        
        
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = self.heightConst[indexPath.section].isMax ? self.heightConst[indexPath.section].maxHeight : self.heightConst[indexPath.section].minHeight
        
        return CGSize(width: collectionView.frame.size.width, height: height)
        
    }
    
    
}



extension ViewController {
    

        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            
            self.heightConst[1].isMax = self.heightConst[1].isMax ? false : true
            
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                    
                    self.collectionView.performBatchUpdates({
                        self.collectionView.reloadData()
    //                           self.collectionView.reloadItems(at: [IndexPath(item: 0, section: 1)])
                      }, completion: nil)
                    
                }, completion: nil)
              
           }
            
        }
    
    func toggleLogin(){
            
        self.heightConst[1].isMax = self.heightConst[1].isMax ? false : true
                   
           DispatchQueue.main.async {
               UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                   
                   self.collectionView.performBatchUpdates({
                       self.collectionView.reloadData()
                     }, completion: nil)
                   
               }, completion: nil)
             
          }
        
    }
    
    func togglePaxDetails(){
            
        self.heightConst[2].isMax = self.heightConst[2].isMax ? false : true
                   
           DispatchQueue.main.async {
               UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                   
                   self.collectionView.performBatchUpdates({
                       self.collectionView.reloadData()
                     }, completion: nil)
                   
               }, completion: nil)
             
          }
        
    }
    
    
    func performSSRAction(ssrOption: SSROption?){
        
        print("Perform SSR Option \(ssrOption!)")
        
    }
    
    func toggleGSTDetails(){
              
          self.heightConst[5].isMax = self.heightConst[5].isMax ? false : true
                     
             DispatchQueue.main.async {
                 UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                     
                     self.collectionView.performBatchUpdates({
                         self.collectionView.reloadData()
                       }, completion: nil)
                     
                 }, completion: nil)
               
            }
          
      }
    
}
