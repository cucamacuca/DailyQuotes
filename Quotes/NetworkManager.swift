//
//  NetworkManager.swift
//  Quotes
//
//  Created by Rui Pereira on 25/03/15.
//  Copyright (c) 2015 SmoothPursuit. All rights reserved.
//

import Foundation
import Alamofire

// base url returns the 1st pagination of goal lists

let kBaseURL: String  = "http://www.reddit.com/r/quotes/top.json?sort=top"

class NetworkManager: NSObject {
    
    // MARK: Request
    
    func request(completionHandler: (quotes: Array<String>) -> Void) {
        
        Alamofire.request(.GET, kBaseURL, parameters: nil, encoding: .JSON)
            .responseJSON {(request, response, JSON, error) in
                
                var quotes = [String]()
                
                if let jsonResult = JSON as? Dictionary<String,AnyObject> {
                    
                    if let data = jsonResult["data"] as? Dictionary<String,AnyObject> {
                        
                        if let children = data["children"] as? Array<Dictionary<String,AnyObject>> {
                            
                            for post in children {
                                
                                if let dataInside = post["data"] as? Dictionary<String,AnyObject> {
                                    
                                    if let title = dataInside["title"] as? String {
                                    
                                        quotes.append(title)
                                    }
                                }
                            }
                        }
                    }
                }
                
                completionHandler(quotes: quotes)
            }
        }
}
