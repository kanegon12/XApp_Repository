//
//  TimeLineViewController.swift
//  XApp_Xcode26
//
//  Created by Newbie on 2025/11/24.
//

import UIKit

class TimeLineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var timeLine: UITableView!
    var tweet:[TweetDataModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLine.dataSource = self
        timeLine.delegate = self
        timeLine.register(UINib(nibName: "TimeLineTableViewCell", bundle: nil), forCellReuseIdentifier: "TimeLineTableViewCell")
        self.setUpTweet()
        }
    
    func setUpTweet() {
        tweet = [TweetDataModel(userName: "SampleOne", id: "@sample1", tweetText: "Sample1です！Tweetはしっかり表示されていますか？"), TweetDataModel(userName: "SampleTwo", id: "@sample2", tweetText: "Sample2です！Tweetはしっかり表示されていますか？Sample2です！Tweetはしっかり表示されていますか？"), TweetDataModel(userName: "SampleThree", id: "@sample3", tweetText: "Sample1です！Tweetはしっかり表示されていますか？Sample3です！Tweetはしっかり表示されていますか？Sample3です！Tweetはしっかり表示されていますか？Sample3です！Tweetはしっかり表示されていますか？"), TweetDataModel(userName: "Samplefour", id: "@sample4", tweetText: "Sample4です！Tweetはしっかり表示されていますか？"), TweetDataModel(userName: "SampleFive", id: "@sample5", tweetText: "Sample5です！Tweetはしっかり表示されていますか？Sample5です！Tweetはしっかり表示されていますか？"), TweetDataModel(userName: "SampleSix", id: "@sample6", tweetText: "Sample6です！Tweetはしっかり表示されていますか？Sample6です！Tweetはしっかり表示されていますか？Sample6です！Tweetはしっかり表示されていますか？Sample6です！Tweetはしっかり表示されていますか？"), TweetDataModel(userName: "SampleOne", id: "@sample1", tweetText: "Sample1です！Tweetはしっかり表示されていますか？"), TweetDataModel(userName: "SampleTwo", id: "@sample2", tweetText: "Sample2です！Tweetはしっかり表示されていますか？Sample2です！Tweetはしっかり表示されていますか？"), TweetDataModel(userName: "SampleThree", id: "@sample3", tweetText: "Sample1です！Tweetはしっかり表示されていますか？Sample3です！Tweetはしっかり表示されていますか？Sample3です！Tweetはしっかり表示されていますか？Sample3です！Tweetはしっかり表示されていますか？"), TweetDataModel(userName: "Samplefour", id: "@sample4", tweetText: "Sample4です！Tweetはしっかり表示されていますか？"), TweetDataModel(userName: "SampleFive", id: "@sample5", tweetText: "Sample5です！Tweetはしっかり表示されていますか？Sample5です！Tweetはしっかり表示されていますか？"), TweetDataModel(userName: "SampleSix", id: "@sample6", tweetText: "Sample6です！Tweetはしっかり表示されていますか？Sample6です！Tweetはしっかり表示されていますか？Sample6です！Tweetはしっかり表示されていますか？Sample6です！Tweetはしっかり表示されていますか？")]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeLineTableViewCell", for: indexPath) as! TimeLineTableViewCell
        cell.configure(tweetDataModel: tweet[indexPath.row])
        return cell
    }
    
}

