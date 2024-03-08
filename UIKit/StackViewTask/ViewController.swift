//
//  ViewController.swift
//  stackViewTask
//
//  Created by Nilgul Cakir on 13.12.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        view.addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    
        let magic1 = UILabel()
        magic1.text = "Accio Magic"
        magic1.textColor = UIColor.blue
        magic1.textAlignment = .center
        stackView.addArrangedSubview(magic1)
        magic1.snp.makeConstraints { make in
            make.height.equalTo(30)
        }

        let magic2 = UILabel()
        magic2.text = "Bubbles Magic"
        magic2.textColor = UIColor.blue
        magic2.textAlignment = .center
        stackView.addArrangedSubview(magic2)
        magic2.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        let magic3 = UILabel()
        magic3.text = "Confundus Magic"
        magic3.textColor = UIColor.blue
        magic3.textAlignment = .center
        stackView.addArrangedSubview(magic3)
        magic3.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
    }
}

