//
//  GoogleAnalytics.swift
//  Quotes
//
//  Created by Rui Pereira on 11/06/15.
//  Copyright (c) 2015 SmoothPursuit. All rights reserved.
//

import Foundation

class GoogleAnalytics {
    
    init () {
        
        GAI.sharedInstance().trackUncaughtExceptions = true
        GAI.sharedInstance().dispatchInterval = Constant.GA.interval
        GAI.sharedInstance().logger.logLevel = GAILogLevel.Verbose
        GAI.sharedInstance().trackerWithTrackingId(Constant.GA.trackingId)
    }
    
    func track(screen:String) -> Void {
    
        var tracker:GAITracker = GAI.sharedInstance().defaultTracker as GAITracker
    
        tracker.allowIDFACollection = true
        tracker.set(kGAIScreenName, value:screen)
        tracker.send(GAIDictionaryBuilder.createScreenView().build() as [NSObject : AnyObject])
    }
}