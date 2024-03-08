//
//  SettingsViewController.swift
//  InstagramCloneTask
//
//  Created by Nilgul Cakir on 27.12.2023.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    let logOutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
    
    func createUI(){
    
        let titleLabel = UILabel()
        titleLabel.text = "LogIn Successfull!!"
        titleLabel.textColor = .blue
        titleLabel.font = UIFont.systemFont(ofSize: 40)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(70)
            make.centerX.equalToSuperview()
            
        }
        
        logOutButton.setTitle("Log Out", for: .normal)
        logOutButton.backgroundColor = .blue
        logOutButton.layer.cornerRadius = 5
        logOutButton.addTarget(self, action: #selector(logOutButtonTapped), for: .touchUpInside)
        view.addSubview(logOutButton)
        logOutButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.size.equalTo(CGSize(width: 100, height: 40))
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func logOutButtonTapped(){
        do {
            try Auth.auth().signOut()
            let logOutBack = RegisterViewController()
            self.navigationController?.pushViewController(logOutBack, animated: true)
        } catch {
            print("error")
        }
    }
}

