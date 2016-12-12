//
//  Header.swift
//  AppleAppStoreClone
//
//  Created by Ronald Hernandez on 12/11/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class Header: CategoryCell {

    let bannerCellID = "bannerCellID"
    
    override func setUpViews() {
        super.setUpViews()
        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        
        appsCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: bannerCellID)
        
        addSubview(appsCollectionView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : appsCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : appsCollectionView]))
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 32)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerCellID, for: indexPath) as! AppCell
        cell.app = appCategory?.apps?[indexPath.row]
        return cell
    }
    
    //add margins 
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return  UIEdgeInsetsMake(0, 0, 0, 0)
    }
}
