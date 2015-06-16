//
//  NetworkManager.swift
//  Quotes
//
//  Created by Rui Pereira on 25/03/15.
//  Copyright (c) 2015 SmoothPursuit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RedditProvider: NSObject {
    
    // MARK: Request the most awesome quotes on reddit
    
    func request(completionHandler: (quotes: Array<QuoteModel>, error: NSError?) -> Void) {
        
        Alamofire.request(.GET, Constant.Reddit.URL, parameters: nil, encoding: .JSON)
            .responseJSON {(request, response, json, error) in
                
                var jsonObject: JSON?
                
                if json != nil {
                    
                    jsonObject = JSON(json!)
                }
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    
                    var quotes = RedditParser.parserFromJSON(jsonObject)
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        
                        completionHandler(quotes: quotes, error: error)
                    }
                }
        }
    }
}
