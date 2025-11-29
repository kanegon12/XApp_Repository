//
//  TimeLineTableViewCell.swift
//  XApp_Xcode26
//
//  Created by Newbie on 2025/11/28.
//

import UIKit

class TimeLineTableViewCell: UITableViewCell {
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var idLable: UILabel!
    @IBOutlet weak var tweetTextLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(tweetDataModel: TweetDataModel) {
        self.userNameLable.text = tweetDataModel.userName
        self.idLable.text = tweetDataModel.id
        self.tweetTextLable.text = tweetDataModel.tweetText
        self.tweetTextLable.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
