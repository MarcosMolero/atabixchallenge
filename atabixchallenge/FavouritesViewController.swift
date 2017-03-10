//
//  FavouritesViewController.swift
//  atabixchallenge
//
//  Created by Marcos Molero on 9/3/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import TwitterKit

class FavouritesViewController:TWTRTimelineViewController {
    
    convenience init() {
//        let strUrl = “twitter://user?screen_name=\(twt.author.screenName)”
//        let strUrlWww = “https://twitter.com/\(twt.author.screenName)"
        
        let client      = TWTRAPIClient()
        let dataSource  = TWTRUserTimelineDataSource(screenName: client.userID!, apiClient: client)
        
        self.init(dataSource: dataSource)
    }
    
    override required init(dataSource: TWTRTimelineDataSource?) {
        super.init(dataSource: dataSource)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
//        tabBarItem = UITabBarItem(title: "Favourites", image: AppConstants.appImage.homeNormal, selectedImage: AppConstants.appImage.homeHighlited)
//        tabBarItem.isEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        if UserDefaults.standard.object(forKey: "userID") != nil {
//            let client      :TWTRAPIClient = TWTRAPIClient()
//            let screenName  :String = UserDefaults.standard.object(forKey: "userName") as! String
//            self.dataSource = TWTRUserTimelineDataSource(screenName: screenName, apiClient: client)
        
            super.viewWillAppear(animated)
//        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
