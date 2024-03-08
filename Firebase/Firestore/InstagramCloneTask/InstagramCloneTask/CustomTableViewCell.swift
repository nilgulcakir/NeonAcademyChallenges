//
//  CustomTableViewCell.swift
//  InstagramCloneTask
//
//  Created by Nilgul Cakir on 27.12.2023.
//

import UIKit
import FirebaseFirestore

class CustomTableViewCell: UITableViewCell {
    
    let emailLabel = UILabel()
    let postImage = UIImageView()
    let commentLabel = UILabel()
    let documentIdLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func createUI(){
        postImage.contentMode = .scaleAspectFit
        self.contentView.addSubview(postImage)
        postImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(40)
            make.left.equalTo(contentView.snp.left).offset(20)
            make.right.equalTo(contentView.snp.right).offset(-20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-50)
        }
        
        emailLabel.font = UIFont.systemFont(ofSize: 16)
        contentView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(5)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.bottom.equalTo(postImage.snp.top).offset(-5)
        }
        commentLabel.font = UIFont.systemFont(ofSize: 16)
        commentLabel.textColor = .link
        contentView.addSubview(commentLabel)
        commentLabel.snp.makeConstraints { make in
            make.top.equalTo(postImage.snp.bottom).offset(10)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)

        }
    }
}
