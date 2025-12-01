//
//  TweetDelegate.swift
//  XApp_Xcode26
//
//  Created by Newbie on 2025/11/30.
//


protocol EditTweetDelegate: AnyObject {
    func editTweetDelegate(cell: TimeLineTableViewCell, tweetDataModel: TweetDataModel)
}


protocol NewTweetDelegate: AnyObject {
    
    func newTweetDelegate(viewController: NewTweetViewController, editedTweet: TweetDataModel, editedIndexPath: Int?)
}
