//
//  NetworkManager.swift
//  Quotes
//
//  Created by Rui Pereira on 25/03/15.
//  Copyright (c) 2015 SmoothPursuit. All rights reserved.
//

import Foundation
import Alamofire

let kBaseURL: String = "http://www.reddit.com/r/quotes/top.json?sort=top"
let averageScore: UInt = 50

class NetworkManager: NSObject {
    
    // MARK: Request
    
    func request(completionHandler: (quotes: Array<String>, error: NSError?) -> Void) {
        
        Alamofire.request(.GET, kBaseURL, parameters: nil, encoding: .JSON)
            .responseJSON {(request, response, JSON, error) in
                
                var quotes = [String]()
                
                /// this parse is really ugly.
                
                if let jsonResult = JSON as? Dictionary<String,AnyObject> {
                    
                    if let data = jsonResult["data"] as? Dictionary<String,AnyObject> {
                        
                        if let children = data["children"] as? Array<Dictionary<String,AnyObject>> {
                            
                            for post in children {
                                
                                if let dataInside = post["data"] as? Dictionary<String,AnyObject> {
                                    
                                    if let score = dataInside["score"] as? UInt {
                                        
                                        if score > averageScore {
                                            
                                            if let title = dataInside["title"] as? String {
                                                
                                                quotes.append(title)
                                            }
                                            
                                        }
                                    }

                                }
                            }
                        }
                    }
                }
                
                completionHandler(quotes: quotes, error: error)
            }
        }
}
