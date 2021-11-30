//
//  TruckListViewController.swift
//  TruckMap
//
//  Created by Ankit Sharma on 28/11/21.
//

import UIKit

class TruckListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var trucks: [Truck] = []
    private let datasource = TruckDetailsDataSourceViewModel.shared
    private var isSearch = false
    private var filteredTrucks: [Truck] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datasource.truckList.bind { [weak self] trucks in
            self?.trucks = trucks
            self?.tableView.reloadData()
        }
    }
}


// MARK: - UITableView data source

extension TruckListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dataSource = isSearch ? filteredTrucks : trucks
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataSource = isSearch ? filteredTrucks : trucks
        let cell = tableView.dequeueReusableCell(withIdentifier: "TruckDetailsTableViewCell", for: indexPath) as! TruckDetailsTableViewCell
        cell.updateUI(for: TruckDetailListViewModel(truck: dataSource[indexPath.row]))
        return cell
    }
}

// MARK: - UISearchbar delegate

extension TruckListViewController: UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearch = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearch = false
            tableView.reloadData()
        } else {
            filteredTrucks = trucks
                .filter { $0.truckNumber?.range(of: searchText, options: .caseInsensitive) != nil }
            isSearch = !filteredTrucks.isEmpty
            tableView.reloadData()
        }
    }
}
