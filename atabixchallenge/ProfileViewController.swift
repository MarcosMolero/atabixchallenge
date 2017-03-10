//
//  ProfileViewController.swift
//  atabixchallenge
//
//  Created by Marcos on 9/3/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import TwitterKit

class ProfileViewController: TWTRTimelineViewController {
    
    func show() {
        if UserDefaults.standard.object(forKey: "userID") != nil {
            
            let client      :TWTRAPIClient = TWTRAPIClient()
            let screenName  :String = UserDefaults.standard.object(forKey: "userName") as! String
            
            self.dataSource = TWTRUserTimelineDataSource(screenName: screenName, apiClient: client)
            
            self.showTweetActions = true
            
            self.navigationItem.title = screenName
        }
    }
    
    func show2(){
        let client      = TWTRAPIClient()
        self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "#apple", apiClient: client)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        show2()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        tabBarItem = UITabBarItem(title: "Personal", image: AppConstants.appImage.homeNormal, selectedImage: AppConstants.appImage.homeHighlited)
        tabBarItem.isEnabled = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


    


