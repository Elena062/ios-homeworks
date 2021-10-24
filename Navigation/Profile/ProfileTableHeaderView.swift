//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Дубинкина Елена on 04/08/2021.
//  Copyright © 2021 Дубинкина Елена. All rights reserved.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    
    var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "cat")
        return imageView
    }()
      
    var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Garry Kotter"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .natural
        return label
    }()
    
    var statusLabel: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.text = "Where your treasure is, there your heart will be also"
        status.backgroundColor = .clear
        status.textColor = .gray
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return status
    }()
    
      let setStatusButton = UIButton(type: .roundedRect)
      let statusTextField = UITextField()
      
      private var statusText = ""
    
    
    
    override init(reuseIdentifier: String?) {

        super.init(reuseIdentifier: reuseIdentifier)
        layoutSubviews()
         setupView()
     }
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}

extension ProfileHeaderView  {
    
 override func layoutSubviews() {
    
    super.layoutSubviews()
    
    // Настройки аватарки
    self.avatarImageView.layer.cornerRadius = 55;
    self.avatarImageView.clipsToBounds = true
    self.avatarImageView.layer.borderWidth = 3.0
    self.avatarImageView.layer.borderColor = UIColor.white.cgColor
     
    self.fullNameLabel.numberOfLines = 0
    
    //Настройки кнопки установки статуса
    setStatusButton.layer.cornerRadius = 4
    setStatusButton.layer.shadowColor =  UIColor.black.cgColor
    setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
    setStatusButton.layer.shadowRadius = 4
    setStatusButton.layer.shadowOpacity = 0.7
    
    //Настройки поля редактирования статуса
    statusTextField.layer.cornerRadius = 12
    statusTextField.layer.borderWidth = 1
    statusTextField.layer.borderColor = UIColor.black.cgColor
 }
    
            
    func setupView() {
        
        // Добавляем аватарку
            contentView.addSubview(avatarImageView)
        
        // Добавляем имя пользователя
            contentView.addSubview(fullNameLabel)
        
        // Добавляем статус пользователя
            contentView.addSubview(statusLabel)
        
        // Добавляем поле для редактирования статуса
            contentView.addSubview(statusTextField)
                 
                           
        // Добавляем кнопку установки статуса
            contentView.addSubview(setStatusButton)
            setStatusButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
            setStatusButton.setTitle("Set status", for: .normal)
            setStatusButton.backgroundColor = .blue
            setStatusButton.setTitleColor(.white, for: .normal)
            setStatusButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
  
            
            // Добавим обработку нажатия на текущий статус, чтобы поле для редактирования статуса появлялось только после нажатия
            self.statusLabel.isUserInteractionEnabled = true
            let gesture = UITapGestureRecognizer(target: self, action: #selector(statusTap))
            self.statusLabel.addGestureRecognizer(gesture)
            
            statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            statusTextField.textColor = .black
            statusTextField.backgroundColor = .white
            statusTextField.isHidden = true
            
            // Добавим обработку редактирования текста
            statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
            
            //  Добавляем констрейнты
        
            statusTextField.translatesAutoresizingMaskIntoConstraints = false
            setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        
          let constraints = [
                avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27),
                avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                avatarImageView.widthAnchor.constraint(equalToConstant: 110),
                avatarImageView.heightAnchor.constraint(equalToConstant: 110),
       
                fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
                fullNameLabel.topAnchor.constraint(lessThanOrEqualTo: contentView.topAnchor, constant: 27),
                fullNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                fullNameLabel.heightAnchor.constraint(equalToConstant: 30),
                
                statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
                statusLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -40),
                statusLabel.heightAnchor.constraint(equalToConstant: 30),
                statusLabel.widthAnchor.constraint(equalToConstant: 180),
                
                statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
                statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
                statusTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                statusTextField.heightAnchor.constraint(equalToConstant: 40),
                
                setStatusButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
                setStatusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                setStatusButton.heightAnchor.constraint(equalToConstant: 50),
                setStatusButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
            ]
            NSLayoutConstraint.activate(constraints)
            
            
}
        
        @objc func buttonTap() {
            
            if statusText != "" {
            statusLabel.text = statusText
            }
            // Скроем поле редактирования статуса после установки нового значения
            statusTextField.isHidden = true
            statusTextField.endEditing(true)
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
