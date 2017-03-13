//
//  FavouritesViewController.swift
//  atabixchallenge
//
//  Created by Marcos Molero on 9/3/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import TwitterKit

class FavouritesViewController: UIViewController {
    
    let instanceAppSingleton = AppSingleton.sharedInstance
    var listOfTweets    :[TWTRTweet] = []
    
    func singleTweet() {
        TWTRAPIClient().loadTweet(withID: "774970775614976001") { (tweet, error) in
            if (tweet != nil) {
                let tweetView = TWTRTweetView(tweet: tweet)
                tweetView.center = CGPoint(x: self.view.center.x, y: self.topLayoutGuide.length + tweetView.frame.size.height / 2);
                self.view.addSubview(tweetView)
            } else {
                NSLog("Tweet load error: %@", error!.localizedDescription)
            }
        }
    }
    
    func multipleTweets() {

        TWTRAPIClient().loadTweets(withIDs: instanceAppSingleton.listOfTweetID) { tweets, error in
            if tweets != nil {
                
                for item in tweets! {
                    print(item)
                    let tweetView = TWTRTweetView(tweet: item)
                    
                    
                    tweetView.center = CGPoint(x: self.view.center.x, y: self.topLayoutGuide.length + tweetView.frame.size.height)
                    self.view.addSubview(tweetView)
                }
            } else {
                NSLog("Tweets load error: %@", error!.localizedDescription)
            }
        }
    }
    
    func getTweetID() {
        NotificationCenter.default.removeObserver(self,name:NSNotification.Name(rawValue: favOk),object: nil)
        
        for item in instanceAppSingleton.jsonObject {
            var tweetID :String = String()
            tweetID = item["id"].stringValue
            instanceAppSingleton.listOfTweetID.append(tweetID)
        }
        multipleTweets()
    }
    
    func setupData() {
        NotificationCenter.default.addObserver(self, selector: #selector(FavouritesViewController.getTweetID), name: NSNotification.Name(rawValue: favOk), object: nil)

        let webServiceCommunication:WebServiceComunication = WebServiceComunication()
        webServiceCommunication.tweetFavorites(UserDefaults.standard.object(forKey: "userID")! as! String)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()

    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
