//
//  TestUtils.swift
//  SampleAppTests
//
//  Created by Tuan Phan on 4/20/18.
//  Copyright © 2018 Tuan Phan. All rights reserved.
//

import Foundation
import XCTest


class TestUtils: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testExample() {
//        print("Good morning VietNam")
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func log(_ message: String) {
        print("=========>> \(message)")
    }
}

