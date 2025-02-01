//
//  ViewController.swift
//  galleryApp
//
//  Created by Anna Melekhina on 26.01.2025.
//

import UIKit


class MainViewController: UIViewController {
    
    
    var searchBar = UISearchBar()
    var tableView = UITableView()
    var networkManager = NetworkService()
    var artists: [ArtistModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Artists"
        networkManager.delegate = self
        networkManager.performRequest(with: networkManager.url)
        
        setupUI()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(Cell.self, forCellReuseIdentifier: "Cell")
    }
    
    
    private func setupUI() {
        
        view.addSubview(searchBar)
        view.addSubview(tableView)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        tableView.separatorStyle = .none

        NSLayoutConstraint.activate([
            
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchBar.heightAnchor.constraint(equalToConstant: 90),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 5),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? Cell else {
            return UITableViewCell()
        }
        let artist = artists[indexPath.row]
        
        cell.configure(with: artist)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}

extension MainViewController: UISearchBarDelegate {
    
}

extension MainViewController: NetworkServiceDelegate {
    func didUpdateData(artists: [ArtistModel]) {
        DispatchQueue.main.async {
            self.artists = artists
            self.tableView.reloadData()
            print(artists)
        }
    }
    
    func didFailWithError(error: any Error) {
        print(error.localizedDescription)
    }
}

#Preview { MainViewController() }
