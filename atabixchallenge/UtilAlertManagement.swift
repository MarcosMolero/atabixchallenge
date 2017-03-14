//
//  UtilAlertManagement.swift
//  atabixchallenge
//
//  Created by Marcos Molero on 11/3/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit

class UtilAlertManagement {
    static func loginFailed(_ actualViewController: UIViewController) {
        var refreshAlert    :UIAlertController = UIAlertController()
        refreshAlert = UIAlertController(   title: "Error",
                                            message: "An error ocurred, please try to log in again",
                                            preferredStyle: UIAlertControllerStyle.alert)
        refreshAlert.addAction(UIAlertAction(   title: "Ok",
                                                style: .default,
                                                handler: { (action: UIAlertAction!) in
                                                    
        }))
        actualViewController.present(refreshAlert, animated: false, completion: nil)
    }
    
}
