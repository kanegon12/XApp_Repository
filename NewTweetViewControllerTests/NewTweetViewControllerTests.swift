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
    

    func testShouldTextLimited() {
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
    
}
