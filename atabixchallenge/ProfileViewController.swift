//
//  ProfileViewController.swift
//  atabixchallenge
//
//  Created by Marcos on 9/3/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import TwitterKit

class ProfileViewController: TWTRTimelineViewController, TWTRTimelineDelegate {
    
    func draw() {
        if UserDefaults.standard.object(forKey: "userID") != nil {
            let client      :TWTRAPIClient = TWTRAPIClient()
            let screenName  :String = UserDefaults.standard.object(forKey: "userName") as! String
            
            self.dataSource         = TWTRUserTimelineDataSource(screenName: screenName, apiClient: client)
            self.timelineDelegate   = self
            self.showTweetActions   = true
            
            self.navigationItem.title = screenName
        }
    }
    
    func timelineDidBeginLoading(_ timeline: TWTRTimelineViewController) {
        print("timelineDidBeginLoading ...")
    }
    
    func timeline(_ timeline: TWTRTimelineViewController, didFinishLoadingTweets tweets: [Any]?, error: Error?) {
        print("timelineDidFinishLoadingTweets.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        draw()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        tabBarItem = UITabBarItem(title: "Timeline", image: AppConstants.appImage.homeNormal, selectedImage: AppConstants.appImage.homeHighlited)
    }
    
}


    


