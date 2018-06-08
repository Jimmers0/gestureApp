//
//  GestureAppUITests.swift
//  GestureAppUITests
//
//  Created by Jamie Randall on 6/5/18.
//  Copyright © 2018 Jamie Randall. All rights reserved.
//

import XCTest

class GestureAppUITests: XCTestCase {
        
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
    
    func testSwipeGesture() {
      XCUIApplication().otherElements.containing(.image, identifier:"tokyo_japan_city_night_lights_63139_3840x2160.jpg").element.swipeRight()
    }
  
  func testTapGesture() {
    let app = XCUIApplication()
    app.otherElements.containing(.image, identifier:"tokyo_japan_city_night_lights_63139_3840x2160.jpg").element.swipeRight()
    app.images["niss12.jpg"].tap()    
  }
  
  func testPinchGesture() {
    let app = XCUIApplication()
    app.otherElements.containing(.image, identifier:"tokyo_japan_city_night_lights_63139_3840x2160.jpg").element.swipeRight()
    app.images["niss12.jpg"]/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
  }
  
}
