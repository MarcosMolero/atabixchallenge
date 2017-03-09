//
//  TabBarController.swift
//  atabixchallenge
//
//  Created by Marcos on 9/3/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//
//  Icons provided by: https://icons8.com

import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tabOne = ProfileViewController()
        let tabOneBarItem = UITabBarItem(title: "Profile", image: AppConstants.appImage.twitterNormal, selectedImage: AppConstants.appImage.twitterHighlited)
        tabOne.tabBarItem = tabOneBarItem
        
        let tabTwo = TimelineViewController()
        let tabTwoBarItem2 = UITabBarItem(title: "Timeline", image: AppConstants.appImage.twitterNormal, selectedImage: AppConstants.appImage.twitterHighlited)
        tabTwo.tabBarItem = tabTwoBarItem2
//
        self.viewControllers = [tabOne, tabTwo]
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
}
