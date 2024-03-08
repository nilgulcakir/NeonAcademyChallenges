//
//  AnimationViewController.swift
//  heroTask
//
//  Created by Nilgul Cakir on 19.12.2023.
//

import UIKit

class AnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    func setupUI(){
        
        
        view.backgroundColor = .link
        
        let animationLabel = UILabel()
        animationLabel.textColor = UIColor.white
        animationLabel.text = "Başarıyla Tamamladınız!!"
        animationLabel.textAlignment = .center
        view.addSubview(animationLabel)
        
        animationLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
        }
        
        let backButton = UIButton()
        backButton.setTitle("Geri Dön", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(backButton)

        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
            make.leading.equalToSuperview().offset(10)
        }
        
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    

}
