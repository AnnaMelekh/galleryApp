//
//  PaintCell.swift
//  galleryApp
//
//  Created by Anna Melekhina on 02.02.2025.
//

import UIKit

class WorkCell: UITableViewCell {
    
    private let workImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.systemGray4.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(workImageView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            workImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            workImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            workImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            workImageView.widthAnchor.constraint(equalToConstant: 150),
            workImageView.heightAnchor.constraint(equalToConstant: 90),
            
            titleLabel.centerYAnchor.constraint(equalTo: workImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: workImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with work: Works) {
        workImageView.image = UIImage(named: work.image)
        titleLabel.text = work.title
    }
}
