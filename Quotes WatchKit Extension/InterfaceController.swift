//
//  InterfaceController.swift
//  Quotes WatchKit Extension
//
//  Created by Rui Pereira on 25/03/15.
//  Copyright (c) 2015 SmoothPursuit. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var quoteLabel: WKInterfaceLabel!
    
    var reddit = RedditProvider()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var message : NSDictionary = ["action" : "GA"]
        
        println("awakeWithContext")
        
        [WKInterfaceController.openParentApplication(message as! [String : String],
            reply: { (reply, error) -> Void in
                
                if ((error) != nil) {
                    
                    println("openParentApplication %@", error)
                    
                } else {
                    
                    println("openParentApplication %@", reply)
                }
                
        })]
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        NSLog("willActivate")
        
        reddit.request { (quotes, error) -> Void in
            if (quotes.count > 0) {
                
                let diceRoll = Int(arc4random_uniform(UInt32(quotes.count)))
                NSLog("%d", diceRoll)
                self.quoteLabel.setText(quotes[diceRoll].title)
            } else {
                
                self.quoteLabel.setText(error?.localizedDescription)
            }
        }

        println("willActivate")
        
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
