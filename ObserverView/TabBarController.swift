//
//  TabBarController.swift
//  ObserverView
//
//  Created by youngkyun park on 2/5/25.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBarController()
        configureApperance()
        
        self.selectedIndex = 0
        
    }
    
    private func configureTabBarController() {
        
        let firstVC = CurrencyViewController()
        firstVC.tabBarItem.image = UIImage(systemName: "digitalcrown.arrow.clockwise")
        firstVC.tabBarItem.title = "EXCHANGE"
        firstVC.tabBarController?.selectedIndex = 0
        let firstNav = UINavigationController(rootViewController: firstVC)
    
        
        let secondVC = WordCounterViewController()
        secondVC.tabBarItem.image = UIImage(systemName: "note.text")
        secondVC.tabBarItem.title = "COUNT"
        secondVC.tabBarController?.selectedIndex = 1
        let secondNav = UINavigationController(rootViewController: secondVC)
        
        
        let thridVC = UserViewController()
        thridVC.tabBarItem.image = UIImage(systemName: "list.clipboard")
        thridVC.tabBarItem.title = "List"
        thridVC.tabBarController?.selectedIndex = 2
        let thridNav = UINavigationController(rootViewController: thridVC)
        
        
        setViewControllers([firstNav,secondNav, thridNav], animated: true)
        
    }
    
    
    private func configureApperance() {
        let tabBarApperance = UITabBarAppearance()
        tabBarApperance.configureWithTransparentBackground()
        tabBarApperance.selectionIndicatorTintColor = .black
        UITabBar.appearance().standardAppearance = tabBarApperance
    }
    
    
    
}
