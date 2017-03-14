//
//  FavouritesViewController.swift
//  atabixchallenge
//
//  Created by Marcos Molero on 9/3/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import TwitterKit

class FavouritesViewController: UIViewController, TWTRTweetViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let instanceAppSingleton = AppSingleton.sharedInstance
    
    var tableView   :UITableView = UITableView()
    var tweets      :[TWTRTweet] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    func getTweetID() {
        NotificationCenter.default.removeObserver(self,name:NSNotification.Name(rawValue: favOk),object: nil)
        
        for item in instanceAppSingleton.jsonObject {
            var tweetID :String = String()
            tweetID = item["id"].stringValue
            instanceAppSingleton.listOfTweetID.append(tweetID)
        }
        
        DispatchQueue.global(qos: .default).async {
            self.loadTweets()
            DispatchQueue.main.async {
                self.draw()
            }
        }
    }
    
    func setupData() {
        NotificationCenter.default.addObserver(self, selector: #selector(FavouritesViewController.getTweetID), name: NSNotification.Name(rawValue: favOk), object: nil)

        let webServiceCommunication :WebServiceComunication = WebServiceComunication()
        webServiceCommunication.tweetFavorites(UserDefaults.standard.object(forKey: "userID")! as! String)
    }
    
    func loadTweets() {
        TWTRAPIClient().loadTweets(withIDs: instanceAppSingleton.listOfTweetID) { tweets2, error in
            if tweets2 != nil {
                for item in tweets2! {
                    self.tweets.append(item)
                }
            } else {
                NSLog("Tweets load error: %@", error!.localizedDescription)
            }
        }
    }
    
    func draw() {
        let tableViewW:CGFloat = UIScreen.main.bounds.width
        let tableViewH:CGFloat = UIScreen.main.bounds.height
        let tableViewX:CGFloat = 0
        let tableViewY:CGFloat = self.navigationController!.navigationBar.frame.size.height + UIApplication.shared.statusBarFrame.height
        
        tableView.frame         = CGRect(x: tableViewX, y: tableViewY, width: tableViewW, height: tableViewH)
        tableView.delegate      = self
        tableView.dataSource    = self

        tableView.estimatedRowHeight    = 150
        tableView.rowHeight             = UITableViewAutomaticDimension
        tableView.allowsSelection       = false
        tableView.register(TWTRTweetTableViewCell.self, forCellReuseIdentifier: "TweetCell")
        
        self.navigationItem.title = "My Favourites"
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tweet   = tweets[indexPath.row]
        let cell    = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath as IndexPath) as! TWTRTweetTableViewCell
        
        cell.tweetView.delegate = self
        cell.configure(with: tweet)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tweet = tweets[indexPath.row]
        return TWTRTweetTableViewCell.height(for: tweet, style: TWTRTweetViewStyle.compact, width: self.view.bounds.width, showingActions: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupData()
    }
}
