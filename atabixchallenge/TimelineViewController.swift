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
            
            tabBarItem = UITabBarItem(title: "Personal", image: UIImage(named:""), selectedImage: UIImage(named:""))
            tabBarItem.isEnabled = false
        }

        override func viewWillAppear(_ animated: Bool) {
            
            if UserDefaults.standard.object(forKey: "userID") != nil {
                //            let appDelegate = UIApplication.shared.delegate as! AppDelegate
                
                let client      :TWTRAPIClient = TWTRAPIClient()
                let screenName  :String = "applesfera"
                self.dataSource = TWTRUserTimelineDataSource(screenName: screenName, apiClient: client)
                
                super.viewWillAppear(animated)
                
                print("TimelineViewController.viewWillAppear)")
            }
            

        }
        
}
