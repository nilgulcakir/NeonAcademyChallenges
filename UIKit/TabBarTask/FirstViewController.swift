
// FirstViewController.swift

import UIKit
import SnapKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI(){
        
        view.backgroundColor = .lightGray
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "search")
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 300, height: 150))
            
        }
        
        let firstlabel = UILabel()
        firstlabel.text = "Bu ilk sayfa"
        firstlabel.textAlignment = .center
        view.addSubview(firstlabel)

        firstlabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
    }
}

