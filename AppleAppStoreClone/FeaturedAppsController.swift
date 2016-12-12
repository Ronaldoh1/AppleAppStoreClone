//
//  ViewController.swift
//  AppleAppStoreClone
//
//  Created by Ronald Hernandez on 12/7/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellIdentifer = "cellID"
    
    var appCategories: [AppCategory]? 

    override func viewDidLoad() {
        super.viewDidLoad()
                
        AppCategory.fetchFeaturedApps { (appCategories) in
            self.appCategories = appCategories
            self.collectionView?.reloadData()
        }
       
        collectionView?.backgroundColor = .white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellIdentifer)
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategories?.count {
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifer, for: indexPath) as! CategoryCell
        
        cell.appCategory = appCategories?[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }
    
}

