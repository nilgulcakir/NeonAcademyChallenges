//
//  RegisterViewController.swift
//  InstagramCloneTask
//
//  Created by Nilgul Cakir on 27.12.2023.
//

import UIKit
import SnapKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signUpButton = UIButton()
    let signInButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = UIColor.lightGray
        
        // UI elements
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.layer.cornerRadius = 8
        emailTextField.clipsToBounds = true
        view.addSubview(emailTextField)
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true 
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.clipsToBounds = true
        view.addSubview(passwordTextField)
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.top).offset(50)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }

        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        signUpButton.backgroundColor = UIColor.blue
        signUpButton.setTitleColor(UIColor.white, for: .normal)
        signUpButton.layer.cornerRadius = 8
        signUpButton.clipsToBounds = true
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        signUpButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.centerX).offset(-10) // Sağa dayalı
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        signInButton.backgroundColor = UIColor.blue
        signInButton.setTitleColor(UIColor.white, for: .normal)
        signInButton.layer.cornerRadius = 8
        signInButton.clipsToBounds = true
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        view.addSubview(signInButton)
        
        signInButton.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.centerX).offset(10) // Sola dayalı
            make.top.equalTo(signUpButton.snp.top)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
    
    @objc func signUpButtonTapped(){
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    let tabBarVC = CustomTabBarController()
                    self.navigationController?.pushViewController(tabBarVC, animated: true)
                }
            }
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
        }
    }
    
    @objc func signInButtonTapped(){
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")

                } else {
                    let tabBarVC = CustomTabBarController()
                    self.navigationController?.pushViewController(tabBarVC, animated: true)
                }
            }
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
        }
                    
    }
    
    func makeAlert(titleInput:String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

}


        
