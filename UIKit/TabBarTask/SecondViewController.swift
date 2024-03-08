
// SecondViewController.swift

import UIKit
import SnapKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

    }
    
    func setupUI(){

        view.backgroundColor = .lightGray
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 300, height: 150))
        }
        
        let secondlabel = UILabel()
        secondlabel.text = "Bu ikinci sayfa"
        secondlabel.textAlignment = .center
        view.addSubview(secondlabel)

        secondlabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        

        

    }
}
