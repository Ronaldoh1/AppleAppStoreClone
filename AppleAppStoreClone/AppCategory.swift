//
//  AppCategory.swift
//  AppleAppStoreClone
//
//  Created by Ronald Hernandez on 12/11/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class AppCategory: NSObject {
    
    var name: String?
    
    var apps: [App]?
    
    var type: String?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "apps" {
             apps = [App]()
            for dict in value as! [[String : AnyObject]] {
                let app = App()
                app.setValuesForKeys(dict)
                self.apps?.append(app)
            }
        } else {
            
        }
    }
    
    static func fetchFeaturedApps(completionHandler: @escaping (FeaturedApps) -> ()) {
        let urlString = "http://www.statsallday.com/appstore/featured"
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            do {
            
              let  json = try(JSONSerialization.jsonObject(with: data!, options: .mutableContainers))
              
                
                let featuredApps = FeaturedApps()
                
                FeaturedApps.setValuesForKeys(json as! [String : Any])
                
                
                DispatchQueue.main.async {
                   completionHandler(featuredApps)
                }
            
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    static func sampleAppCategories() -> [AppCategory] {
    
        let bestNewApps = AppCategory()
        bestNewApps.name = "Best New Apps"
        
        var apps = [App]()
        
        let frozenApp = App()
        frozenApp.name = "Disney Build it: Frozen"
        frozenApp.category = "Entertainment"
        frozenApp.price = NSNumber(value: 3.99)
        frozenApp.imageName = "frozen"
        apps.append(frozenApp)
        
        bestNewApps.apps = apps
        
        let bestNewGames = AppCategory()
        bestNewGames.name = "Best New Games"
        
        var bestNewGamesApps = [App]()
       
        let game = App()
        game.name = "Telepaint"
        game.category = "Games"
        game.imageName = "telepaint"
        game.price = NSNumber(value: 2.99)
        bestNewGamesApps.append(game)
        
        bestNewGames.apps = bestNewGamesApps
        
        return [bestNewApps, bestNewGames]
    }
    
}
