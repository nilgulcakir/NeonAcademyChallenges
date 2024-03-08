//
//  mailVertificationVC.swift
//  FirebaseAuthenticationTask
//
//  Created by Nilgul Cakir on 25.12.2023.
//

import UIKit
import FirebaseAuth

class mailVertificationVC: UIViewController {
    
    let emailVertification = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
    }
    
    func createUI(){
        
        view.backgroundColor = .lightGray
        
        let titleLabel = UILabel()
        titleLabel.text = "Check your email adress"
        titleLabel.textColor = .blue
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(70)
            make.centerX.equalToSuperview()
            
        }
        
        emailVertification.tintColor = .white
        emailVertification.setTitle("Email Vertification", for: .normal)
        emailVertification.backgroundColor = .blue
        emailVertification.layer.cornerRadius = 5
        emailVertification.addTarget(self, action: #selector(emailVertificationTapped), for: .touchUpInside)
        
        view.addSubview(emailVertification)
        
        emailVertification.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.size.equalTo(CGSize(width: 200, height: 40))
            make.centerX.equalToSuperview()
        }
        
    }
    
    @objc func emailVertificationTapped(){
        
        if let currentUser = Auth.auth().currentUser {
            currentUser.sendEmailVerification { error in
                if let error = error {
                    print("E-posta doğrulama gönderme hatası: \(error.localizedDescription)")
                } else {
                    print("E-posta doğrulama gönderildi.")
                }
            }
        }
    }
}
