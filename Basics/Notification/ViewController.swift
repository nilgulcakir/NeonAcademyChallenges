
import UIKit
import SnapKit

class ViewController: UIViewController {

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Şifreyi Girin"
        textField.isSecureTextEntry = true
        return textField
    }()

    let decodeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Şifreyi Çöz", for: .normal)
        button.backgroundColor = .blue
        return button
    }()

    let countdownLabel: UILabel = {
        let label = UILabel()
        label.text = "15"
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    let countdownTimerLabel: UILabel = {
        let label = UILabel()
        label.text = "Kalan Süre "
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    var timer: Timer?
    var countdownSeconds = 15

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        startCountdown()
    }

    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(countdownTimerLabel)
        countdownTimerLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().multipliedBy(0.4)
            make.centerX.equalToSuperview()
        }

        view.addSubview(countdownLabel)
        countdownLabel.snp.makeConstraints { make in
            make.top.equalTo(countdownTimerLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

       
        let textFieldContainerView: UIView = {
            let view = UIView()
            return view
        }()
        
        view.addSubview(textFieldContainerView)
        textFieldContainerView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }

        textFieldContainerView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        view.addSubview(decodeButton)
        decodeButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldContainerView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
    }

    func setupActions() {
        decodeButton.addTarget(self, action: #selector(decodeButtonTapped), for: .touchUpInside)
    }

    func startCountdown() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }

    @objc func updateCountdown() {
        countdownSeconds -= 1
        countdownLabel.text = "\(countdownSeconds)"

        if countdownSeconds == 0 {
            timer?.invalidate()
            showTimeExpiredAlert()
        }
    }

    @objc func decodeButtonTapped() {
        guard let userEnteredPassword = passwordTextField.text else {
            return
        }

        let correctPassword = "123"

        if userEnteredPassword == correctPassword {
            timer?.invalidate()
            showDecodedMessage("Şifre doğru!")
        } else {
            showErrorAlert("Hatalı Şifre", "Yanlış şifre girdiniz. Lütfen tekrar deneyin.")
        }
    }

    func showTimeExpiredAlert() {
        showErrorAlert("Süre Bitti", "15 saniye içinde şifre girilmedi.")
    }

    func showErrorAlert(_ title: String, _ message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

    func showDecodedMessage(_ message: String) {
        let alertController = UIAlertController(title: "Şifre Çözüldü", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
