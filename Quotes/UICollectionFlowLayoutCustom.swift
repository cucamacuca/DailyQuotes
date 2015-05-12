//
//  UICollectionFlowLayoutCustom.swift
//  Quotes
//
//  Created by Rui Pereira on 05/04/15.
//  Copyright (c) 2015 SmoothPursuit. All rights reserved.
//

import Foundation

class UICollectionFlowLayoutCustom: UICollectionViewFlowLayout {
    
    override init() {
        
        super.init()
        
        self.defaultConfiguration()
    }
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.defaultConfiguration()
    }
    
    func defaultConfiguration() {
        
        self.scrollDirection = UICollectionViewScrollDirection.Horizontal
        self.sectionInset = UIEdgeInsetsZero
        self.minimumInteritemSpacing = 0.0
        self.minimumLineSpacing = 0.0
        self.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
    }
}
