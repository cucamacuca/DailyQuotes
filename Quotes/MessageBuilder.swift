//
//  WatchRequest.swift
//  Quotes
//
//  Created by Rui Pereira on 12/06/15.
//  Copyright (c) 2015 SmoothPursuit. All rights reserved.
//

import Foundation

class MessageBuilder {
    
    class func request(command: Command) -> [NSObject : AnyObject] {
        
        return [Constant.Parser.Action: command.rawValue]
    }
    
    class func response(isSuccess: Bool, message: String) -> [NSObject : AnyObject] {
        
        var state = isSuccess ? Constant.Parser.Sucess : Constant.Parser.Error
        
        return [state: message]
    } 
}