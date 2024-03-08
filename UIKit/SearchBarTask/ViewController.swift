//
//  ViewController.swift
//  SearchBarTask
//
//  Created by Nilgul Cakir on 15.12.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var tableView: UITableView!
    var searchBar: UISearchBar!
    
    var people: [Person] = [
        Person(firstName: "Ali", lastName: "Demir"),
        Person(firstName: "Ahmet", lastName: "Ak"),
        Person(firstName: "Mehmet", lastName: "Sarı")
    ]
    var filteredPeople: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    func setupUI(){
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)

        searchBar = UISearchBar()
        searchBar.delegate = self
        view.addSubview(searchBar)

        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPeople.isEmpty ? people.count : filteredPeople.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = filteredPeople.isEmpty ? people[indexPath.row] : filteredPeople[indexPath.row]
        cell.textLabel?.text = "\(person.firstName) \(person.lastName)"
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText : String) {
        filteredPeople = searchText.isEmpty ? people : people.filter({ person in
            let lowercasedSearchText = searchText.lowercased()
            return person.firstName.lowercased().contains(lowercasedSearchText) ||
            person.lastName.lowercased().contains(lowercasedSearchText)
        })
        tableView.reloadData()
    }
}

