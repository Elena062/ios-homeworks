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
    let newButton: UIButton = UIButton(type: .roundedRect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        self.title = "Profile"
        self.view.addSubview(profileHV)
        
        self.newButton.setTitle("NEW BUTTON", for: .normal)
        self.view.addSubview(newButton)
        self.newButton.backgroundColor = .init(cgColor: CGColor (srgbRed: 0, green: 10, blue: 10, alpha: 1))
        self.newButton.layer.cornerRadius = 4
        
        self.profileHV.translatesAutoresizingMaskIntoConstraints = false
        self.newButton.translatesAutoresizingMaskIntoConstraints = false
        [
            self.profileHV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.profileHV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            self.profileHV.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.profileHV.heightAnchor.constraint(equalToConstant: 220),
            
            self.newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            self.newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ]
            .forEach {
                $0.isActive = true
        }
    }
}
