//
//  TimeLineViewController.swift
//  XApp_Xcode26
//
//  Created by Newbie on 2025/11/24.
//

import UIKit

class TimeLineViewController: UIViewController {
    @IBOutlet var floatingView: FloatingButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // +ボタンが押された時の処理
        floatingView.floatingButton.addTarget(self, action: #selector(didTapFloatingButton), for: .touchUpInside)
    }
    
    @objc func didTapFloatingButton() {
        // Main.storyboard から NewTweetViewController を生成
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let newTweet = storyboard.instantiateViewController(withIdentifier: "NewTweetViewController") as? NewTweetViewController else {
            return
        }
        // モーダルを下から出す
        newTweet.modalPresentationStyle = .pageSheet
        
        if let sheet = newTweet.sheetPresentationController{
            // 全画面で出す
            sheet.detents = [.large()]
            // 上部つまみ表示
            sheet.prefersGrabberVisible = true
        }
        present(newTweet, animated: true)
    }
}

