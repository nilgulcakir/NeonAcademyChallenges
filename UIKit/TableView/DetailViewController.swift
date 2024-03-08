//
//  DetailViewController.swift
//  tableViewExample
//
//  Created by Nilgul Cakir on 14.12.2023.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    var passenger: Passenger!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    func setupUI() {
        
        view.backgroundColor = UIColor.gray
    
        let nameLabel = UILabel()
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.text = "Name: \(passenger.name)"
        view.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }
    
        let surnameLabel = UILabel()
        surnameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        surnameLabel.text = "Surname: \(passenger.surname)"
        view.addSubview(surnameLabel)
        
        surnameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }

        let teamLabel = UILabel()
        teamLabel.text = "Team: \(passenger.team)"
        view.addSubview(teamLabel)
        
        teamLabel.snp.makeConstraints { make in
            make.top.equalTo(surnameLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }

        let ageLabel = UILabel()
        ageLabel.text = "Age: \(passenger.age)"
        view.addSubview(ageLabel)
    
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(teamLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    
        let hometownLabel = UILabel()
        hometownLabel.text = "Hometown: \(passenger.hometown)"
        view.addSubview(hometownLabel)
        
        hometownLabel.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }

        let mailLabel = UILabel()
        mailLabel.text = "Mail: \(passenger.mail)"
        view.addSubview(mailLabel)
        
        mailLabel.snp.makeConstraints { make in
            make.top.equalTo(hometownLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
 
}


