//
//  SecondViewController.swift
//  StorageFirebaseExample
//
//  Created by Nilgul Cakir on 28.12.2023.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseStorage
import SDWebImage
import SnapKit

class SecondViewController: UIViewController {
    
    let imageNameLabel = UILabel()
    var imageArray = [String]()
    var downloadButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        fetchDataFromFirestore()
    }
    func createUI(){
        view.backgroundColor = .white
        
        imageNameLabel.font = .systemFont(ofSize: 20)
        imageNameLabel.numberOfLines = 0
        imageNameLabel.textAlignment = .center
        imageNameLabel.text = "test"
        view.addSubview(imageNameLabel)
        imageNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.left.right.equalToSuperview().inset(20)
        }
        downloadButton.setTitle("Download", for: .normal)
        downloadButton.setTitleColor(.white, for: .normal)
        downloadButton.configuration = .filled()
        downloadButton.addTarget(self, action: #selector(downloadTapped), for: .touchUpInside)
        view.addSubview(downloadButton)
        downloadButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(20)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-20)
            make.height.equalTo(50)
        }
    }
    func fetchDataFromFirestore() {
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection("Posts").addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    for document in snapshot!.documents {
                        if let url = document.get("imageUrl") as? String {
                            self.imageNameLabel.text = url
                        }
                    }
                }
            }
        }
    }
    @objc func downloadTapped(){
        let storageRef = Storage.storage().reference()
        let reference = storageRef.child("media/image1.jpg")

        reference.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                if let image = UIImage(data: data!){
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                }
            }
        }
    }
}
