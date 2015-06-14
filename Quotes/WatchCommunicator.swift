//
//  WatchCommunicator.swift
//  Quotes
//
//  Created by Rui Pereira on 13/06/15.
//  Copyright (c) 2015 SmoothPursuit. All rights reserved.
//

import WatchKit
import Foundation

class WatchCommunicator {

    var reddit = RedditProvider()
    let openParentApplicationMessage = "openParentApplication %@"
    
    func sendMessageToParent(command: Command) -> Void {
        
        let message = MessageBuilder.request(command)
        
        [WKInterfaceController.openParentApplication(message as! [String : String],
            reply: { (reply, error) -> Void in
                
                if error != nil {
                    
                    NSLog(self.openParentApplicationMessage, error);
                    
                } else {
                    
                    NSLog(self.openParentApplicationMessage, reply);
                }
        })]
    }

    func getQuotes(completionHandler: (quote: String) -> Void) {
        
        self.reddit.request { (quotes, error) -> Void in
            
            var message: String = ""
            
            if quotes.count > 0 {
                
                message = quotes[self.diceRoll(quotes.count)].title;
            }
            
            if let errorObj = error {
                
                message = errorObj.localizedDescription
            }
            
            completionHandler(quote: message)
        }
    }
    
    func diceRoll(range: Int) -> Int {
        
        return Int(arc4random_uniform(UInt32(range)))
    }
}