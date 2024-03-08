//
//  ViewController.swift
//  heroTask
//
//  Created by Nilgul Cakir on 19.12.2023.
//


import UIKit
import SnapKit
import Hero

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func setupUI(){
        
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.blue
        titleLabel.text = "Labirente Hoşgeldiniz!!"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
        }
        
        let nextButton = UIButton()
        nextButton.setTitle("İleri", for: .normal)
        nextButton.tintColor = UIColor.white
        nextButton.backgroundColor = UIColor.green
        nextButton.layer.cornerRadius = 10
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        view.addSubview(nextButton)
        
        nextButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 100, height: 50))
        }
        
    }

    
    @objc func nextButtonTapped(){
        
        let nextViewController = NextPartViewController()
//        nextViewController.hero.isEnabled = true
//        nextViewController.hero.modalAnimationType = .slide(direction: .left)
        navigationController?.pushViewController(nextViewController, animated: true)
//        present(nextViewController, animated: true, completion: nil)
        
    }

}
