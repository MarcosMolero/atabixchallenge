//
//  WebServiceCommunication.swift
//  atabixchallenge
//
//  Created by Marcos Molero on 10/3/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import TwitterKit
import Alamofire
import SwiftyJSON

class WebServiceComunication {
    
    func tweetFavorites(_ userID:String) {
        let client          :TWTRAPIClient = TWTRAPIClient()
        let url             :String = "https://api.twitter.com/1.1/favorites/list.json"
        let params          :Dictionary = ["user_id": "\(userID)", "count": "20"]
        var clientError     :NSError?

        let request = client.urlRequest(withMethod: "GET", url: url, parameters: params, error: &clientError)
        
        client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
            if connectionError != nil {
                print("Error: \(connectionError)")
            }
            
            do {
                let instanceAppSingleton    = AppSingleton.sharedInstance
                let jsonObject              = JSON(data: data!)
                
                instanceAppSingleton.jsonObject = jsonObject.arrayValue
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: favOk), object: self)

            } catch let jsonError as NSError {
                print("json error: \(jsonError.localizedDescription)")
            }
        }
    }
    
    func tweetRequest(_ id:String) { // 595488594917195776
        let client          :TWTRAPIClient = TWTRAPIClient()
        let url             :String = "https://api.twitter.com/1.1/statuses/show.json"
        let params          :Dictionary = ["id": "\(id)"]
        var clientError     :NSError?
        
        let request = client.urlRequest(withMethod: "GET", url: url, parameters: params, error: &clientError)
        
        client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
            if connectionError != nil {
                print("Error: \(connectionError)")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("json: \(json)")
            } catch let jsonError as NSError {
                print("json error: \(jsonError.localizedDescription)")
            }
        }
    }
    
}
