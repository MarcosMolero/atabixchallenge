//
//  CustomSearchBar.swift
//  atabixchallenge
//
//  Created by Marcos Molero on 10/3/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CustomSearchBar: UISearchBar {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupViews()
    }
    
    func setupViews() {
        self.backgroundColor = UIColor.red
        self.layer.cornerRadius = 5.0;
        
        for subview in (self.subviews.last?.subviews)! {
            if subview.isKind(of: NSClassFromString("UISearchBarBackground")!) {
                subview.removeFromSuperview()
                break
            }
        }
        self.backgroundColor = UIColor(colorLiteralRed: 0/255, green: 122/255, blue: 255/255, alpha: 1.0)
        self.tintColor = UIColor.white
        self.returnKeyType = .done
        
        let searchField:UITextField = self.value(forKey: "searchField") as! UITextField
        searchField.backgroundColor = UIColor.clear
        searchField.textColor = UIColor.white
        //        searchField.attributedPlaceholder =
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func prepareForInterfaceBuilder() {
        setupViews()
    }

    
}
