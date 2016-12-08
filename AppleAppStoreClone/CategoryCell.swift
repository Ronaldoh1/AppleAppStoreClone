//
//  CategoryCell.swift
//  AppleAppStoreClone
//
//  Created by Ronald Hernandez on 12/7/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUPViews() {
        self.backgroundColor = .black
    }
    
}
