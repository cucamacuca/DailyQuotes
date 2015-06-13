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

    class func parserFromJSON(json: JSON?) -> Array<QuoteModel> {

        var quotes = [QuoteModel]()
        
        if let jsonObj = json {
            
            let children = jsonObj["data"]["children"]
            
            for (index: String, subJson: JSON) in children {
                
                let score = subJson["data"]["score"].intValue
                let title = subJson["data"]["title"].string
                
                if (score > Constant.Reddit.evaluationScore && title != nil) {
                    
                    var quote = QuoteModel()
                    quote.title = title!
                    quote.score = score
                    
                    quotes.append(quote)
                }
            }
            
        }
        
        return quotes
    }
}