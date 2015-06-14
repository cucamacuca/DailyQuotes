//
//  GAImplementation.swift
//  Quotes
//
//  Created by Rui Pereira on 12/06/15.
//  Copyright (c) 2015 SmoothPursuit. All rights reserved.
//

import Foundation


class GAWatchImplementation: Action {
    
    let response = "GA Watch Sent"
    
    override func execute(completionHandler: (object: [NSObject : AnyObject]) -> Void) {
        
        // track watch execution
        GoogleAnalytics.sharedInstance.track(Constant.GA.homeWatchScreen)
        
        completionHandler(object: MessageBuilder.response(true, message: response))
    }
}