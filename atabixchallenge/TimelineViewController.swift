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
            
            let client = TWTRAPIClient()
            let dataSource = TWTRUserTimelineDataSource(screenName: client.userID!, apiClient: client)
            
            self.init(dataSource: dataSource)
        }
        
        override required init(dataSource: TWTRTimelineDataSource?) {
            super.init(dataSource: dataSource)
        }
        
        required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)!
        }
        
        override func viewWillAppear(_ animated: Bool) {
            
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let client = TWTRAPIClient()

            let screenName = "applesfera"
                
            self.dataSource = TWTRUserTimelineDataSource(screenName: screenName, apiClient: client)
            
            // kick off actual rendering
            super.viewWillAppear(animated)
            
            print("TweetViewController.viewWillAppear: \(self.dataSource)")
        }
        
}
