//
//  TimeLineViewController.swift
//  XApp_Xcode26
//
//  Created by Newbie on 2025/11/24.
//

import UIKit
import RealmSwift

class TimeLineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var timeLine: UITableView!
    @IBAction func newTweet(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "NewTweetViewController") as? NewTweetViewController else { return }
        viewController.delegate = self
        viewController.mode = .create
        present(viewController, animated: true)
    }
    
    private var tweet:[TweetDataModel] = []
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLine.dataSource = self
        timeLine.delegate = self
        timeLine.register(UINib(nibName: "TimeLineTableViewCell", bundle: nil), forCellReuseIdentifier: "TimeLineTableViewCell")
        setUpTweet()
        loadTweetData()
        }
    func setUpTweet() {
        if realm.objects(TweetDataModel.self).isEmpty {
            try! realm.write {
                        let tweet1 = TweetDataModel()
                        tweet1.userName = "SampleOne"
                        tweet1.handle = "sample1"
                        tweet1.tweetText = "Sample1です！Tweetはしっかり表示されていますか？"
                        realm.add(tweet1)
                        let tweet2 = TweetDataModel()
                        tweet2.userName = "SampleTwo"
                        tweet2.handle = "sample2"
                        tweet2.tweetText = "Sample2です！Tweetはしっかり表示されていますか？Sample2です！Tweetはしっかり表示されていますか？"
                        realm.add(tweet2)
                        let tweet3 = TweetDataModel()
                        tweet3.userName = "SampleThree"
                        tweet3.handle = "sample3"
                        tweet3.tweetText = "Sample1です！Tweetはしっかり表示されていますか？Sample3です！Tweetはしっかり表示されていますか？Sample3です！Tweetはしっかり表示されていますか？Sample3です！Tweetはしっかり表示されていますか？"
                        realm.add(tweet3)
                        let tweet4 = TweetDataModel()
                        tweet4.userName = "Samplefour"
                        tweet4.handle = "sample4"
                        tweet4.tweetText = "Sample4です！Tweetはしっかり表示されていますか？"
                        realm.add(tweet4)
                        let tweet5 = TweetDataModel()
                        tweet5.userName = "SampleFive"
                        tweet5.handle = "sample5"
                        tweet5.tweetText = "Sample5です！Tweetはしっかり表示されていますか？Sample5です！Tweetはしっかり表示されていますか？"
                        realm.add(tweet5)
                        let tweet6 = TweetDataModel()
                        tweet6.userName = "SampleSix"
                        tweet6.handle = "sample6"
                        tweet6.tweetText = "Sample6です！Tweetはしっかり表示されていますか？Sample6です！Tweetはしっかり表示されていますか？Sample6です！Tweetはしっかり表示されていますか？Sample6です！Tweetはしっかり表示されていますか？"
                        realm.add(tweet6)
                        let tweet7 = TweetDataModel()
                        tweet7.userName = "SampleOne"
                        tweet7.handle = "sample1"
                        tweet7.tweetText = "Sample1です！Tweetはしっかり表示されていますか？"
                        realm.add(tweet7)
                        let tweet8 = TweetDataModel()
                        tweet8.userName = "SampleTwo"
                        tweet8.handle = "@sample2"
                        tweet8.tweetText = "Sample2です！Tweetはしっかり表示されていますか？"
                        realm.add(tweet8)
                    }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeLineTableViewCell", for: indexPath) as! TimeLineTableViewCell
        cell.configure(tweetDataModel: tweet[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func loadTweetData() {
        let loadTweet = realm.objects(TweetDataModel.self)
            .sorted(byKeyPath: "createdAt", ascending: false)
        tweet = Array(loadTweet)
        timeLine.reloadData()
    }
}

extension TimeLineViewController: NewTweetDelegate {
    func newTweetDelegate(viewController: NewTweetViewController, editedTweet: TweetDataModel, editedIndexPath: Int?) {
        // editedIndexPathがnilなら新規、データが存在したら編集
        if let indexPath = editedIndexPath {
            // 編集
            try! realm.write {
                let updateTweet = tweet[indexPath]
                updateTweet.userName = editedTweet.userName
                updateTweet.handle = editedTweet.handle
                updateTweet.tweetText = editedTweet.tweetText
            }
            // 書き換えた行だけリロードして更新
            timeLine.reloadRows(at: [IndexPath(row: indexPath, section: 0)], with: .automatic)
        } else {
            // 新規
            try! realm.write {
                realm.add(editedTweet)
            }
            loadTweetData()
        }
    }
}

extension TimeLineViewController: EditTweetDelegate {
    
    func editTweetDelegate(cell: TimeLineTableViewCell, tweetDataModel: TweetDataModel) {
        guard let indexPath = timeLine.indexPath(for: cell) else { return }
        // 編集画面を取得
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let editTweetViewController = storyboard.instantiateViewController(withIdentifier: "NewTweetViewController") as? NewTweetViewController else { return }
        editTweetViewController.editTweet = tweetDataModel
        editTweetViewController.mode = .editTweet(index: indexPath.row)
        editTweetViewController.delegate = self
        // 画面を渡す
        present(editTweetViewController, animated: true)
    }
}
