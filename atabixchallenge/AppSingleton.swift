//
//  AppSingleton.swift
//  atabixchallenge
//
//  Created by Marcos on 13/3/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import SwiftyJSON

class AppSingleton {
    static let sharedInstance: AppSingleton = AppSingleton()
    
    var jsonObject      :[JSON]
    var listOfTweetID   :[String]
    
    init() {
        self.jsonObject     = [JSON]()
        self.listOfTweetID  = [String]()
        
    }
}
