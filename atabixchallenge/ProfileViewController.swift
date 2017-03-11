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
    
    
    
    func show() {
        if UserDefaults.standard.object(forKey: "userID") != nil {
            
            let client      :TWTRAPIClient = TWTRAPIClient()
            let screenName  :String = UserDefaults.standard.object(forKey: "userName") as! String
            
            self.dataSource = TWTRUserTimelineDataSource(screenName: screenName, apiClient: client)
            self.timelineDelegate = self
            self.showTweetActions = true
            
            
            
            self.navigationItem.title = screenName
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> TWTRTweetTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TWTRTweetTableViewCell
        
        cell.tweetView.backgroundColor = UIColor.red
        
        return cell
    }
    
    func timelineDidBeginLoading(_ timeline: TWTRTimelineViewController) {
        print("timelineDidBeginLoading ...")
    }
    
    func timeline(_ timeline: TWTRTimelineViewController, didFinishLoadingTweets tweets: [Any]?, error: Error?) {
        print("timelineDidFinishLoadingTweets.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        show()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        tabBarItem = UITabBarItem(title: "Personal", image: AppConstants.appImage.homeNormal, selectedImage: AppConstants.appImage.homeHighlited)
        tabBarItem.isEnabled = true
    }
    
}


    


