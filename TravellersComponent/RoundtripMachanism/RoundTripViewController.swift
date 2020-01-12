//
//  RoundTripViewController.swift
//  LoaderView
//
//  Created by JAYANTA GOGOI on 11/27/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class RoundTripViewController: UIViewController {
 
    var collectionView: UICollectionView = {
    
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let  collView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        return collView
    }()
    
     let calenderView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    let offerVeiw: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.backgroundColor = UIColor.white.cgColor
        return view
    }()
    
    
    var cellWidth: CGFloat = 400
    
    var leftConst = 300
    

    var onChangeLocation:((Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        self.setupCollectionView()
    }
    
    func setupCollectionView(){
        
        self.view.addSubview(offerVeiw)
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        self.view.addConstraintWithFormat(formate: "H:|-20-[v0]-20-|", views: offerVeiw)
        
        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
        self.view.addConstraintWithFormat(formate: "V:|-83-[v0(60)]-20-[v1]|", views: offerVeiw, collectionView)
        collectionView.register(ContainerCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.cellWidth = self.collectionView.frame.width * 1.4
        
        self.perform(#selector(onChangeSwipe(_:)), with: nil, afterDelay: 0.1)
        
    }
    
}

extension RoundTripViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ContainerCell
        
        cell.rootViewController = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width * 1.4, height: self.collectionView.frame.size.height)
    }
  
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let cellWidth : CGFloat = (self.collectionView.frame.width * 1.4)
        
        let currentScroll = (scrollView.contentOffset.x * cellWidth) / self.collectionView.frame.width
        
        let justifiedWidth = scrollView.contentSize.width / 4
        
        if(currentScroll > justifiedWidth){
               //right
            self.onChangeSwipe(true)
                
           }else{
              //left
            self.onChangeSwipe(false)
        }
       
    }
    
    
    @objc func onChangeSwipe(_ isRight: Bool = false){
        
        
        if let cell = self.collectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as? ContainerCell {
            
            if isRight{
                collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .right, animated: true)
                cell.onChangeSwipe(true)
            }else{
                collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: true)
                cell.onChangeSwipe(false)
            }
              
       }
        
        
    }
    
}
