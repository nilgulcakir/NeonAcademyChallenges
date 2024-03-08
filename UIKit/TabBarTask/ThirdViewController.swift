
//  ThirdViewController.swift

import UIKit
import SnapKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI(){
        
        view.backgroundColor = .lightGray
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "download")
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 300, height: 150))
        }
        
        let thirdlabel = UILabel()
        thirdlabel.text = "Bu üçüncü sayfa"
        thirdlabel.textAlignment = .center
        view.addSubview(thirdlabel)

        thirdlabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}

