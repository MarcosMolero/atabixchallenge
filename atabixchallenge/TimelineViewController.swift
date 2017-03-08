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
    
    func draw() {
        // Add a button to the center of the view to show the timeline
        let button = UIButton(type: .system)
        button.setTitle("Show Timeline", for: [])
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(showTimeline), for: [.touchUpInside])
        view.addSubview(button)
    }
    
    func showTimeline() {
        // Create an API client and data source to fetch Tweets for the timeline
        let client = TWTRAPIClient()
        
        //TODO: Replace with your collection id or a different data source
        let dataSource = TWTRCollectionTimelineDataSource(collectionID: "393773266801659904", apiClient: client)
    
        // Create the timeline view controller
        let timelineViewControlller = TWTRTimelineViewController(dataSource: dataSource)
        
        // Create done button to dismiss the view controller
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissTimeline))
        timelineViewControlller.navigationItem.leftBarButtonItem = button
        
        // Create a navigation controller to hold the
        let navigationController = UINavigationController(rootViewController: timelineViewControlller)
        showDetailViewController(navigationController, sender: self)
    }
    
    func dismissTimeline() {
        dismiss(animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        draw()
    }
}
