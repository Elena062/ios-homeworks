//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Дубинкина Елена on 04/08/2021.
//  Copyright © 2021 Дубинкина Елена. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {

    let avatarImage = UIImage(named: "cat")
    let avatarImageView = UIImageView()
    
    let userName = UILabel()
    let userStatus = UITextView()
    let statusButton = UIButton(type: .roundedRect)
    
    override func layoutSubviews() {
        
        avatarImageView.frame = CGRect(x: safeAreaInsets.left + 16, y: safeAreaInsets.top + 16, width: 110, height: 110)
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2;
        avatarImageView.clipsToBounds = true
        

        userName.frame = CGRect(x: 16, y: safeAreaInsets.top + 27, width: superview!.bounds.width - 32, height: 30)
        
        userStatus.frame = CGRect(x: avatarImageView.frame.maxX + 16, y: avatarImageView.frame.maxY - 18, width: 180, height: 30)
        
        statusButton.frame = CGRect(x: safeAreaInsets.left + 16, y: userStatus.frame.maxY + 34, width: superview!.bounds.width - 32, height: 50)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        avatarImageView.image = avatarImage
        self.addSubview(avatarImageView)
        
        avatarImageView.layer.borderWidth = 3.0
        avatarImageView.layer.borderColor = UIColor.white.cgColor
             
        
        self.addSubview(statusButton)
        self.statusButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        statusButton.setTitle("Show status", for: .normal)
        statusButton.backgroundColor = .blue
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusButton.layer.cornerRadius = 4
        
        statusButton.layer.shadowColor =  UIColor.black.cgColor
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowOpacity = 0.7
          
          
        self.addSubview(userName)
        userName.text = "Garry Kotter"
        userName.textColor = .black
        userName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        userName.textAlignment = .center
        
          
        self.addSubview(userStatus)
        userStatus.text = "Where your treasure is, there your heart will be also"
        userStatus.backgroundColor = .clear
        userStatus.textColor = .gray
        userStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTap() {
        print(userStatus.text ?? "Статус не оределен")
    }

}
