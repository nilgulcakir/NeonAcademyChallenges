

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {

    var passengers: [[Passenger]] = [[], [], []]
    let tableView = UITableView()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
     

        setupTableView()
    }
    
    func setupTableView() {
        
        view.backgroundColor = .white

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        tableView.allowsSelection = true
        
        passengers[0] = [
            Passenger(name: "Ahmet", surname: "Yılmaz", team: "iOS Team", age: 28, hometown: "İstanbul", mail: "ahmet@email.com"),

        ]
        passengers[1] = [
            Passenger(name: "Mehmet", surname: "Demir", team: "Android Team", age: 25, hometown: "Ankara", mail: "mehmet@email.com"),

        ]
        passengers[2] = [
            Passenger(name: "Ayşe", surname: "Kara", team: "Design Team", age: 30, hometown: "İzmir", mail: "ayse@email.com"),
    
        ]

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return passengers.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passengers[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let passenger = passengers[indexPath.section][indexPath.row]
        cell.textLabel?.text = "\(passenger.name) \(passenger.surname)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let passenger = passengers[indexPath.section][indexPath.row]
        let detailViewController = DetailViewController()
        detailViewController.passenger = passenger

        navigationController?.pushViewController(detailViewController, animated: true)
        present(detailViewController, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            passengers[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
