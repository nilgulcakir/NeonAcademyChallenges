

import UIKit
import SnapKit

class ViewController: UIViewController {

    var visitNameTextField : UITextField!
    var haveVisited : UITextField!
    var manyTimeVisitedTextField : UITextField!
    var saveButton : UIButton!
    var visitLabel : UILabel!
    var haveVisitedLabel : UILabel!
    var manyTimeLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadSavedData()
        
    }
    
    func setupUI(){
        
        view.backgroundColor = UIColor.lightGray
        
        visitNameTextField = UITextField()
        visitNameTextField.placeholder = "Ziyaret Etmek İstediğiniz Yerin Tam Adı :"
        visitNameTextField.textColor = UIColor.blue
        view.addSubview(visitNameTextField)
        
        visitNameTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(9)
            make.top.equalToSuperview().offset(100)
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }

        haveVisited = UITextField()
        haveVisited.placeholder = "Daha Önce Bu Yere Gittiniz mi? :"
        view.addSubview(haveVisited)
        haveVisited.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(9)
            make.top.equalTo(visitNameTextField.snp.bottom).offset(20)
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        
        manyTimeVisitedTextField = UITextField()
        manyTimeVisitedTextField.placeholder = "Burayı Kaç Kez Ziyaret Ettiniz? :"
        view.addSubview(manyTimeVisitedTextField)
        manyTimeVisitedTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(9)
            make.top.equalTo(haveVisited.snp.bottom).offset(20)
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        
        saveButton = UIButton()
        saveButton.setTitle("Kaydet", for: .normal)
        saveButton.backgroundColor = UIColor.red
        saveButton.tintColor = UIColor.white
        saveButton.layer.cornerRadius = 10
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        view.addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(manyTimeVisitedTextField.snp.bottom).offset(20)
            make.size.equalTo(CGSize(width: 80, height: 40))
        }
        
        visitLabel = UILabel()
        visitLabel.textColor = UIColor.blue
        
        view.addSubview(visitLabel)
        visitLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(9)
            make.top.equalTo(saveButton.snp.bottom).offset(5)
            make.width.equalToSuperview()
            make.height.equalTo(30)
        }
        
        haveVisitedLabel = UILabel()
        haveVisitedLabel.textColor = UIColor.blue
        
        view.addSubview(haveVisitedLabel)
        haveVisitedLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(9)
            make.top.equalTo(visitLabel.snp.bottom).offset(5)
            make.width.equalToSuperview()
            make.height.equalTo(30)
        }
        
        manyTimeLabel = UILabel()
        manyTimeLabel.textColor = UIColor.blue
        
        view.addSubview(manyTimeLabel)
        manyTimeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(9)
            make.top.equalTo(haveVisitedLabel.snp.bottom).offset(5)
            make.width.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    
    @objc func saveButtonTapped() {
        
        let visitName = visitNameTextField.text ?? ""
        let haveVisitedValue = haveVisited.text?.lowercased() == "evet"
        let manyTimes = Int(manyTimeVisitedTextField.text ?? "") ?? 0

        UserDefaults.standard.set(visitName, forKey: "name")
        UserDefaults.standard.set(haveVisitedValue, forKey: "have")
        UserDefaults.standard.set(manyTimes, forKey: "many")

        loadSavedData()
    }

    func loadSavedData() {

        if let storedName = UserDefaults.standard.string(forKey: "name") {
            visitLabel.text = "Ziyaret Etmek İstediğiniz Yer: \(storedName)"
        }

        if let storedHaveVisited = UserDefaults.standard.value(forKey: "have") as? Bool {
            haveVisitedLabel.text = storedHaveVisited ? "Evet" : "Hayır"
        }

        if let storedManyTimes = UserDefaults.standard.value(forKey: "many") as? Int {
            manyTimeLabel.text = "Ziyaret Sayısı: \(storedManyTimes)"
        }
    }
}


