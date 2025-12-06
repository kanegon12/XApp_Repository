//
//  XApp_Xcode26Tests.swift
//  XApp_Xcode26Tests
//
//  Created by Newbie on 2025/12/05.
//

import XCTest
@testable import XApp_Xcode26

final class XApp_Xcode26Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
      
    }
    func testTextLimited() throws {
        let vc = NewTweetViewController()
        let equal = vc.textLimited(vc.tweetTextView, shouldChangeTextIn: ("a", in: 140), replacementText: "a")
        XCTAssertTrue(equal)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
