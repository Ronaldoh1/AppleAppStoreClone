//
//  LargeCategoryCell.swift
//  AppleAppStoreClone
//
//  Created by Ronald Hernandez on 12/11/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class LargeCategoryCell: CategoryCell {
    
    let largeAppCellID = "largeAppCellID"
    
    override func setUpViews() {
        super.setUpViews()
        
        appsCollectionView.register(LargeAppCell.self, forCellWithReuseIdentifier: largeAppCellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 32)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeAppCellID, for: indexPath) as! AppCell
        cell.app = appCategory?.apps?[indexPath.row]
        return cell
    }
    
}
