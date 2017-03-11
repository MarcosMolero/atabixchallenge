//
//  SearchViewController.swift
//  atabixchallenge
//
//  Created by Marcos Molero on 10/3/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import TwitterKit

class SearchViewController:UIViewController {
    
    @IBOutlet weak var searchBar: CustomSearchBar!
    @IBOutlet weak var searchButton: CustomSearchButton!
    
//    func show2(){
//        let client      = TWTRAPIClient()
//        self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "#apple", apiClient: client)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
