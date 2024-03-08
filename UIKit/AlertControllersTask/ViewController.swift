import UIKit
import SnapKit

class ViewController: UIViewController {

    var resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        showSecondAlert()
    }

    func setupUI() {
        let alertButton1 = UIButton()
        alertButton1.setTitle("Alert Butonu", for: .normal)
        alertButton1.setTitleColor(UIColor.white, for: .normal)
        alertButton1.backgroundColor = UIColor.red
        alertButton1.layer.cornerRadius = 10
        alertButton1.addTarget(self, action: #selector(alert1Tapped), for: .touchUpInside)

        view.addSubview(alertButton1)
        alertButton1.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }

        let alertButton2 = UIButton()
        alertButton2.setTitle("İç İçe Alert", for: .normal)
        alertButton2.setTitleColor(UIColor.white, for: .normal)
        alertButton2.backgroundColor = UIColor.blue
        alertButton2.layer.cornerRadius = 10
        alertButton2.addTarget(self, action: #selector(alert2Tapped), for: .touchUpInside)

        view.addSubview(alertButton2)
        alertButton2.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }

        let alertButton3 = UIButton()
        alertButton3.setTitle("Text İçeren Alert", for: .normal)
        alertButton3.setTitleColor(UIColor.white, for: .normal)
        alertButton3.backgroundColor = UIColor.green
        alertButton3.layer.cornerRadius = 10
        alertButton3.addTarget(self, action: #selector(alert3Tapped), for: .touchUpInside)

        view.addSubview(alertButton3)
        alertButton3.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }

        let extraButton = UIButton()
        extraButton.setTitle("Ekstra Buton", for: .normal)
        extraButton.setTitleColor(UIColor.white, for: .normal)
        extraButton.backgroundColor = UIColor.purple
        extraButton.layer.cornerRadius = 10
        extraButton.addTarget(self, action: #selector(extraButtonTapped), for: .touchUpInside)

        view.addSubview(extraButton)
        extraButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(50)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
    }

    @objc func alert1Tapped() {
        
        let alert = UIAlertController(title: "Alert", message: "Alerte tıklayınca label de göster", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Tamam", style: .default) { _ in
            self.showLabel()
        }
        alert.addAction(okAction)

        self.present(alert, animated: true, completion: nil)
    }

    @objc func alert2Tapped() {
        
        let firstAlert = UIAlertController(title: "Alert 2", message: "Bu ilk alert.", preferredStyle: .alert)
        firstAlert.addAction(UIAlertAction(title: "Evet", style: .default, handler: { action in
            self.showSecondAlert()
        }))
        present(firstAlert, animated: true, completion: nil)
    }

    @objc func alert3Tapped() {
        
        let alertWithTextField = UIAlertController(title: "Yazı Giriniz", message: nil, preferredStyle: .alert)

        alertWithTextField.addTextField { textField in
            textField.placeholder = "Buraya yazınız"
        }

        let saveAction = UIAlertAction(title: "Kaydet", style: .default) { [weak self] action in
            guard let textField = alertWithTextField.textFields?.first else {
                return
            }
            self?.showLabel(withText: textField.text ?? "")
        }

        let cancelAction = UIAlertAction(title: "İptal", style: .cancel, handler: nil)

        alertWithTextField.addAction(saveAction)
        alertWithTextField.addAction(cancelAction)

        present(alertWithTextField, animated: true, completion: nil)
    }

    @objc func extraButtonTapped() {
        
        let optionsAlert = UIAlertController(title: "Seçenekler", message: "Bir seçenek seçin", preferredStyle: .actionSheet)
        let option1Action = UIAlertAction(title: "Seçenek 1", style: .default) { _ in
            self.showLabel(withText: "Seçenek 1 Seçildi")
        }

        let option2Action = UIAlertAction(title: "Seçenek 2", style: .default) { _ in
            self.showLabel(withText: "Seçenek 2 Seçildi")
        }

        let cancelAction = UIAlertAction(title: "İptal", style: .cancel, handler: nil)

        optionsAlert.addAction(option1Action)
        optionsAlert.addAction(option2Action)
        optionsAlert.addAction(cancelAction)

        if let popoverController = optionsAlert.popoverPresentationController {
            popoverController.sourceView = view
            popoverController.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }

        present(optionsAlert, animated: true, completion: nil)
    }

    func showSecondAlert() {
        
        let secondAlert = UIAlertController(title: "Alert 2", message: "Bu iki alert", preferredStyle: .alert)
        secondAlert.addAction(UIAlertAction(title: "Evet", style: .default, handler: nil))
        present(secondAlert, animated: true, completion: nil)
    }

    func showLabel(withText text: String = "View'da Tamam'a Tıklandı!") {
        
        if resultLabel.superview == nil {
            resultLabel = UILabel()
            resultLabel.textAlignment = .center
            view.addSubview(resultLabel)
            resultLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(100)
                make.width.equalTo(300)
                make.height.equalTo(30)
            }
        }

        resultLabel.text = "Sonuçlar: \(text)"
    }
}
