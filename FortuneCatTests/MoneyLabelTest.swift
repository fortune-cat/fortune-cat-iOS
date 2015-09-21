//
//  MoneyLabelTest.swift
//  FortuneCat
//
//  Created by Kouki Saito on 2015/09/16.
//  Copyright © 2015年 FortuneCat. All rights reserved.
//

import XCTest
@testable import FortuneCat

class MoneyLabelTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMakeMoneyText() {
        let label = MoneyLabel()
        XCTAssertEqual(label.makeMoneyText(135, digit: 5), "¥ 00135")
        XCTAssertEqual(label.makeMoneyText(-1335, digit: 5), "-¥ 01335")
        XCTAssertEqual(label.makeMoneyText(135), "¥ 135")
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
