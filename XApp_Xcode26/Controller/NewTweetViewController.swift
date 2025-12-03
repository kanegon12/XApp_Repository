//
//  VNewTweetViewController.swift
//  XApp_Xcode26
//
//  Created by Newbie on 2025/11/24.
//
//
import UIKit

class NewTweetViewController: UIViewController {
   
    // ポストボタン処理 trimming()で改行とスペース除去
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
    @IBOutlet weak var countLabel: UILabel!
    
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
        tweetTextView.delegate = self
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


extension NewTweetViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // 文字数上限
        let maxCharacters: Int = 140
        let characters = tweetTextView.text ?? ""

        
        guard let textViewRange = Range(range, in: textView.text) else {
            return false
        }
        let updatedCharacters = characters.replacingCharacters(in: textViewRange, with: text)
        let remainingCount = maxCharacters - updatedCharacters.count
        // 残りの文字数が15以下になったらカウント
        if remainingCount <= 15 {
            countLabel.text = "\(remainingCount)"
            countLabel.textColor = UIColor.systemRed
        } else {
                   countLabel.text = ""
               }
        // 上限を超える文字は入力不可
        if updatedCharacters.count > maxCharacters && updatedCharacters.count > remainingCount{
                return false
            }
        return true
    }
}
