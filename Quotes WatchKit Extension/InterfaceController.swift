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
    
    var wc = WatchCommunicator()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // send message to parent to send Watch GA screen tracking
        wc.sendMessageToParent(Command.WatchGATracking)
    }
    
    override func willActivate() {
        
        // get quotes from reddit
        wc.getQuotes { (quote) -> Void in
            
            self.quoteLabel.setText(quote)
        }
        
        super.willActivate()
    }
    
    override func didDeactivate() {
        
        super.didDeactivate()
    }
}
