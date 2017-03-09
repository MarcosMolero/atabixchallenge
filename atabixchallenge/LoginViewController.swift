//
//  LoginViewController.swift
//  atabixchallenge
//
//  Created by Marcos on 8/3/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit
import TwitterKit

class LoginViewController:UIViewController {
    func draw() {
        let logInButton = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
                
                print("\n\(unwrappedSession.userID)")
                print("\n\(unwrappedSession.userName)")
                print("\n\(unwrappedSession.authToken)")
                print("\n\(unwrappedSession.authTokenSecret)")
                
                self.saveToken(unwrappedSession.userID, unwrappedSession.userName, unwrappedSession.authToken, unwrappedSession.authTokenSecret)
            } else {
                NSLog("Login error: %@", error!.localizedDescription);
            }
        }
        
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
    }
    
    func saveToken(_ userID:String, _ userName:String, _ authToken:String, _ authTokenSecret:String) {
        UserDefaults.standard.set(userID, forKey: "userID")
        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(authToken, forKey: "authToken")
        UserDefaults.standard.set(authTokenSecret, forKey: "authTokenSecret")
        UserDefaults.standard.synchronize()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        draw()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("LoginViewController.viewWillAppear)")
        
    }
}
