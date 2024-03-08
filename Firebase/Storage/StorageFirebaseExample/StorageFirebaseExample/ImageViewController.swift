//
//  ViewController.swift
//  StorageFirebaseExample
//
//  Created by Nilgul Cakir on 28.12.2023.
//

import UIKit
import SnapKit
import FirebaseStorage
import FirebaseFirestore


class ImageViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imageView = UIImageView()
    let saveButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        
        view.backgroundColor = .systemPink
        
        imageView.image = UIImage(named: "upload")
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        view.addSubview(imageView)

        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(200)
        }
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        saveButton.backgroundColor = UIColor.blue
        saveButton.setTitleColor(UIColor.white, for: .normal)
        saveButton.layer.cornerRadius = 8
        saveButton.clipsToBounds = true
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        view.addSubview(saveButton)

        saveButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(100)
            make.height.equalTo(40)
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        imageView.addGestureRecognizer(tapGesture)
   
    }
    @objc func saveButtonTapped(){
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let mediaFolder = storageRef.child("media")
        if let imageData = imageView.image?.jpegData(compressionQuality: 0.5){
            let imageReference = mediaFolder.child("image1.jpg")
            imageReference.putData(imageData) { metadata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                    return
                } else {
                    imageReference.downloadURL { url, error in
                        if error != nil {
                            print(error!.localizedDescription)
                            return
                        } else {
                            let imageUrl = url?.absoluteString
                            //Database
                            let firestoreDatabase = Firestore.firestore()
                            var firestoreRef: DocumentReference?

                            let firestorePost = ["imageUrl": imageUrl!] as [String: Any]

                            firestoreRef = firestoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: { error in
                                if error != nil{
                                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                                } else{
                                    let vc = SecondViewController()
                                    vc.modalPresentationStyle = .fullScreen
                                    self.present(vc, animated: true)
                                }
                            })
                        }
                    }
                }
            }
        }
    }
            
    @objc func imageViewTapped() {
        showImagePicker()
    }

    func showImagePicker() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }

}
