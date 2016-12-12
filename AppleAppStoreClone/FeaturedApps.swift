//
//  FeaturedApps.swift
//  AppleAppStoreClone
//
//  Created by Ronald Hernandez on 12/11/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class FeaturedApps: NSObject {

    var bannerCategory: AppCategory?
    var appCategories: [AppCategory]?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == " categories" {
            appCategories = [AppCategory]()
            
            for dict in value as! [String : Any] {
                let appCategory = AppCategory()
                appCategory.setValuesForKeys(dict as! [String : Any])
                appCategories?.append(appCategory)
            }
        } else if key == "bannerCategory" {
            bannerCategory = AppCategory()
            bannerCategory?.setValuesForKeys(value as! [String : AnyObject])
            
        } else {
            super.setValue(value, forKey: key)
        }
        
        }
    }
