//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дубинкина Елена on 04/08/2021.
//  Copyright © 2021 Дубинкина Елена. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHV = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        self.title = "Profile"
        self.view.addSubview(profileHV)
    }
    
    override func viewWillLayoutSubviews() {
        
        profileHV.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
    }
}
