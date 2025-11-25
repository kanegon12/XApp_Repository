//
//  VNewTweetViewController.swift
//  XApp_Xcode26
//
//  Created by Newbie on 2025/11/24.
//
//
import UIKit
//
class NewTweetViewController: UIViewController {
    @IBAction func tweetBarButton(_ sender: Any) {
    }
    @IBAction func cancelBarButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
       
    }
    @IBOutlet weak var tweetTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
    }
    
}


