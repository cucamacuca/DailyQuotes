//
//  QuotesTests.swift
//  QuotesTests
//
//  Created by Rui Pereira on 25/03/15.
//  Copyright (c) 2015 SmoothPursuit. All rights reserved.
//

import UIKit
import XCTest
import SwiftyJSON


class RedditParserTests: XCTestCase {
    
    var json: JSON?
    var model: Array<QuoteModel> = []
    
    override func setUp() {
        
        super.setUp()
        
        if let path = NSBundle(forClass: RedditParserTests.self).URLForResource("redditMock", withExtension: "json") {

            if let data = NSData(contentsOfURL: path) {
                
                self.json = JSON(data: data)
                self.model = RedditParser.parserFromJSON(json!)
            }
        }
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testRedditParserIsNotNil() {

        XCTAssertNotNil(self.model, "Reddit Parser shouldn't return nil values")
    }
    
    func testRedditParserNumberOfItems() {

        XCTAssertEqual(self.model.count, 7, "Reddit Parser number of items should be equal to 7")
    }
    
    func testRedditParserTheFirstAndLastQuotes() {
        
        XCTAssertEqual(self.model[0].title, "\"We think too much and feel too little. More than machinery, we need humanity. More than cleverness, we need kindness and gentleness. Without these qualities, life would be violent, and all would be lost...\" - Charlie Chaplin, speech from the movie The Great Dictator, 1940" , "Reddit Parser title should be equal")
        XCTAssertEqual(self.model[6].title, "“Everyone is in favor of free speech. Hardly a day passes without its being extolled, but some people's idea of it is that they are free to say what they like, but if anyone else says anything back, that is an outrage.” ~ Winston Churchill")
    }
    
    func testRedditParserIsEqualToZero() {
        
        self.model = RedditParser.parserFromJSON(nil)
        
        XCTAssertEqual(self.model.count, 0, "Reddit Parser number of items should be equal to 0")
    }
    
    func testPerformanceParser() {

        self.measureBlock() {

            self.model = RedditParser.parserFromJSON(self.json!)
        }
    }
    
}
