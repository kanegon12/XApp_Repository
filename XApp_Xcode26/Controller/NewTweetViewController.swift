//
//  VNewTweetViewController.swift
//  XApp_Xcode26
//
//  Created by Newbie on 2025/11/24.
//
//
import UIKit

class NewTweetViewController: UIViewController {
   
    // ポストボタン処理 whitespacesAndNewlinesで改行とスペース除去
    @IBAction func tweetBarButton(_ sender: Any) {
       let trimmingData = trimming()
        let tweet = TweetDataModel()
        tweet.userName = trimmingData.userName
        tweet.handle = trimmingData.handle
        tweet.tweetText = trimmingData.text
        // 編集ならeditを新規ならnilを返す
        let indexPath: Int? = {
            if case let .editTweet(edit) = mode {
                return edit } else {
                    return nil } }()
        
        delegate?.newTweetDelegate(viewController: self, editedTweet: tweet, editedIndexPath: indexPath)
        // 投稿画面のモーダルを閉じる処理
        dismiss(animated:  true)
    }
    
    @IBAction func cancelBarButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var handleTextField: UITextField!
    
    var editTweet: TweetDataModel?
    weak var delegate: NewTweetDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tweet = editTweet {
            userNameTextField.text = tweet.userName
            handleTextField.text = tweet.handle
            tweetTextView.text = tweet.tweetText
        }
        
        view.backgroundColor = .systemBackground
        
    }
    
    // スペースと改行除去
    func trimming() -> (userName: String, handle: String, text: String) {
        let userName = userNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let handle = handleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let text = tweetTextView.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        return (userName, handle , text)
    }
    
    // 新規ツイートか編集かを判断
    enum Mode { case create, editTweet(index: Int)}
    var mode: Mode = .create
}


