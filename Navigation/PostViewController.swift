//
//  PostViewController.swift
//  Navigation
//
//  Created by Дубинкина Елена on 30/07/2021.
//  Copyright © 2021 Дубинкина Елена. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    var currentPost = Post(title: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.8087125554, green: 0.9757244856, blue: 0.7910700383, alpha: 1)
        self.title = currentPost.title
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .done, target: self, action: #selector(tapInfo))
        
        
    }
    
    @objc func tapInfo(){
        
        let infoVC = InfoViewController()
        infoVC.modalPresentationStyle = .fullScreen
        infoVC.modalTransitionStyle = .flipHorizontal
        self.present(infoVC, animated: true, completion: nil)
        
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
