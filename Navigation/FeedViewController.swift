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
        
        let viewPostButton = UIButton(frame: CGRect(x: 150, y: 750, width: 100, height: 30))
        viewPostButton.setTitle("View post", for: .normal)
        viewPostButton.backgroundColor = .yellow
        viewPostButton.setTitleColor(.darkGray, for: .normal)
        viewPostButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(viewPostButton)

    }
    @objc func tap() {
            
        let vc = PostViewController()
        vc.currentPost = myPost
        self.navigationController?.pushViewController(vc, animated: true)
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
