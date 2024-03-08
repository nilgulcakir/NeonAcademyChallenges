//
//  SecondViewController.swift
//  pickerChallengeTask
//
//  Created by Nilgul Cakir on 14.12.2023.
//

import UIKit
import SnapKit

protocol SecondViewControllerDelegate: AnyObject {
    func didSelectDate(_ date: Date, _ image: UIImage?)
}

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    var delegate: SecondViewControllerDelegate?
    var selectedImage: UIImage?
    
    let datePicker = UIDatePicker()
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()

    }
    
    func createUI(){
        
        view.backgroundColor = .white
        
        datePicker.datePickerMode = .date
        
        imageView.image = UIImage(named: "resim")
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapGesture)
        
        view.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
        }
        
        let saveButton = UIButton()
        saveButton.setTitle("Kaydet", for: .normal)
        saveButton.setTitleColor(.blue, for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        view.addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(datePicker.snp.bottom).offset(20)
        }
    }
    
    @objc func imageTapped(){
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }

    @objc func saveButtonTapped(){
        delegate?.didSelectDate(datePicker.date, imageView.image)
        dismiss(animated: true, completion: nil)
    }
}
