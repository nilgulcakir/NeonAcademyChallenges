//
//  ViewController.swift
//  StorageFirebaseExample
//
//  Created by Nilgul Cakir on 1.01.2024.
//

import UIKit
import SnapKit
import Firebase
import FirebaseRemoteConfig

class ViewController: UIViewController {
    
    var eurovisionLabel = UILabel()
    var testLabel = UILabel()
    var imageView = UIImageView()
    
    var contestName : String?
    var contestYear : Int?
    var imageIsHidden : Bool?
    
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI(){
        view.backgroundColor = .white
        
        eurovisionLabel.text = ""
        eurovisionLabel.textAlignment = .center
        eurovisionLabel.font = UIFont.systemFont(ofSize: 23)
        view.addSubview(eurovisionLabel)
        eurovisionLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
        testLabel.text = "Test"
        testLabel.textAlignment = .justified
        testLabel.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(testLabel)
        testLabel.snp.makeConstraints { make in
            make.top.equalTo(eurovisionLabel.snp.bottom).offset(1)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-50)
        }
        imageView.image = UIImage(named: "image")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(testLabel.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().offset(-150)
  
        }
        remoteConfigTest()
    }
    
    func remoteConfigTest() {
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        remoteConfig.configSettings = settings
        let defaults : [String : NSObject] = ["contestName" : "" as NSObject]
        remoteConfig.setDefaults(defaults)
        
        remoteConfig.fetch(withExpirationDuration: 0) { status, error in
            if status == .success, error == nil {
                self.remoteConfig.activate { _, error in
                    guard error == nil else { return }
                    let cN = self.remoteConfig.configValue(forKey: "string_value").stringValue
                    let cY = self.remoteConfig.configValue(forKey: "number_value").numberValue as! Int
                    let iH = self.remoteConfig.configValue(forKey: "change_images_ishidden").boolValue
                    
                    DispatchQueue.main.async {
                        self.updateUI(contestName: cN ?? "", contestYear: cY, imageIsHidden: iH )
                    }
                }
            } else {
                print(error?.localizedDescription ?? "Error")
            }
        }
    }
    func updateUI(contestName: String, contestYear: Int, imageIsHidden: Bool) {
        eurovisionLabel.text = contestName
        testLabel.text = "\(contestYear)"
        imageView.isHidden = imageIsHidden
    }
}
