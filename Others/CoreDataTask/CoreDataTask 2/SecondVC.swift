//
//  SecondVC.swift
//  CoreDataTask
//
//  Created by Nilgul Cakir on 4.01.2024.
//

import UIKit
import SnapKit
import CoreData

class SecondVC: UIViewController, UITableViewDataSource,UITableViewDelegate, UINavigationControllerDelegate {

    
    var namesArray : [String] = []
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
        fetchData()
    }
    
    func createUI(){
        
        view.backgroundColor = .white
        title = "Users"
        navigationController?.delegate = self
        
        tableView.rowHeight = 50
        tableView.register(UsersCell.self, forCellReuseIdentifier: "userCell")
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        navigationItem.rightBarButtonItem = plusButton
    }
    
    @objc func plusButtonTapped() {
        let detailViewController = ViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count /*?? 0*/
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UsersCell
        cell.nameLabel?.text = namesArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            deleteData(at: indexPath)
        }
    }

    func deleteData(at indexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")

        do {
            let results = try managedContext.fetch(fetchRequest)
            
            if let userToDelete = results[indexPath.row] as? NSManagedObject {
                managedContext.delete(userToDelete)

                namesArray.remove(at: indexPath.row)
                try managedContext.save()

                tableView.reloadData()
            }
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
        }
    }
    
    func fetchData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")

        do {
            let results = try managedContext.fetch(fetchRequest)

            namesArray.removeAll()

            for case let user as NSManagedObject in results {
                if let name = user.value(forKey: "name") as? String {
                    namesArray.append(name)
                }
            }
            
            tableView.reloadData()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}
