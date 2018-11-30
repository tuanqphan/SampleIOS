//
//  SampleAppTests.swift
//  SampleAppTests
//
//  Created by Tuan Phan on 4/16/18.
//  Copyright © 2018 Tuan Phan. All rights reserved.
//

import XCTest
import Foundation

@testable import SampleApp

class SampleAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMultiArray() {
        multiArray(ofSize: 4)
    }
    
    func testMultiThreading() {
        for each in 0..<10 {
            PrintingQueue.sharedInstance.addToList(string: "\(each)")
        }
    }
    
    func testSemaphore() {
        Semaphore()
    }
    
    func testEnumTesting() {
        EnumTesting()
    }
    

}


enum BatteryStatus: Error {
    case full
    case low(Int)

    func level() -> Int {
        switch self {
        case .low(let level):
            return level
        case .full:
            return 100
        }
    }
}

func checkBatteryStatus(batteryLevel: Int) throws {
    if batteryLevel < 20 {
        throw BatteryStatus.low(batteryLevel)
    }
}

func EnumTesting() {
    do {
        try checkBatteryStatus(batteryLevel: 10)
    } catch BatteryStatus.low(let currentLevel) {
        print(currentLevel)
    } catch {
        
    }
}



func Semaphore() {
    let dispatchQueue = DispatchQueue.global()
    
    let semaphore = DispatchSemaphore(value: 2)
    
    dispatchQueue.async {
        semaphore.wait()
        print("Sema block 1")
        semaphore.signal()
    }
    
    dispatchQueue.async {
        semaphore.wait()
        print("Sema block 2")
        semaphore.signal()
    }
    
//    dispatchQueue.async {
//        semaphore.wait()
//        print("Sema block 3")
//        semaphore.signal()
//    }
//
//    dispatchQueue.async {
//        semaphore.wait()
//        print("Sema block 4")
//        semaphore.signal()
//    }

}

class PrintingQueue {
    var semaphore = DispatchSemaphore(value: 1)
    
    private var list: Array<String> = [""] {
        didSet {
            printNext()
        }
    }
    
    static var sharedInstance: PrintingQueue = {
            DispatchQueue.global().sync {
                return PrintingQueue()
            }
    }()
    
    func addToList(string: String) {
        //DispatchQueue.global().async {
            self.list.append(string)
            semaphore.signal()
        //}
    }
    
    func printNext() {
        //let delayFor = 2.0

        DispatchQueue.global(qos: .userInteractive).sync {
            //DispatchQueue.main.asyncAfter(deadline: .now() + delayFor) {
            //}
            
            if self.list.isEmpty {
                self.semaphore.wait()
            }
            
            print(self.list)
            print(self.list.removeFirst())
        }
    }
}

func runInThread(string: String) {
    DispatchQueue.global(qos: .userInteractive).sync {
        print(string)
    }
}

func multiArray(ofSize: Int) {
    var multA =  [[Int]]()
    
    for eachX in 1...ofSize {
        multA.append(Array(repeating: eachX, count: eachX))
    }
    
    print(multA)
    
    for (key, row) in multA.enumerated() {
        print("[", terminator:"")
        for (key, _) in row.enumerated() {
            print(row[key], terminator:"")
            if key < row.count - 1 {
                print(",", terminator:"")
            }
        }
        if key < multA.count - 1 {
            print("],")
        } else {
            print("]")
        }
    }
}


