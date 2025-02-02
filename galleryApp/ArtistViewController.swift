//
//  ArtistViewController.swift
//  galleryApp
//
//  Created by Anna Melekhina on 26.01.2025.
//

import UIKit

class ArtistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var oneArtist: ArtistModel?
    
    private let artistImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let roleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bioTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Biography"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let worksTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Works"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(WorkCell.self, forCellReuseIdentifier: "WorkCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        configureUI()
    }
    
    private func setupUI() {
        view.addSubview(artistImageView)
        view.addSubview(nameLabel)
        view.addSubview(roleLabel)
        view.addSubview(bioTitleLabel)
        view.addSubview(bioLabel)
        view.addSubview(worksTitleLabel)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            artistImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            artistImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            artistImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            artistImageView.heightAnchor.constraint(equalToConstant: 300),
            
            nameLabel.topAnchor.constraint(equalTo: artistImageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            roleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            roleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            bioTitleLabel.topAnchor.constraint(equalTo: roleLabel.bottomAnchor, constant: 16),
            bioTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            bioLabel.topAnchor.constraint(equalTo: bioTitleLabel.bottomAnchor, constant: 8),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            worksTitleLabel.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 16),
            worksTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            tableView.topAnchor.constraint(equalTo: worksTitleLabel.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureUI() {
        guard let oneArtist = oneArtist else { return }
        
        artistImageView.image = UIImage(named: oneArtist.image)
        nameLabel.text = oneArtist.name
        roleLabel.text = "Author"
        bioLabel.text = oneArtist.bio
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oneArtist?.works.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WorkCell", for: indexPath) as? WorkCell else {
            return UITableViewCell()
        }
        
        if let work = oneArtist?.works[indexPath.row] {
            cell.configure(with: work)
        }
        
        return cell
    }
}
