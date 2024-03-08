//
//  ViewController.swift
//  pickerChallengeTask
//
//  Created by Nilgul Cakir on 14.12.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, SecondViewControllerDelegate  {
    
    let birthDateLabel = UILabel()
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    func setupUI(){
        
        imageView.image = UIImage(named: "resim")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(300)
        }
        
        let nameLabel = UILabel()
        nameLabel.text = "İsim : Nilgül Çakır"
        nameLabel.textColor = UIColor.blue
        view.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.height.equalTo(100)
        }
        
      
        birthDateLabel.text = "Doğum Tarihi :"
        birthDateLabel.textColor = UIColor.red
        view.addSubview(birthDateLabel)
        
        birthDateLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.height.equalTo(100)
        }
        
        let editButton = UIButton()
        editButton.setTitle("Düzenle", for: .normal)
        editButton.setTitleColor(.blue, for: .normal)
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        view.addSubview(editButton)
        
        editButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(birthDateLabel.snp.bottom).offset(40)
            make.height.equalTo(100)
        }
        
    }
    
    @objc func editButtonTapped(){
        
        let secondViewController = SecondViewController()
        secondViewController.delegate = self
        present(secondViewController, animated: true, completion: nil)
    }
    
    func didSelectDate(_ date: Date, _ image: UIImage?) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let formattedDate = dateFormatter.string(from: date)
        birthDateLabel.text = "Doğum Tarihi: \(formattedDate)"
      
        if let selectedImage = image {
            imageView.image = selectedImage
        }
    }
}

