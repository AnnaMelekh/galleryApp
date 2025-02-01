//
//  cell.swift
//  galleryApp
//
//  Created by Anna Melekhina on 26.01.2025.
//

import UIKit

class Cell: UITableViewCell {
    
    let image: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let name: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16)
            label.numberOfLines = 1
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let bio: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 14)
            label.textColor = UIColor.gray
            label.numberOfLines = 2
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
         override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            contentView.addSubview(image)
            contentView.addSubview(name)
            contentView.addSubview(bio)
            
            NSLayoutConstraint.activate([
                image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                image.widthAnchor.constraint(equalToConstant: 100),
                image.heightAnchor.constraint(equalToConstant: 100),
                
                name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15),
                name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                
                bio.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
                bio.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15),
                bio.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                
            ])
        }
        
    func configure(with artist: ArtistModel) {
        name.text = artist.name
        bio.text = artist.bio
        image.image = UIImage(named: artist.image)
    }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

