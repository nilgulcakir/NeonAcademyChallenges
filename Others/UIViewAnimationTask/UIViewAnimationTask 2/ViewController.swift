//
//  ViewController.swift
//  UIViewAnimationTask
//
//  Created by Nilgul Cakir on 5.01.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let animatedView = UIView()
    private let weaponImageView = UIImageView()
    private let animatedLabel = UILabel()
    let moveButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    private func setupUI() {
        
        view.backgroundColor = .white

        view.addSubview(animatedView)
        animatedView.backgroundColor = UIColor.blue
        animatedView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 100, height: 100))
        }

        let hideButton = UIButton()
        hideButton.setTitle("Hide", for: .normal)
        hideButton.layer.cornerRadius = 10
        hideButton.backgroundColor = .link
        hideButton.addTarget(self, action: #selector(hideAnimatedView), for: .touchUpInside)
        view.addSubview(hideButton)
        hideButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(25)
            make.width.equalTo(60)
        }
        
        let showButton = UIButton()
        showButton.setTitle("Show", for: .normal)
        showButton.backgroundColor = .link
        showButton.layer.cornerRadius = 10
        showButton.addTarget(self, action: #selector(showAnimatedView), for: .touchUpInside)
        view.addSubview(showButton)
        showButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(hideButton.snp.trailing).offset(10)
            make.width.equalTo(60)
        }

        let rotateButton = UIButton()
        rotateButton.setTitle("Rotate", for: .normal)
        rotateButton.backgroundColor = .link
        rotateButton.layer.cornerRadius = 10
        rotateButton.addTarget(self, action: #selector(rotateWeapon), for: .touchUpInside)
        view.addSubview(rotateButton)
        rotateButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(showButton.snp.trailing).offset(10)
            make.width.equalTo(60)
        }

  
        moveButton.setTitle("Move", for: .normal)
        moveButton.backgroundColor = .link
        moveButton.layer.cornerRadius = 10
        moveButton.addTarget(self, action: #selector(moveLabel), for: .touchUpInside)
        view.addSubview(moveButton)
        moveButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(rotateButton.snp.trailing).offset(10)
            make.width.equalTo(60)
        }

        let resizeButton = UIButton()
        resizeButton.setTitle("Resize", for: .normal)
        resizeButton.backgroundColor = .link
        resizeButton.layer.cornerRadius = 10
        resizeButton.addTarget(self, action: #selector(resizeView), for: .touchUpInside)
        view.addSubview(resizeButton)
        resizeButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(moveButton.snp.trailing).offset(10)
            make.width.equalTo(60)
        }

        view.addSubview(weaponImageView)
        weaponImageView.image = UIImage(named: "image")
        weaponImageView.contentMode = .scaleAspectFill
        weaponImageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(40)
            make.top.equalTo(hideButton.snp.bottom).offset(50)
            make.size.equalTo(CGSize(width: 150, height: 100))
        }

        view.addSubview(animatedLabel)
        animatedLabel.text = "SnapKit Magic"
        animatedLabel.textAlignment = .center
        animatedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(hideButton.snp.top).offset(130)
            make.leading.equalTo(weaponImageView.snp.trailing).offset(40)
        }
        
    }

    @objc private func hideAnimatedView() {
        UIView.animate(withDuration: 0.5) {
            self.animatedView.alpha = 0.0
        }
    }

    @objc private func showAnimatedView() {
        UIView.animate(withDuration: 0.5) {
            self.animatedView.alpha = 1.0
        }
    }

    @objc private func rotateWeapon() {
        UIView.animate(withDuration: 0.5) {
            self.weaponImageView.transform = self.weaponImageView.transform.rotated(by: .pi)
        }
    }

    @objc private func moveLabel() {
        animatedLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(moveButton.snp.top).offset(50)
            make.left.equalTo(moveButton.snp.left)
        }

        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }

    @objc private func resizeView() {
        animatedView.snp.updateConstraints { (make) in
            make.size.equalTo(CGSize(width: 150, height: 150))
        }

        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}
