//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Дубинкин Антон Владимерович on 25/10/2021.
//  Copyright © 2021 Дубинкина Елена. All rights reserved.
//

import UIKit


protocol PostTableViewCellDelegate {
        func didSelectButton(post: Post)
    }

    class PostTableViewCell: UITableViewCell {
        
        var post: Post? {
            didSet {
                postImageView.image = UIImage(named: post!.image)
                authorLabel.text = post?.author
                descriptionLabel.text = post?.description
                likesLabel.text = "likes: " + String(post!.likes)
                viewsLabel.text = "views: " + String(post!.views)
            }
        }
        
        var delegate: PostTableViewCellDelegate?
        

        var postImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.backgroundColor = .black

            return imageView
        }()
        
        var authorLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            label.numberOfLines = 2
            return label
        }()
        
        var descriptionLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .systemGray
            label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            label.numberOfLines = 0
            return label
        }()
        
        var likesLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            label.numberOfLines = 1
            return label
        }()
        
        var viewsLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            label.numberOfLines = 1
            return label
        }()
        
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupViews()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }


extension PostTableViewCell {
    
        private func setupViews() {
            
            contentView.addSubview(postImageView)
            contentView.addSubview(authorLabel)
            contentView.addSubview(descriptionLabel)
            contentView.addSubview(likesLabel)
            contentView.addSubview(viewsLabel)
            
            
            authorLabel.setContentHuggingPriority(.required, for: .vertical)
            descriptionLabel.setContentHuggingPriority(.required, for: .vertical)
            likesLabel.setContentHuggingPriority(.required, for: .vertical)
            viewsLabel.setContentHuggingPriority(.required, for: .vertical)
            
            let constraints = [
                
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),

            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                
                
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.heightAnchor.constraint(equalToConstant: 25),

            
            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.heightAnchor.constraint(equalTo: likesLabel.heightAnchor),
                viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
                
            ]
            NSLayoutConstraint.activate(constraints)
        }
    }

