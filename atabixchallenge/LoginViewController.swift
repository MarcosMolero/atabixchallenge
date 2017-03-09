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

let loginOk     :String = "com.marcosmolero.loginOk"
let loginError  :String = "com.marcosmolero.loginError"

class LoginViewController: UIViewController {
    
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
        UserDefaults.standard.set(userID,           forKey: "userID")
        UserDefaults.standard.set(userName,         forKey: "userName")
        UserDefaults.standard.set(authToken,        forKey: "authToken")
        UserDefaults.standard.set(authTokenSecret,  forKey: "authTokenSecret")
        UserDefaults.standard.synchronize()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: loginOk), object: self)
    }
    
    func loginSuccess() {
        NotificationCenter.default.removeObserver(self,name:NSNotification.Name(rawValue: loginOk),object: nil)
//        self.utilActivityIndicator.stopActivityIndicator(self.utilActivityIndicator.actInd)
                
        self.present(TabBarController(), animated: true, completion: nil)
    }
    
    func loginFailure() {
        NotificationCenter.default.removeObserver(self,name:NSNotification.Name(rawValue: loginError),object: nil)
        // Show alert
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        draw()
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.loginSuccess), name: NSNotification.Name(rawValue: loginOk), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.loginFailure), name: NSNotification.Name(rawValue: loginError), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Entro en Login")
        
    }
}
