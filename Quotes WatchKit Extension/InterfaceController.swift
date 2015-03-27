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
    
    var network = NetworkManager()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        NSLog("willActivate")
        network.request { (quotes) -> Void in
            
            let diceRoll = Int(arc4random_uniform(UInt32(quotes.count)))
            NSLog("%d", diceRoll)
            self.quoteLabel.setText(quotes[diceRoll])
        }
        
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
