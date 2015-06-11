//
//  UICollectionViewDataSource.swift
//  Quotes
//
//  Created by Rui Pereira on 04/04/15.
//  Copyright (c) 2015 SmoothPursuit. All rights reserved.
//

import Foundation

typealias DataSourceHandler = ((cell: UICollectionViewCellCustom, item: AnyObject, indexPath: NSIndexPath) -> Void)!

class DataSource: NSObject, UICollectionViewDataSource {
    
    private var configurationHandler: DataSourceHandler
    private var items: [AnyObject]
    
    init(completionHandler: DataSourceHandler) {
    
        self.configurationHandler = completionHandler
        self.items = [AnyObject]()
        super.init()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell : UICollectionViewCellCustom? = collectionView.dequeueReusableCellWithReuseIdentifier(NSStringFromClass(UICollectionViewCellCustom.self), forIndexPath: indexPath) as? UICollectionViewCellCustom

        if (self.items.count > 0) {
            
            var item: AnyObject = self.items[indexPath.row] as AnyObject
            
            self.configurationHandler(cell: cell!, item: item, indexPath: indexPath)
        }

        return cell!
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func updateItems(items: [AnyObject]) {
        
        self.items = items
    }
}