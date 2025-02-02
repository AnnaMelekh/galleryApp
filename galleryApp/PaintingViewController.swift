//
//  PaintingViewController.swift
//  galleryApp
//
//  Created by Anna Melekhina on 26.01.2025.
//

import UIKit

class PaintingViewController: UIViewController {
    
    var artwork: Works?
    
    let artworkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let expandButton: UIButton = {
        let button = UIButton()
        button.setTitle("Развернуть", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        configureData()
    }
    
    private func setupUI() {
        view.addSubview(artworkImageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(expandButton)
        
        
        NSLayoutConstraint.activate([
            artworkImageView.topAnchor.constraint(equalTo: view.topAnchor),
            artworkImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            artworkImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            artworkImageView.heightAnchor.constraint(equalToConstant: 250),
            
            titleLabel.topAnchor.constraint(equalTo: artworkImageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            expandButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            expandButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            expandButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            expandButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureData() {
        artworkImageView.image = UIImage(named: artwork?.image ?? "no img")
        titleLabel.text = artwork?.title
        descriptionLabel.text = artwork?.info
        
        
    }
}


