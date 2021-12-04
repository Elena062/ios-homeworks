//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Дубинкина Елена on 27/11/2021.
//  Copyright © 2021 Дубинкина Елена. All rights reserved.
//

import UIKit

    protocol PhotosTableViewCellDelegate {
        func didSelectButton()
    }

    class PhotosTableViewCell: UITableViewCell {

        var titleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
            label.numberOfLines = 1
            label.text = "Photos"
            return label
        }()

        var arrowButton: UIButton = {
            let button = UIButton()
            let buttonImage = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setBackgroundImage(buttonImage, for: .normal)
        return button
        }()
    
        var photoImageView: [UIImageView] = {
            var imageViews = [UIImageView]()
            for index in 0...3 {
            imageViews.insert(UIImageView(), at: index)
            imageViews[index].translatesAutoresizingMaskIntoConstraints = false
                imageViews[index].contentMode = .scaleToFill
            imageViews[index].image = photoGallery[index]
            }
            return imageViews
        }()
    
    var delegate: PhotosTableViewCellDelegate?
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupPhotoViews()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        }
    
    
    @objc func arrowButtonTapped() {

        print("Button tapped")
        delegate?.didSelectButton()
    }
}

extension PhotosTableViewCell {

    override func layoutSubviews() {
        super.layoutSubviews()
    
        for index in 0...3 {
            photoImageView[index].clipsToBounds = true
            photoImageView[index].layer.cornerRadius = 6
            photoImageView[index].layer.shadowColor =  UIColor.black.cgColor
            photoImageView[index].layer.shadowOffset = CGSize(width: 4, height: 4)
            photoImageView[index].layer.shadowRadius = 4
            photoImageView[index].layer.shadowOpacity = 0.5
        }
    }
}
extension PhotosTableViewCell {
    
    private func setupPhotoViews(){
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowButton)
        
        for index in 0...3 {
            contentView.addSubview(photoImageView[index])
        }
        arrowButton.addTarget(self, action: #selector(arrowButtonTapped), for: .touchUpInside)
     
        let baseWidth = ((contentView.superview?.frame.width)! - 48)/4
                
        let constraints = [
                    
                    
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
        titleLabel.widthAnchor.constraint(equalToConstant: 100),
                
        arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
        arrowButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
        arrowButton.widthAnchor.constraint(equalToConstant: 24),
        arrowButton.heightAnchor.constraint(equalTo: arrowButton.widthAnchor),
                    
        photoImageView[0].topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
        photoImageView[0].leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
        photoImageView[0].bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        photoImageView[0].widthAnchor.constraint(greaterThanOrEqualToConstant: baseWidth),
        photoImageView[0].heightAnchor.constraint(equalTo: photoImageView[0].widthAnchor),
         
        photoImageView[1].topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
        photoImageView[1].leadingAnchor.constraint(equalTo: photoImageView[0].trailingAnchor, constant: 8),
        photoImageView[1].bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        photoImageView[1].widthAnchor.constraint(equalTo: photoImageView[0].widthAnchor),
        photoImageView[1].heightAnchor.constraint(equalTo: photoImageView[0].widthAnchor),
        photoImageView[1].trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -4),
                    
        photoImageView[2].topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
        photoImageView[2].leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 4),
        photoImageView[2].bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        photoImageView[2].widthAnchor.constraint(equalTo: photoImageView[0].widthAnchor),
        photoImageView[2].heightAnchor.constraint(equalTo: photoImageView[0].widthAnchor),
                      
        photoImageView[3].topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
        photoImageView[3].leadingAnchor.constraint(equalTo: photoImageView[2].trailingAnchor, constant: 8),
        photoImageView[3].bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        photoImageView[3].widthAnchor.constraint(equalTo: photoImageView[0].widthAnchor),
        photoImageView[3].heightAnchor.constraint(equalTo: photoImageView[0].widthAnchor),
        photoImageView[3]
                        .trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ]
        NSLayoutConstraint.activate(constraints)
                
    }
}

