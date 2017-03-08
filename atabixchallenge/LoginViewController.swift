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
                
                
                
            } else {
                NSLog("Login error: %@", error!.localizedDescription);
            }
        }
        
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        draw()
    }
}
