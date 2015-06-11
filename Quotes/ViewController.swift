//
//  ViewController.swift
//  Quotes
//
//  Created by Rui Pereira on 25/03/15.
//  Copyright (c) 2015 SmoothPursuit. All rights reserved.
//

import UIKit

class ViewController: GAITrackedViewController {

    var collectionView: UICollectionView
    var dataSource: DataSource?
    var layout: UICollectionFlowLayoutCustom
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        self.layout = UICollectionFlowLayoutCustom()
        self.collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: self.layout)
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init(coder aDecoder: NSCoder) {

        self.layout = UICollectionFlowLayoutCustom()
        self.collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: self.layout)
        
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        
        setupDataSource()
        setupView()
        setupCollectionView()
        setupRequest()

        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.screenName = Constant.GA.homeiPhoneScreen
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        
        self.view.frame = UIScreen.mainScreen().bounds
        self.view.addSubview(self.collectionView)
    }
    
    func setupCollectionView() {
        
        self.registerClasses()
        
        self.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.collectionView.backgroundColor = UIColor.blackColor()
        self.collectionView.fillSuperview(UIEdgeInsetsZero)
        self.collectionView.scrollEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.dataSource = self.dataSource
        self.collectionView.pagingEnabled = true
    }
    
    func setupDataSource() {
        
        self.dataSource = DataSource(
            completionHandler: {
                
                (cell, item, indexPath) -> Void in
                
                let quote = item as? QuoteModel
                
                cell.quote.text = quote?.title
        })
    }
    
    func setupRequest() {
        
         RedditProvider().request { (quotes, error) -> Void in
            
            var items = quotes
            
            if error != nil && quotes.count == 0 {
            
                // create a fake quote
                var errorQuote = QuoteModel()
                errorQuote.title = error!.localizedDescription
                
                items.append(errorQuote)
            }
            
            self.dataSource?.updateItems(items)
            
            self.collectionView.reloadData()
        }
    }
    
    func registerClasses() {
        
        self.collectionView.registerClass(UICollectionViewCellCustom.self,forCellWithReuseIdentifier:NSStringFromClass(UICollectionViewCellCustom.self))
    }
}