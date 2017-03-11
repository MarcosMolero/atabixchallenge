//
//  FavouritesViewController.swift
//  atabixchallenge
//
//  Created by Marcos Molero on 9/3/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import TwitterKit

class FavouritesViewController: TWTRTimelineViewController, TWTRTweetViewDelegate {
    
    
    func show() {
        if UserDefaults.standard.object(forKey: "userID") != nil {
            
            let client      :TWTRAPIClient = TWTRAPIClient()
            let screenName  :String = UserDefaults.standard.object(forKey: "userName") as! String
            
            self.dataSource = TWTRUserTimelineDataSource(screenName: screenName, apiClient: client)
            self.showTweetActions = true
        }
    }
    
    func setupData() {
        let webServiceCommunication:WebServiceComunication = WebServiceComunication()
        webServiceCommunication.tweetFavorites(UserDefaults.standard.object(forKey: "userID")! as! String)
//        let tweets = TWTRTweet.tweetsWithJSONArray(array)
        
        // TODO: Recoger el JSON y mostrar los Tweets.
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        
        show()
    }
    func tweetView(tweetView: TWTRTweetView, didSelectTweet tweet: TWTRTweet) {
        // Log a message whenever a user taps on a tweet
        print("Selected tweet with ID: \(tweet.tweetID)")
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
