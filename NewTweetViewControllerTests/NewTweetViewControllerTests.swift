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
        // 100文字
        textView.text = "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
        let range = NSRange(location: 0, length: 0)
        let result = viewController.shouldTextLimited(textView, shouldChangeTextIn: range, replacementText: "sssss")
        // 100文字に5文字足していて140文字以下に収まる
        XCTAssertTrue(result)
    }
    // 異常系
    func testShouldTextLimitedErrorCase() {
        let viewController: NewTweetViewController!
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "NewTweetViewController") as? NewTweetViewController
        viewController.loadViewIfNeeded()
        let textView = UITextView()
        // 140文字
        textView.text = "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
        let range = NSRange(location: 0, length: 0)
        let result = viewController.shouldTextLimited(textView, shouldChangeTextIn: range, replacementText: "sssss")
        // 140文字に5文字足していて140文字以下に収まらない
        XCTAssertFalse(result)
    }
}
