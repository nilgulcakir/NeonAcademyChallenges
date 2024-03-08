//
//  FeedViewController.swift
//  InstagramCloneTask
//
//  Created by Nilgul Cakir on 27.12.2023.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import SDWebImage

class FeedViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    var userEmailArray = [String]()
    var userPhotoArray = [String]()
    var userCommentArray = [String]()
    let tableView = UITableView()
    var documentIdArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        getDataFromFirestore()
    }
    
    func createUI(){
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "feedCell")
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! CustomTableViewCell
        cell.emailLabel.text = userEmailArray[indexPath.row]
        cell.postImage.sd_setImage(with: URL(string: self.userPhotoArray[indexPath.row]))
        cell.commentLabel.text = userCommentArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func getDataFromFirestore(){
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection("Posts").order(by: "date", descending: true)
            .addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.userPhotoArray.removeAll(keepingCapacity: false)
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        
                        if let postedBy = document.get("postedBy") as? String {
                            self.userEmailArray.append(postedBy)
                        }
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.userPhotoArray.append(imageUrl)
                        }
                        if let postComment = document.get("postComment") as? String {
                            self.userCommentArray.append(postComment)
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    func makeAlert(title: String, messageInput: String){
        let alert = UIAlertController(title: title , message: messageInput, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}



