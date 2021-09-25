//
//  FeedViewController.swift
//  Navigation
//
//  Created by Дубинкина Елена on 29/07/2021.
//  Copyright © 2021 Дубинкина Елена. All rights reserved.
//

import UIKit


class FeedViewController: UIViewController {
    
    let myPost = Post(title: "New post")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.759832075, green: 0.9757244856, blue: 0.9566784936, alpha: 1)
        self.title = "Feed"
        
        let firstPostButton = UIButton(type: .roundedRect)
        firstPostButton.setTitle("View post", for: .normal)
        firstPostButton.backgroundColor = .yellow
        firstPostButton.setTitleColor(.darkGray, for: .normal)
        firstPostButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        
        let secondPostButton = UIButton(type: .roundedRect)
        secondPostButton.setTitle("View post", for: .normal)
        secondPostButton.backgroundColor = .green
        secondPostButton.setTitleColor(.darkGray, for: .normal)
        secondPostButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        
        let myStackView:UIStackView = UIStackView(arrangedSubviews:[firstPostButton,secondPostButton])
        view.addSubview(myStackView)
        
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        myStackView.axis = .vertical
        myStackView.spacing = 10
        
        [
            myStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
            myStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            myStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
            myStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5)
        ]
            .forEach{
                $0.isActive = true
        }
    }
    @objc func tap() {
            
        let vc = PostViewController()
        vc.currentPost = myPost
        self.navigationController?.pushViewController(vc, animated: true)
        }

}
