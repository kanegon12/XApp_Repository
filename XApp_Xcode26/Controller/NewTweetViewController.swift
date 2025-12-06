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
    // 文字数上限
    let maxTextLimited: Int = 140
    // 色が変わる残文字数
    let remainingText: Int = 15
    
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
    
    /// スペースと改行除去
    func trimming() -> (userName: String, handle: String, text: String) {
        let userName = userNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let handle = handleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let text = tweetTextView.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        return (userName, handle , text)
    }
    
    // 新規ツイートか編集かを判断
    enum Mode { case create, editTweet(index: Int)}
    var mode: Mode = .create

    /// 文字数制限と残りカウント
    func shouldTextLimited(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // 現在のテキスト取得
        let currentText = textView.text ?? ""
        // 現在の文字数
        let currentTextCount = currentText.count
        // NSRangeをSwiftのRange型に変換
        guard let textRange = Range(range, in: textView.text) else {
            return false
        }
        // 新しいテキストに置き換え
        let updatedText = currentText.replacingCharacters(in: textRange, with: text)
        // 置き換え後の文字数
        let newCount = updatedText.count
        // 文字上限を下げた場合に今の文字上限以上のテキストを削除できるために
        if newCount > currentTextCount {
            // 文字を入力しようとした場合のみ上限チェック、上限を超えたら入力拒否
            guard newCount <= maxTextLimited else {
                return false
            }
        }
        // 残りの文字数
        let remainingCount = maxTextLimited - updatedText.count
        // カウントを実装
        textCountUp(remainingCount: remainingCount)
        // 変更許可
        return true
    }
    /// 残文字数カウント
    private func textCountUp(remainingCount: Int) {
        // 残りの文字数がremainingText以下になったらカウントを赤色で表示
        if remainingCount <= remainingText {
            countLabel.text = "\(remainingCount)"
            countLabel.textColor = UIColor.systemRed
        } else {
            // 残りの文字数が設定した残数以上で表示を消す
            countLabel.text = ""
        }
        
    }
    
}

extension NewTweetViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let limited = shouldTextLimited(textView, shouldChangeTextIn: range, replacementText: text)
        
        return limited
    }
}
