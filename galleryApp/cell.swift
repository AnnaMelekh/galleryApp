//
//  cell.swift
//  galleryApp
//
//  Created by Anna Melekhina on 26.01.2025.
//

import UIKit

class Cell: UITableViewCell {
    
    let profileImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.numberOfLines = 1
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let subtitleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = UIColor.gray
            label.numberOfLines = 1
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
         override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            contentView.addSubview(profileImageView)
            contentView.addSubview(titleLabel)
            contentView.addSubview(subtitleLabel)
            
            NSLayoutConstraint.activate([
                profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                profileImageView.widthAnchor.constraint(equalToConstant: 50),
                profileImageView.heightAnchor.constraint(equalToConstant: 50),
                
                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                titleLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 15),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                
                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
                subtitleLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 15),
                subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            ])
        }
        
         func configure(with image: UIImage?, title: String, subtitle: String) {
            profileImageView.image = image
            titleLabel.text = title
            subtitleLabel.text = subtitle
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
