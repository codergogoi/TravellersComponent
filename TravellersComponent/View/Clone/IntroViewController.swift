//
//  IntroViewController.swift
//  TravellersComponent
//
//  Created by JAYANTA GOGOI on 12/20/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit



class FirstViewController: UIViewController {
    
    
    var didTapNext: (()->())?
    
    let btnNext: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        btnNext.setTitle("Next", for: .normal)
        btnNext.backgroundColor = .lightGray
        btnNext.addTarget(self, action: #selector(onTapNext(_:)), for: .touchUpInside)
        
        self.view.addSubview(btnNext)
        self.view.addConstraintWithFormat(formate: "H:[v0(200)]", views: btnNext)
        self.view.addConstraint(NSLayoutConstraint(item: btnNext, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0))
        self.view.addConstraintWithFormat(formate: "V:|-200-[v0(80)]", views: btnNext)
        
    }
    
    
    @objc func onTapNext(_ sender: UIButton){
        sender.onTapAnimation()
        didTapNext?()
    }
    
    
}


class IntroViewController: UIPageViewController {

    
    var introPages = [UIViewController]()
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        self.delegate = self
        self.dataSource = self
        self.isPagingEnabled = false
        
        let progressView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        progressView.backgroundColor = .darkGray
        self.view.addSubview(progressView)
        self.view.bringSubviewToFront(progressView)
                    
        let firstPage = FirstViewController()
        firstPage.view.backgroundColor = UIColor(white: 0.95, alpha: 1)

        let thirdPage = UIViewController()
        thirdPage.view.backgroundColor = UIColor(white: 0.9, alpha: 1)
              
        let secondPage = UIViewController()
        secondPage.view.backgroundColor = UIColor(white: 0.85, alpha: 1)

        firstPage.didTapNext = { [weak self] in
            self?.setViewControllers([secondPage], direction: .forward, animated: true, completion: nil)
        }
        
        
        introPages = [firstPage, secondPage, thirdPage]
            
        setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
    }
    
    
}


extension IntroViewController : UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = introPages.firstIndex(of: viewController) else {
            return nil
        }
        
        let prevIndex = viewControllerIndex - 1
        
        guard prevIndex >= 0 else { return introPages.last}
        
        guard introPages.count > prevIndex else { return nil}
        
        return introPages[prevIndex]
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
       
            guard let viewControllerIndex = introPages.firstIndex(of: viewController) else {
                       return nil
                   }
                   
            let nextIndex = viewControllerIndex + 1
           
            guard nextIndex < introPages.count else { return introPages.first}
           
            guard introPages.count > nextIndex else { return nil}
           
            return introPages[nextIndex]
        
    }
    
    
}


extension IntroViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            scrollView.bounces = false
        
    }
    
}


extension UIPageViewController {
     var isPagingEnabled: Bool {
        get {
           var isEnabled: Bool = true
           for view in view.subviews {
               if let subView = view as? UIScrollView {
                   isEnabled = subView.isScrollEnabled
               }
           }
           return isEnabled
       }
       set {
           for view in view.subviews {
               if let subView = view as? UIScrollView {
                   subView.isScrollEnabled = newValue
               }
           }
       }
   }
}
