//
//  Action.swift
//  Quotes
//
//  Created by Rui Pereira on 12/06/15.
//  Copyright (c) 2015 SmoothPursuit. All rights reserved.
//

import Foundation

class Action: NSObject {
    
    func getAction(commands: [NSObject : AnyObject]?) -> Action {
    
        if let cmd = commands?[Constant.Parser.Action] as? String {
        
            if let command = Command(rawValue: cmd) {
                
                return self.getObjectResponsibility(command)
            }
        }
        
        return Action()
    }

    func getObjectResponsibility(command: Command) -> Action {
        
        switch command {
            
            case .WatchGATracking: return GAWatchImplementation()
            default: return Action()
        }
    }

    func execute(completionHandler: (object: [NSObject : AnyObject]) -> Void) {
        
        // to be overriden
    }
}