
//  FourthViewController.swift


import UIKit
import SnapKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    func setupUI(){
        
        view.backgroundColor = .lightGray
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "book")
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 300, height: 150))
        }

        let fourthlabel = UILabel()
        fourthlabel.text = "Bu dördüncü sayfa"
        fourthlabel.textAlignment = .center
        view.addSubview(fourthlabel)

        fourthlabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
    }
    

}



