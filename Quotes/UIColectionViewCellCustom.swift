//
//  UIColectionViewCellCustom.swift
//  Quotes
//
//  Created by Rui Pereira on 04/04/15.
//
//  Copyright (c) 2015 SmoothPursuit. All rights reserved.
//

import Foundation

class UICollectionViewCellCustom: UICollectionViewCell {
    
    var quote: UILabel
    let defaultFontName = "HelveticaNeue"
    let defaultSizeFont: CGFloat = 40.0
    let edgeInset: CGFloat = 30

    override init(frame: CGRect) {
        
        self.quote = UILabel(frame: CGRectZero)
        
        super.init(frame: frame)

        self.setupLabel()
        self.setupConstraints()
    }

    required init(coder aDecoder: NSCoder) {

        self.quote = UILabel(frame: CGRectZero)
  
        super.init(coder: aDecoder)
        
        self.setupLabel()
        self.setupConstraints()
    }
    
    override func prepareForReuse() {
        
        self.quote.text = ""
        
        super.prepareForReuse()
    }
    
    func setupLabel() {
        
        self.quote.textColor = UIColor.whiteColor()
        self.quote.font = UIFont(name: defaultFontName, size: defaultSizeFont)
        self.quote.textAlignment = NSTextAlignment.Center
        self.quote.numberOfLines = 0
    }
    
    func setupConstraints() {

        self.addSubview(quote)
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.quote.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.quote.fillSuperview(UIEdgeInsets(top: 0, left: edgeInset, bottom: 0, right: -edgeInset))
    }
    
    func configure(quote: QuoteModel) -> Void {
        
        self.quote.text = quote.title
    }
}