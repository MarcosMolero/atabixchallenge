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
    convenience init() {
    
        let client      = TWTRAPIClient()
        let dataSource  = TWTRUserTimelineDataSource(screenName: client.userID!, apiClient: client)
        
        self.init(dataSource: dataSource)
    }
    
    override required init(dataSource: TWTRTimelineDataSource?) {
        super.init(dataSource: dataSource)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        tabBarItem = UITabBarItem(title: "Personal", image: AppConstants.appImage.homeNormal, selectedImage: AppConstants.appImage.homeHighlited)
        tabBarItem.isEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if UserDefaults.standard.object(forKey: "userID") != nil {
            let client      :TWTRAPIClient = TWTRAPIClient()
            let screenName  :String = UserDefaults.standard.object(forKey: "userName") as! String
            self.dataSource = TWTRUserTimelineDataSource(screenName: screenName, apiClient: client)
            
            super.viewWillAppear(animated)
        }
        self.navigationItem.title = "Marcos"
        print("Entro en Timeline")
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
