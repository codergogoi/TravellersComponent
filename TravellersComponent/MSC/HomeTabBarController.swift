//
//  HomeTabBarController.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/4/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class CollBaseCell: UICollectionViewCell {
    
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.2).cgColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    let imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let lblTitle: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView(){
        
    }
}

class FloatCell : CollBaseCell {
    
    override func setupView() {
        super.setupView()
        backgroundColor = .green
    }
    
}

class HomeTabBarController : UITabBarController {
    
    var isSwipeUp = false
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection =  .vertical
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor = .clear
        collView.showsVerticalScrollIndicator = false
        return collView
    }()
    
    var heightConst = NSLayoutConstraint()
    var topConst = NSLayoutConstraint()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        viewControllers = [addNavigationCongtroller(vc: HomeViewController(), title: "Home"), addNavigationCongtroller(vc: OtherViewController(), title: "Other")]
        self.setupView()
         
    }
    
    func addNavigationCongtroller(vc: UIViewController, title: String ) -> UINavigationController {
        
        
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem.title = title
        navigationController.title = title
        
        return navigationController
    }
    
    
    func setupView(){
        
        self.view.addSubview(collectionView)
        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
        self.view.addConstraintWithFormat(formate: "V:[v0]-70-|", views: collectionView)
        
        self.heightConst = collectionView.heightAnchor.constraint(equalToConstant: 80)
        collectionView.addConstraint(self.heightConst)
        
        self.collectionView.register(FloatCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
                       
//        self.view.addSubview(bottomView)
//        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: bottomView)
//        self.view.addConstraintWithFormat(formate: "V:[v0]-60-|", views: bottomView)
//
//        self.heightConst = bottomView.heightAnchor.constraint(equalToConstant: 80)
//
//        bottomView.addConstraint(heightConst)
//        let pangesture = UIPanGestureRecognizer(target: self, action: #selector(changeSwipe(_:)))
//        bottomView.isUserInteractionEnabled = true
//        bottomView.addGestureRecognizer(pangesture)

    }
        
    /*
    
    @objc func changeSwipe(_ sender: UIPanGestureRecognizer){
        
        let transalation = sender.translation(in: self.view)
        
        let translateValue = transalation.y
                            
            self.heightConst.constant -= translateValue / 20
            if self.heightConst.constant > 600 {
                self.heightConst.constant = 600
            }else if self.heightConst.constant < 80 {
                self.heightConst.constant = 80
            }
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
         
        
        if sender.state == .ended {
            
            if self.heightConst.constant > 300 {
               self.heightConst.constant = 600
            }else {
               self.heightConst.constant = 80
            }
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.9, options: .curveEaseInOut, animations: {
               
                self.view.layoutIfNeeded()

            }, completion: nil)
            
        }
        
    }
    */
    
    
}



//MARK: - Collection View Functionality

extension HomeTabBarController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FloatCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.height + 1)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - (scrollView.frame.height) {
            
            updateHeight()
            print("Up Swipe Offset \(offsetY)")
            
        }else{
            updateHeightDown()
            print("Down Swipe Offset: \(offsetY)")
        }
        
    }
    
    
    func updateHeight(){
        
        if !self.isSwipeUp{
            isSwipeUp = true
            
            
             UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: .curveEaseInOut, animations: {
                          
                self.heightConst.constant = self.view.frame.size.height - 100
                self.view.layoutIfNeeded()
                self.collectionView.reloadData()
              
          }, completion: nil)
            
            
        }
    }
    
    func updateHeightDown(){
        
        if self.isSwipeUp{
            isSwipeUp = false
            
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
                
                self.heightConst.constant = 80
                self.view.layoutIfNeeded()
                self.collectionView.reloadData()
                
            }, completion: nil)
            
           
            
        }
    }
    
    
    
}
