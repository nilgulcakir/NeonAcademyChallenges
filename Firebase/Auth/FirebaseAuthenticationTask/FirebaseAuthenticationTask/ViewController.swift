//
//  ViewController.swift
//  FirebaseAuthenticationTask
//
//  Created by Nilgul Cakir on 24.12.2023.
//

import UIKit
import SnapKit
import FirebaseAuth

class ViewController: UIViewController {

    let emailTextField  = UITextField()
    let passwordTextField  = UITextField()
    let signUpButton = UIButton()
    let signUpBeforeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
      
    }
    
    func createUI(){
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "WELCOME!!"
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

        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = .blue
        signUpButton.layer.cornerRadius = 5
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.size.equalTo(CGSize(width: 100, height: 40))
            make.centerX.equalToSuperview()
        }
        

        signUpBeforeButton.setTitle("Have you registered before?", for: .normal)
        signUpBeforeButton.setTitleColor(UIColor.red, for: .normal)
        signUpBeforeButton.layer.cornerRadius = 30
        signUpBeforeButton.addTarget(self, action: #selector(signUpBeforeButtonTapped), for: .touchUpInside)
        
        view.addSubview(signUpBeforeButton)
        signUpBeforeButton.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 260, height: 40))
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTextField.becomeFirstResponder()
        
    }
    
    @objc func signUpButtonTapped(){
        
        print("deneme")
        
        if emailTextField.text != "" &&  passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authdata, error in
                if error != nil {
                    self.errorMessage(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    let mailvc = mailVertificationVC()
                    self.navigationController?.pushViewController(mailvc, animated: true)
                }
            }
            
        } else {
            
            errorMessage(titleInput: "ERROR", messageInput: "Username/Password?")

        }
    }
    
    //Giriş Yap
    @objc func signUpBeforeButtonTapped(){
        
        print("deneme2")
        
        let nextViewController = LogInViewController()
        navigationController?.pushViewController(nextViewController, animated: true)        
    }
    
    func errorMessage(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

