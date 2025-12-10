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
        loadTweetData()
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
    // 投稿時間順に並び替えて画面更新(falseで上から新しい順)
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
