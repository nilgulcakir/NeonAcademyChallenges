//
//  LogInViewController.swift
//  FirebaseAuthenticationTask
//
//  Created by Nilgul Cakir on 24.12.2023.
//

import UIKit
import FirebaseAuth
import SnapKit

class LogInViewController: UIViewController {
    
    let emailTextField  = UITextField()
    let passwordTextField  = UITextField()
    let logInButton = UIButton()
    let newAccountButton = UIButton()
    let forgotPasswordButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
    
    func createUI(){
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "Log In Page!!"
        titleLabel.textColor = .blue
        titleLabel.font = UIFont.systemFont(ofSize: 40)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(70)
            make.centerX.equalToSuperview()
            
        }
        
        emailTextField.placeholder = "Enter your email"
        emailTextField.backgroundColor = .cyan
        emailTextField.textColor = .black
        emailTextField.textAlignment = .center
        emailTextField.layer.cornerRadius = 5
        view.addSubview(emailTextField)
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
            make.width.equalTo(300)
            make.height.equalTo(30)
        }

        passwordTextField.placeholder = "Enter your password"
        passwordTextField.backgroundColor = .cyan
        passwordTextField.textColor = .black
        passwordTextField.textAlignment = .center
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.cornerRadius = 5
        view.addSubview(passwordTextField)
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.width.equalTo(300)
            make.height.equalTo(30)
        }

        logInButton.setTitle("Login", for: .normal)
        logInButton.backgroundColor = .blue
        logInButton.layer.cornerRadius = 5
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        view.addSubview(logInButton)
        
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.size.equalTo(CGSize(width: 100, height: 40))
            make.centerX.equalToSuperview()
        }
        
        newAccountButton.setTitleColor(UIColor.red, for: .normal)
        newAccountButton.setTitle("Sign Up With New Account", for: .normal)
        newAccountButton.layer.cornerRadius = 5
        newAccountButton.addTarget(self, action: #selector(newAccountButtonTapped), for: .touchUpInside)
        
        view.addSubview(newAccountButton)
        
        newAccountButton.snp.makeConstraints { make in
            make.top.equalTo(logInButton.snp.bottom).offset(30)
            make.size.equalTo(CGSize(width: 300, height: 20))
            make.centerX.equalToSuperview()
        }
        
        forgotPasswordButton.setTitleColor(UIColor.red, for: .normal)
        forgotPasswordButton.setTitle("Did you forget your password?", for: .normal)
        forgotPasswordButton.layer.cornerRadius = 5
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        
        view.addSubview(forgotPasswordButton)
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(newAccountButton.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 300, height: 40))
            make.centerX.equalToSuperview()
        }
        
    }
    
    @objc func logInButtonTapped(){
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { authdata, error in
                if error != nil {
                    self.errorMessage(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                }else {
                    let logOutVC = logOutViewController()
                    self.navigationController?.pushViewController(logOutVC, animated: true)
                }
            }
        } else {
            errorMessage(titleInput: "ERROR", messageInput: "Username/Password?")
        }
    }
    
    func errorMessage(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func newAccountButtonTapped(){
        
        let newVC = ViewController()
        self.navigationController?.pushViewController(newVC, animated: true)
        
    }
    
    @objc func forgotPasswordButtonTapped(){
        
        Auth.auth().sendPasswordReset(withEmail: emailTextField.text!) { error in
            if error == nil {
                print("Sent ....")
                
            }else {
                print("Failed \(String(describing: error?.localizedDescription))")
            }
        }
    }
}
