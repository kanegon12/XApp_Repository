//
//  VNewTweetViewController.swift
//  XApp_Xcode26
//
//  Created by Newbie on 2025/11/24.
//

import UIKit

class NewTweetViewController: UIViewController {
    @IBOutlet weak var tweetTextView: UITextView!
    @IBAction func didTapCancel(_ sender: Any) {
    }
    @IBAction func didTapPost(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
    }
    
}
