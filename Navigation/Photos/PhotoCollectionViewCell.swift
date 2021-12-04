//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Дубинкина Елена on 27/11/2021.
//  Copyright © 2021 Дубинкина Елена. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    var photo: UIImage? {
    didSet {
            photoImageView.image = self.photo
        }
    }
    
    var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
        override init(frame: CGRect) {
            
            super.init(frame: frame)
            photo = photoGallery[0]
            contentView.addSubview(photoImageView)
            contentView.backgroundColor = .white
            setupViews()
        }
            
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            fatalError("Fatal error")
        }
    }

extension PhotoCollectionViewCell {
    private func setupViews() {
        let constraints = [
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

extension UIView {
    func  roundCornersWithRadius(_ radius: CGFloat, top: Bool? = true, bottom: Bool? = true, shadowEnabled: Bool = true) {
        
        var maskedCorners = CACornerMask()
        clipsToBounds = true
        if shadowEnabled {
            
            layer.masksToBounds = false
            layer.shadowOpacity = 0.5
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowRadius = 4
            layer.shadowOffset = CGSize(width: 4, height: 4)
        }
        switch (top, bottom) {
        case (true, false):
            maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        case (false, true):
            maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        case (true, true):
            maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        default:
            break
        }
        layer.cornerRadius = radius
        layer.maskedCorners = maskedCorners
    }
}

