//
//  HomeViewController.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/4/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class HomeViewController : UIViewController {
    
    var  isHideTabBar = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.isHideTabBar  = self.isHideTabBar ? false : true
        
        print("is Hiden \(self.isHideTabBar)")
       
        self.setTabBarHidden(self.isHideTabBar)
       
   
    }
    
    
}

extension UIViewController {

    func setTabBarHidden(_ hidden: Bool, animated: Bool = true, duration: TimeInterval = 0.3) {
        if animated {
            if let frame = self.tabBarController?.tabBar.frame {
                let factor: CGFloat = hidden ? 1 : -1
                let y = frame.origin.y + (frame.size.height * factor)
                UIView.animate(withDuration: duration, animations: {
                    self.tabBarController?.tabBar.frame = CGRect(x: frame.origin.x, y: y, width: frame.width, height: frame.height)
                })
                return
            }
        }
        self.tabBarController?.tabBar.isHidden = hidden
    }

}


/*

 extension ViewController : UIScrollViewDelegate {
     
     func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
         
         if self.heightConst.constant > 200 {
             self.updateHeader()
         }
     }
     
     func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
         
         if self.heightConst.constant > 200 {
             self.updateHeader()
         }
     }
     
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
         
         if scrollView.contentOffset.y < 0 {
                         
             self.heightConst.constant += abs(scrollView.contentOffset.y)
             
         }else if scrollView.contentOffset.y >  0 && self.heightConst.constant >= 83 {
             
             self.heightConst.constant -= scrollView.contentOffset.y/50
             
             if self.heightConst.constant < 83 {
                 self.heightConst.constant = 83
             }
         }
         
     }
     
 }

 */

