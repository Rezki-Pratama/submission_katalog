//
//  submission_katalogUITests.swift
//  submission_katalogUITests
//
//  Created by diBajolbae on 19/08/21.
//

import XCTest

class submission_katalogUITests: XCTestCase {
    
    override func setUp() {

        continueAfterFailure = false
        XCUIApplication().launch()
    }

    
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
    
    
    func testLoadDataDeveloperTapOnFistResult_thenDeveloperDetailsView() {
        let app = XCUIApplication()
        
        app.tabBars.buttons["Developer"].tap()
        
        XCTAssertTrue(app.tabBars.buttons["Developer"].waitForExistence(timeout: 10))
        
        app.tables.cells.staticTexts["Feral Interactive"].tap()
        
        XCTAssertTrue(app.navigationBars["Detail Favorite"].waitForExistence(timeout: 10))
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
    }
    
    func testLoadDataGameTapOnFirstResult_thenGameDetailView() {
        let app = XCUIApplication()
        app.tabBars.buttons["Game"].tap()
        
        XCTAssertTrue(app.tabBars.buttons["Game"].waitForExistence(timeout: 10))
        
        app.tables.cells.staticTexts["Grand Theft Auto V"].tap()
        
        XCTAssertTrue(app.navigationBars["Detail Game"].waitForExistence(timeout: 10))
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    func testLoadDataGameTapOnFirstResult_GameDetail_thenAddGameToFavorite() {
        let app = XCUIApplication()
        app.tabBars.buttons["Game"].tap()
        
        XCTAssertTrue(app.tabBars.buttons["Game"].waitForExistence(timeout: 10))
        
        app.tables.cells.staticTexts["Grand Theft Auto V"].tap()
        
        XCTAssertTrue(app.navigationBars["Detail Game"].waitForExistence(timeout: 20))
        
        app.navigationBars.buttons.element(boundBy: 1).tap()
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    func testLoadDataFavoriteTapOnFirstResult_thenFavoriteDetail() {
        let app = XCUIApplication()
        app.tabBars.buttons["Favorite"].tap()
        
        XCTAssertTrue(app.tabBars.buttons["Favorite"].waitForExistence(timeout: 10))
        
        app.tables.cells.staticTexts["Grand Theft Auto V"].tap()
        
        XCTAssertTrue(app.navigationBars["Detail Favorite"].waitForExistence(timeout: 10))
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    func testLoadDataFavoriteTapOnFirstResult_FavoriteDetail_thenRemoveFavorite() {
        let app = XCUIApplication()
        app.tabBars.buttons["Favorite"].tap()
        
        XCTAssertTrue(app.tabBars.buttons["Favorite"].waitForExistence(timeout: 10))
        
        app.tables.cells.staticTexts["Grand Theft Auto V"].tap()
        
        XCTAssertTrue(app.navigationBars["Detail Favorite"].waitForExistence(timeout: 10))
        
        app.navigationBars.buttons.element(boundBy: 1).tap()
        
        XCTAssertTrue(app.waitForExistence(timeout: 10))
    }
    
    func testLoadProfile() {
        let app = XCUIApplication()
        
        app.tabBars.buttons["Profile"].tap()
        
        XCTAssertTrue(app.tabBars.buttons["Profile"].waitForExistence(timeout: 10))
        
        XCTAssertTrue(app.waitForExistence(timeout: 10))
    }
    
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
