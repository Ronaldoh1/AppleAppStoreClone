//
//  AppCell.swift
//  AppleAppStoreClone
//
//  Created by Ronald Hernandez on 12/8/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "frozen")
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = 16
        imgView.layer.masksToBounds = true
        return imgView
    }()
    
    let nameLabel: UILabel = {
      let label = UILabel()
       label.text = "Disney build It: Frozen"
       label.font = UIFont.systemFont(ofSize: 13)
       label.numberOfLines = 2
       return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Entertaintment"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.gray
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$3.99"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.gray
        return label
    }()
    
    var app: App? {
        didSet {
            
            if let name = app?.name {
                nameLabel.text = name
                
                let rect = NSString(string: name).boundingRect(with: CGSize(width: frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union((NSStringDrawingOptions.usesLineFragmentOrigin)), attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 14)], context: nil)
                
                if rect.height > 20 {
                   
                    categoryLabel.frame = CGRect(x: 0, y: frame.width + 38, width: frame.width, height: 20)
                    priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
 
                } else {
                    categoryLabel.frame = CGRect(x: 0, y: frame.width + 22, width: frame.width, height: 20)
                    priceLabel.frame = CGRect(x: 0, y: frame.width + 42, width: frame.width, height: 20)
                }
                 nameLabel.frame = CGRect(x: 0, y: frame.width + 5, width: frame.width, height: 40)
                 nameLabel.sizeToFit()
            }
            
            if let price  = app?.price {
                priceLabel.text = "$\(price)"
            } else {
                priceLabel.text = ""
            }
            
            if let category = app?.category {
              categoryLabel.text = category
            }
            if let imageName = app?.imageName {
             imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
            }
    
    
}
