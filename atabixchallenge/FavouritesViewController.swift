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
    
    
    func show() {
        // 774970773219999745
        // 631879971628183552
        
        // TODO: Base this Tweet ID on some data from elsewhere in your app
        TWTRAPIClient().loadTweet(withID: "631879971628183552") { (tweet, error) in
            
            if (tweet != nil) {
                let tweetView = TWTRTweetView(tweet: tweet)
                tweetView.center = CGPoint(x: self.view.center.x, y: self.topLayoutGuide.length + tweetView.frame.size.height / 2);
                self.view.addSubview(tweetView)
            } else {
                NSLog("Tweet load error: %@", error!.localizedDescription)
            }
        }

        



        

    }
    
    func setupData() {
        let webServiceCommunication:WebServiceComunication = WebServiceComunication()
        webServiceCommunication.tweetFavorites(UserDefaults.standard.object(forKey: "userID")! as! String)
//        let tweets = TWTRTweet.tweetsWithJSONArray(array)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        
      
//        show()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
