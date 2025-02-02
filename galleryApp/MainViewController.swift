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
    var filteredArtists: [ArtistModel] = []
        var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Artists"
        navigationController?.navigationBar.prefersLargeTitles = true
        print("NavigationController: \(String(describing: navigationController))")

        networkManager.delegate = self
        networkManager.performRequest(with: networkManager.url)
        
        setupUI()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(Cell.self, forCellReuseIdentifier: "Cell")
        searchBar.delegate = self
    }
    
    
    private func setupUI() {
        
        view.addSubview(searchBar)
        view.addSubview(tableView)
        view.backgroundColor = .white
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        tableView.separatorStyle = .none

        NSLayoutConstraint.activate([
            
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            searchBar.heightAnchor.constraint(equalToConstant: 90),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 2),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredArtists.count : artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? Cell else {
            return UITableViewCell()
        }
        let artist = isSearching ? filteredArtists[indexPath.row] : artists[indexPath.row]
            cell.configure(with: artist)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let artist = artists[indexPath.row]
        let artistVC = ArtistViewController()
        artistVC.oneArtist = artist
        navigationController?.pushViewController(artistVC, animated: true)
       
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.isEmpty {
                isSearching = false
            } else {
                isSearching = true
                filteredArtists = artists.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            }
            tableView.reloadData()
        }
        
         func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.text = ""
            isSearching = false
            tableView.reloadData()
            searchBar.resignFirstResponder()
        }
}

extension MainViewController: NetworkServiceDelegate {
    func didUpdateData(artists: [ArtistModel]) {
        DispatchQueue.main.async {
            self.artists = artists
            self.filteredArtists = artists
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: any Error) {
        print(error.localizedDescription)
    }
}

#Preview { MainViewController() }
