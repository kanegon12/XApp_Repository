//
//  TweetDataModel.swift
//  XApp_Xcode26
//
//  Created by Newbie on 2025/11/26.
//

import Foundation
import RealmSwift

class TweetDataModel: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var userName: String = ""
    @Persisted var handle: String = ""
    @Persisted var tweetText: String = ""
    @Persisted var createdAt: Date = Date()
}

