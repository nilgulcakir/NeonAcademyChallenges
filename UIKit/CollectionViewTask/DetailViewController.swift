//
//  DetailViewController.swift
//  CollectionViewTask
//
//  Created by Nilgul Cakir on 16.12.2023.
//

import UIKit
import SnapKit
import StoreKit

class DetailViewController: UIViewController {
    
    var neonApp: NeonApp

    init(neonApp: NeonApp) {
        self.neonApp = neonApp
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
       
    }
    
    func setupUI(){
        
        view.backgroundColor = .white
        let appIconImageView = UIImageView()
        appIconImageView.contentMode = .scaleAspectFit
        
        view.addSubview(appIconImageView)
        appIconImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
        }

        let appNameLabel = UILabel()
        appNameLabel.textAlignment = .center
        appNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(appNameLabel)
        
        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(appIconImageView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
        }
        
        let releaseDateLabel = UILabel()
        releaseDateLabel.textAlignment = .center
        releaseDateLabel.textColor = .gray
        view.addSubview(releaseDateLabel)
        
        releaseDateLabel.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(7)
            make.leading.trailing.equalToSuperview()
        }
            
        let categoryLabel = UILabel()
        categoryLabel.textAlignment = .center
        categoryLabel.textColor = .blue
        view.addSubview(categoryLabel)
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(releaseDateLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
            
        let appstoreButton = UIButton(type: .system)
        appstoreButton.setTitle("View on App Store", for: .normal)
        appstoreButton.addTarget(self, action: #selector(openAppStore), for: .touchUpInside)
        view.addSubview(appstoreButton)
        
        appstoreButton.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        appIconImageView.image = UIImage(named: neonApp.appIcon)
        appNameLabel.text = neonApp.appName
        releaseDateLabel.text = "Release Date: \(neonApp.releaseDate)"
        categoryLabel.text = "Category: \(neonApp.appCategory)"
    }
    

    @objc func openAppStore() {
        guard let appid = neonApp.appid, !appid.isEmpty else {
            print("Invalid App ID")
            return
        }

        let appStoreURLString = "https://apps.apple.com/app/id\(appid)"
        
        if let appStoreURL = URL(string: appStoreURLString), UIApplication.shared.canOpenURL(appStoreURL) {
            UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
        } else {
            print("Failed to open App Store")
        }
    }
    
}





        
