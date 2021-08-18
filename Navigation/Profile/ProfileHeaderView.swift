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
    
    let fullNameLabel = UILabel()
    let statusLabel = UILabel()
    let setStatusButton = UIButton(type: .roundedRect)
    let statusTextField = UITextField()
    
    private var statusText: String
    
    override func layoutSubviews() {
        
        avatarImageView.layer.cornerRadius = 55;
        avatarImageView.clipsToBounds = true
        
        self.fullNameLabel.numberOfLines = 0
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
        self.addSubview(setStatusButton)
        self.setStatusButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.backgroundColor = .blue
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        setStatusButton.layer.cornerRadius = 4
        
        setStatusButton.layer.shadowColor =  UIColor.black.cgColor
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowOpacity = 0.7
          
        // Добавляем имя пользователя
        self.addSubview(fullNameLabel)
        fullNameLabel.text = "Garry Kotter"
        fullNameLabel.textColor = .black
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textAlignment = .natural
        
        // Добавляем статус пользователя
        self.addSubview(statusLabel)
        statusLabel.text = "Where your treasure is, there your heart will be also"
        statusLabel.backgroundColor = .clear
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        // Добавим обработку нажатия на текущий статус, чтобы поле для редактирования статуса появлялось только после нажатия
        statusLabel.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(statusTap))
        self.statusLabel.addGestureRecognizer(gesture)
        
        
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
        
        //  Добавляем констрейнты
        self.avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        self.fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.statusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.statusTextField.translatesAutoresizingMaskIntoConstraints = false
        self.setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        [
            self.avatarImageView.topAnchor.constraint(equalTo: self.avatarImageView.superview!.topAnchor, constant: 27),
            self.avatarImageView.leadingAnchor.constraint(equalTo: self.avatarImageView.superview!.leadingAnchor, constant: 16),
            self.avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            self.avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            
            self.fullNameLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
            self.fullNameLabel.topAnchor.constraint(lessThanOrEqualTo: self.fullNameLabel.superview!.topAnchor, constant: 27),
            self.fullNameLabel.trailingAnchor.constraint(equalTo: self.fullNameLabel.superview!.trailingAnchor, constant: -16),
            self.fullNameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            self.statusLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
            self.statusLabel.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: -40),
            self.statusLabel.heightAnchor.constraint(equalToConstant: 30),
            self.statusLabel.widthAnchor.constraint(equalToConstant: 180),
            
            self.statusTextField.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
            self.statusTextField.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 10),
            self.statusTextField.trailingAnchor.constraint(equalTo: self.statusTextField.superview!.trailingAnchor, constant: -16),
            self.statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.setStatusButton.leadingAnchor.constraint(equalTo: self.setStatusButton.superview!.leadingAnchor, constant: 16),
            self.setStatusButton.topAnchor.constraint(equalTo: self.statusTextField.bottomAnchor, constant: 16),
            self.setStatusButton.trailingAnchor.constraint(equalTo: self.setStatusButton.superview!.trailingAnchor, constant: -16),
            self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ]
            .forEach {
                $0.isActive = true
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTap() {
        
        if statusText != "" {
        statusLabel.text = statusText
        }
        // Скроем поле редактирования статуса после установки нового значения
          statusTextField.isHidden = true
    }
    
    @objc func statusTap() {
        
        // Поле для редактирования статуса становится видимым при нажатии на текущий статус
        statusTextField.isHidden = false
        statusTextField.text = statusLabel.text

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
