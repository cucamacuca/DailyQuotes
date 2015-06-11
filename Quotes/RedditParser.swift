//
//  RedditParser.swift
//  Quotes
//
//  Created by Rui Pereira on 11/06/15.
//  Copyright (c) 2015 SmoothPursuit. All rights reserved.
//

import Foundation
import SwiftyJSON

class RedditParser {

    class func parserFromJSON(json: AnyObject?) -> Array<QuoteModel> {

        var quotes = [QuoteModel]()
        var json = JSON(json!)
        
        let children = json["data"]["children"]
        
        for (index: String, subJson: JSON) in children {
            
            let score = subJson["data"]["score"].intValue
            let title = subJson["data"]["title"].string
            
            if (score > averageScore && title != nil) {
                
                var quote = QuoteModel()
                quote.title = title!
                quote.score = score
                
                quotes.append(quote)
            }
        }
        
        return quotes
    }
}