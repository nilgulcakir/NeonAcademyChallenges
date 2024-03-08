

import UIKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {

    let usernameTextField = UITextField()
    let emailTextField = UITextField()
    let phoneNumberTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
        createUI()
    }
    
    func createUI(){

        usernameTextField.placeholder = "Enter your username"
        usernameTextField.textColor = .red
        usernameTextField.font = .boldSystemFont(ofSize: 18)
        usernameTextField.borderStyle = .roundedRect
        view.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(170)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
        }

        emailTextField.placeholder = "Enter your mail"
        emailTextField.textColor = .blue
        emailTextField.font = .italicSystemFont(ofSize: 18)
        emailTextField.borderStyle = .roundedRect
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
        }
  
        phoneNumberTextField.placeholder = "Enter your phone"
        phoneNumberTextField.textColor = .green
        phoneNumberTextField.borderStyle = .roundedRect
        view.addSubview(phoneNumberTextField)
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == phoneNumberTextField {
            let currentLength = textField.text?.count ?? 0
            if (currentLength + string.count - range.length) > 10 {
                return false
            }
        }
        return true
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

        func textFieldDidEndEditing(_ textField: UITextField) {
            if textField == emailTextField {
                if let email = textField.text, !isValidEmail(email) {
                    displayError(message: "Geçersiz email formatı")
                }
            }
        }

        func isValidEmail(_ email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }

        func displayError(message: String) {
            let alert = UIAlertController(title: "Hata", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }

}

