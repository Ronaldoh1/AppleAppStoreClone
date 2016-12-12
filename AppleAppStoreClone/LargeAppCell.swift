//
//  LargeAppCell.swift
//  AppleAppStoreClone
//
//  Created by Ronald Hernandez on 12/11/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class LargeAppCell: AppCell {
    
    internal override func setUpViews() {
        super.setUpViews()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(imageView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : imageView]))
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-2[v0]-14-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : imageView]))
    }

}
