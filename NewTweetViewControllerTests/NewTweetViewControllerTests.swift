//
//  NewTweetViewControllerTests.swift
//  NewTweetViewControllerTests
//
//  Created by Newbie on 2025/12/06.
//

import XCTest
import UIKit
@testable import XApp_Xcode26

final class NewTweetViewControllerTests: XCTestCase {
    
    // 正常系
    func testShouldTextLimitedNormalCase() {
        let viewController: NewTweetViewController!
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "NewTweetViewController") as? NewTweetViewController
        viewController.loadViewIfNeeded()
        let textView = UITextView()
        // 140文字
        textView.text = "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
        let range = NSRange(location: 0, length: 0)
        let result = viewController.shouldTextLimited(textView, shouldChangeTextIn: range, replacementText: "sss")
        XCTAssertFalse(result)
    }
    // 異常系
    func testShouldTextLimitedErrorCase() {
        let viewController: NewTweetViewController!
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "NewTweetViewController") as? NewTweetViewController
        viewController.loadViewIfNeeded()
        let textView = UITextView()
        // 139文字
        textView.text = "sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
        let range = NSRange(location: 0, length: 0)
        let result = viewController.shouldTextLimited(textView, shouldChangeTextIn: range, replacementText: "s")
        XCTAssertFalse(result)
    }
}
