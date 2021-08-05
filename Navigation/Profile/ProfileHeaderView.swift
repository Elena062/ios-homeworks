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
    let userStatus = UILabel()
    let statusButton = UIButton(type: .roundedRect)
    let statusTextField = UITextField()
    
    private var statusText: String
    
    override func layoutSubviews() {
        
        avatarImageView.frame = CGRect(x: safeAreaInsets.left + 16, y: safeAreaInsets.top + 16, width: 110, height: 110)
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2;
        avatarImageView.clipsToBounds = true
        

        userName.frame = CGRect(x: 16, y: safeAreaInsets.top + 27, width: superview!.bounds.width - 32, height: 30)
        
        userStatus.frame = CGRect(x: avatarImageView.frame.maxX + 16, y: avatarImageView.frame.maxY - 40, width: 180, height: 30)
        
        statusTextField.frame = CGRect(x: avatarImageView.frame.maxX + 16, y: userStatus.frame.maxY + 10, width: superview!.bounds.width - 158, height: 40)
        
        
        statusButton.frame = CGRect(x: safeAreaInsets.left + 16, y: statusTextField.frame.maxY + 16, width: superview!.bounds.width - 32, height: 50)
        
    }
    
    override init(frame: CGRect) {
        
        self.statusText = statusTextField.text ?? ""
        super.init(frame: frame)
        
        
        
        // Добавляем аватарку
        avatarImageView.image = avatarImage
        self.addSubview(avatarImageView)
        avatarImageView.layer.borderWidth = 3.0
        avatarImageView.layer.borderColor = UIColor.white.cgColor
             
        // Добавляем кнопку со скругленными краями и тенью
        self.addSubview(statusButton)
        self.statusButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        statusButton.setTitle("Set status", for: .normal)
        statusButton.backgroundColor = .blue
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusButton.layer.cornerRadius = 4
        
        statusButton.layer.shadowColor =  UIColor.black.cgColor
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowOpacity = 0.7
          
        // Добавляем имя пользователя
        self.addSubview(userName)
        userName.text = "Garry Kotter"
        userName.textColor = .black
        userName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        userName.textAlignment = .center
        
        // Добавляем статус пользователя
        self.addSubview(userStatus)
        userStatus.text = "Where your treasure is, there your heart will be also"
        userStatus.backgroundColor = .clear
        userStatus.textColor = .gray
        userStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        // Добавим обработку нажатия на текущий статус, чтобы поле для редактирования статуса появлялось только после нажатия
        userStatus.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(statusTap))
        self.userStatus.addGestureRecognizer(gesture)
        
        
        // Добавляем поле для редактирования статуса
        self.addSubview(statusTextField)
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.isHidden = true
        
        // Добавим обработку редактирования текста
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTap() {
        
        if statusText != "" {
        userStatus.text = statusText
        }
        // Скроем поле редактирования статуса после установки нового значения
          statusTextField.isHidden = true
    }
    
    @objc func statusTap() {
        
        // Поле для редактирования статуса становится видимым при нажатии на текущий статус
        statusTextField.isHidden = false
        statusTextField.text = userStatus.text

    }

    @objc func statusTextChanged(_ textField: UITextField) {
 
        if statusTextField.text != nil {
            statusText = statusTextField.text!
        }
        else {
            statusText = "Статус не определен"
        }
    }
}
