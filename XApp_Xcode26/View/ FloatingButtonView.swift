//
//   FloatingButtonViewController.swift
//  XApp_Xcode26
//
//  Created by Newbie on 2025/11/23.
//

import UIKit

class  FloatingButtonView: UIView {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomStackView: UIStackView!
    // プロパティの定義
    let floatingButton = UIButton()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // View全体の初期設定
    func setUpView() {
        // ビューの背景色を設定
        backgroundColor = .white
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
        setUpFloatingButton()
    }
    
    func setUpFloatingButton() {
        // Viewへボタンの追加処理
        addSubview(floatingButton)
        // AutoLayout設定
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        // ボタンの背景色
        floatingButton.backgroundColor = .systemBlue
        // ボタンにテキスト追加
        floatingButton.setTitle("+", for: .normal)
        floatingButton.setTitleColor(.white, for: .normal)
        // 角を丸める
        floatingButton.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            floatingButton.widthAnchor.constraint(equalToConstant: 50), // 幅
            floatingButton.heightAnchor.constraint(equalToConstant: 50), // 高さ
            floatingButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -30), // 右寄せ
            floatingButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30), // 下寄せ
            
        ])
        // StackView と ボタンを一番前面に
        bringSubviewToFront(bottomStackView)
        bringSubviewToFront(floatingButton)
    }

}

