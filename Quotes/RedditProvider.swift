//
//  NetworkManager.swift
//  Quotes
//
//  Created by Rui Pereira on 25/03/15.
//  Copyright (c) 2015 SmoothPursuit. All rights reserved.
//

import Foundation
import Alamofire

class RedditProvider: NSObject {
    
    // MARK: Request the most awesome quotes on reddit
    
    func request(completionHandler: (quotes: Array<QuoteModel>, error: NSError?) -> Void) {
        
        Alamofire.request(.GET, Constant.Reddit.URL, parameters: nil, encoding: .JSON)
            .responseJSON {(request, response, json, error) in
                
                var quotes = RedditParser.parserFromJSON(json)
                
                completionHandler(quotes: quotes, error: error)
            }
        }
}
