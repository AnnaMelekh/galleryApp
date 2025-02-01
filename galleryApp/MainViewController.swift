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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Artists"
        networkManager.delegate = self
        
        setupUI()

        tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }

    
    private func setupUI() {

        view.addSubview(searchBar)
        view.addSubview(tableView)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"

        NSLayoutConstraint.activate([
            
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchBar.heightAnchor.constraint(equalToConstant: 90),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 50),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
    }

}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
//        let item = data[indexPath.row]
//                cell.configure(with: item.image, title: item.title, subtitle: item.subtitle)
//                
                return cell
    }
    
}

extension MainViewController: UISearchBarDelegate {
    
}

extension MainViewController: NetworkServiceDelegate {
    func didUpdateCoin(artist: ArtistModel) {
        <#code#>
    }
    
    func didFailWithError(error: any Error) {
        <#code#>
    }
}

#Preview { MainViewController() }
