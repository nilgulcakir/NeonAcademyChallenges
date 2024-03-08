//
//  ViewController.swift
//  TheAdventureOfBatmanAPI
//
//  Created by Nilgul Cakir on 3.01.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
   
    var tryLabel = UILabel()
    var usdLabel = UILabel()
    var gbpLabel = UILabel()
    var cadLabel = UILabel()
    var jpyLabel = UILabel()


    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI(){
        
        view.backgroundColor = .white
        
        let currencyConverterText = UILabel()
        currencyConverterText.text = "Currency Converter 2024"
        currencyConverterText.textColor = .red
        currencyConverterText.font = .systemFont(ofSize: 30)
        currencyConverterText.textAlignment = .center
        
        view.addSubview(currencyConverterText)
        currencyConverterText.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.right.equalToSuperview().inset(10)
        }
        tryLabel.text = "TRY: "
        tryLabel.font = .systemFont(ofSize: 20)
        tryLabel.textAlignment = .center
        view.addSubview(tryLabel)
        tryLabel.snp.makeConstraints { make in
            make.top.equalTo(currencyConverterText.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
        }
        
        usdLabel.text = "USD: "
        usdLabel.font = .systemFont(ofSize: 20)
        usdLabel.textAlignment = .center
        view.addSubview(usdLabel)
        usdLabel.snp.makeConstraints { make in
            make.top.equalTo(tryLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        gbpLabel.text = "GBP: "
        gbpLabel.font = .systemFont(ofSize: 20)
        gbpLabel.textAlignment = .center
        view.addSubview(gbpLabel)
        gbpLabel.snp.makeConstraints { make in
            make.top.equalTo(usdLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        cadLabel.text = "CAD: "
        cadLabel.font = .systemFont(ofSize: 20)
        cadLabel.textAlignment = .center
        view.addSubview(cadLabel)
        cadLabel.snp.makeConstraints { make in
            make.top.equalTo(gbpLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        jpyLabel.text = "JPY: "
        jpyLabel.font = .systemFont(ofSize: 20)
        jpyLabel.textAlignment = .center
        view.addSubview(jpyLabel)
        jpyLabel.snp.makeConstraints { make in
            make.top.equalTo(cadLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        let getRatesButton = UIButton()
        getRatesButton.setTitle("Get Rates", for: .normal)
        getRatesButton.backgroundColor = .blue
        getRatesButton.tintColor = .white
        getRatesButton.layer.cornerRadius = 10
        getRatesButton.addTarget(self, action: #selector(getRatesButtonTapped), for: .touchUpInside)
        view.addSubview(getRatesButton)
        
        getRatesButton.snp.makeConstraints { make in
            make.top.equalTo(jpyLabel.snp.bottom).offset(100)
            make.left.right.equalToSuperview().inset(130)
        }
        
        
    }
    
    @objc func getRatesButtonTapped(){
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=8fa082024f59a654dd790b61b1841b58")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error!", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            } else {
                // 2) Response & Data
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        //ASYNC
                        DispatchQueue.main.async {
                            // 3) Parsing & JSON Serialization
                            if let rates = jsonResponse["rates"] as? [String : Any]{
                                //Rates
                            
                                if let trY = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY: \(trY)"
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY: \(jpy)"
                                }
                            }
                        }
                    } catch {
                        print("error")
                    }
                }
            }
        }
        task.resume()
    }
}
               
            




