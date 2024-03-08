//
//  ViewController.swift
//  DenemeOrnek5
//
//  Created by Nilgul Cakir on 5.12.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){

        let testString = "level"
        print(" '\(testString)' palindrome \(testString.isPalindrome())")
        
        let testNumber = 17
        print(" \(testNumber) Asal sayı \(testNumber.isPrime())")

        let currentDate = Date()
        let futureDate = currentDate.addingTimeInterval(86400 * 5)
        print("İki tarih arasındaki gün sayısı: \(currentDate.daysBetween(futureDate))")

        setViewBackgroundColor(.lightGray)

        let titleLabel = UILabel()
        titleLabel.setText("Hello, Swift!")
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }

        let imageView = UIImageView()
        imageView.setBackgroundImage(UIImage(named: "r1")!)
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.width.height.equalTo(100)
        }

        let button = UIButton()
        button.setBackgroundColor(.blue)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
}



// UIViewController extension
extension UIViewController {
    func setViewBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

// UIImage extension
extension UIImage {
    
}


