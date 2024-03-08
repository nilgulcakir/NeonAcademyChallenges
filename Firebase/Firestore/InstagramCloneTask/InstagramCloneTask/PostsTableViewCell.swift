//
//  PostsTableViewCell.swift
//  InstagramCloneTask
//
//  Created by Nilgul Cakir on 28.12.2023.
//

import UIKit
import FirebaseFirestore

class PostsTableViewCell: UITableViewCell {
    
    let usernameLabel = UILabel()
    let userImageView = UIImageView()
    let likesLabel = UILabel()
    let commentLabel = UILabel()
    let likeButton = UIButton()
    var id: String = ""
    var like = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        likeButton.setTitle("Like", for: .normal)
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
    }
    @objc func likeButtonTapped(){
        let fsDatabase = Firestore.firestore()
        
        if id != "" {
            like += 1
            likesLabel.text = "\(like) Likes"
            let likes = ["likes": (like)] as [String: Any]
            fsDatabase.collection("Posts").document(id).setData(likes, merge: true)
        }
    }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
    
