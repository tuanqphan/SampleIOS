//
//  SampleAppUITests.swift
//  SampleAppUITests
//
//  Created by Tuan Phan on 4/16/18.
//  Copyright © 2018 Tuan Phan. All rights reserved.
//

import XCTest

class SampleAppUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.navigationBars["SampleApp.PlayersTableView"].buttons["Add"].tap()
        
        let tablesQuery2 = app.tables
        let textField = tablesQuery2.children(matching: .cell).element(boundBy: 0).children(matching: .textField).element
        textField.tap()
        textField.typeText("Tuan")
        
        let tablesQuery = tablesQuery2
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Detail"]/*[[".cells.staticTexts[\"Detail\"]",".staticTexts[\"Detail\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Russian Roulette"]/*[[".cells.staticTexts[\"Russian Roulette\"]",".staticTexts[\"Russian Roulette\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let incrementButton = tablesQuery/*@START_MENU_TOKEN@*/.buttons["Increment"]/*[[".cells.buttons[\"Increment\"]",".buttons[\"Increment\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        incrementButton.tap()
        incrementButton.tap()
        app.navigationBars["SampleApp.PlayerDetailsTableView"].buttons["Done"].tap()
        
    }
    
    func testSample2() {
        
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Gestures"].tap()
        tabBarsQuery.buttons["Item"].tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .other).element.buttons["Button"].tap()
        element.children(matching: .button)["Button"].tap()
        app.buttons["Tap2"].tap()
        
    }
    
    func testSample3() {
        let app = XCUIApplication()
        app.navigationBars["SampleApp.PlayersTableView"].buttons["Add"].tap()
        
        let tablesQuery2 = app.tables
        tablesQuery2.children(matching: .cell).element(boundBy: 0).children(matching: .textField).element.tap()
        
        let tablesQuery = tablesQuery2
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Detail"]/*[[".cells.staticTexts[\"Detail\"]",".staticTexts[\"Detail\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Poor man chess"]/*[[".cells.staticTexts[\"Poor man chess\"]",".staticTexts[\"Poor man chess\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let incrementButton = tablesQuery/*@START_MENU_TOKEN@*/.buttons["Increment"]/*[[".cells.buttons[\"Increment\"]",".buttons[\"Increment\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        app.navigationBars["SampleApp.PlayerDetailsTableView"].buttons["Done"].tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Gestures"].tap()
        app.navigationBars["UIView"].buttons["Home"].tap()
        tabBarsQuery.buttons["Item"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button)["Button"].tap()
        app.navigationBars["SampleApp.Tap2View"].buttons["Next"].tap()
        app.navigationBars["SampleApp.Tap1View"].buttons["Back"].tap()
        tabBarsQuery.buttons["Players"].tap()
        
    }
    
}
