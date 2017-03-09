//
//  TimelineViewController.swift
//  atabixchallenge
//
//  Created by Marcos Molero on 7/3/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import TwitterKit

class TimelineViewController: TWTRTimelineViewController {
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
        }

        override func viewWillAppear(_ animated: Bool) {
            
            if UserDefaults.standard.object(forKey: "userID") != nil {
                let client      :TWTRAPIClient = TWTRAPIClient()
                let screenName  :String = UserDefaults.standard.object(forKey: "userName") as! String
                self.dataSource = TWTRUserTimelineDataSource(screenName: screenName, apiClient: client)
                
                super.viewWillAppear(animated)
            }
            
            print("Entro en Timeline")
        }
    
    
//    func showTimeline() {
//        // Create an API client and data source to fetch Tweets for the timeline
//        let client = TWTRAPIClient()
//        //TODO: Replace with your collection id or a different data source
//        let dataSource = TWTRCollectionTimelineDataSource(collectionID: "539487832448843776", apiClient: client)
//        // Create the timeline view controller
//        let timelineViewControlller = TWTRTimelineViewController(dataSource: dataSource)
//        // Create done button to dismiss the view controller
//        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissTimeline))
//        timelineViewControlller.navigationItem.leftBarButtonItem = button
//        // Create a navigation controller to hold the
//        let navigationController = UINavigationController(rootViewController: timelineViewControlller)
//        showDetailViewController(navigationController, sender: self)
//    }
//    
//    func dismissTimeline() {
//        dismiss(animated: true, completion: nil)
//    }

}
