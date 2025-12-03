//
//  TimeLineTableViewCell.swift
//  XApp_Xcode26
//
//  Created by Newbie on 2025/11/28.
//

import UIKit

class TimeLineTableViewCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    weak var delegate: EditTweetDelegate?
    private var model: TweetDataModel?
    
    @IBAction func editButton(_ sender: Any) {
        guard let model else { return }
        delegate?.editTweetDelegate(cell: self, tweetDataModel: model)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(tweetDataModel: TweetDataModel) {
        self.model = tweetDataModel
        self.userNameLabel.text = tweetDataModel.userName
        self.handleLabel.text = tweetDataModel.handle
        self.tweetTextLabel.text = tweetDataModel.tweetText
        // 複数業表示可能
        self.tweetTextLabel.numberOfLines = 0
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
