//
//  NextPartViewController.swift
//  heroTask
//
//  Created by Nilgul Cakir on 19.12.2023.
//

import UIKit
import SnapKit
import Hero

class NextPartViewController: UIViewController {
    
    let buttonSize: CGFloat = 50

    override func viewDidLoad() {
        super.viewDidLoad()

        animationTask()
    }

    
    func animationTask(){
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "maze")
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 200, height: 100))
            
        }
        
        let upButton = UIButton()
        upButton.setTitle("⬆️", for: .normal)
        upButton.addTarget(self, action: #selector(moveUp), for: .touchUpInside)
        view.addSubview(upButton)
   
        upButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(-40)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: buttonSize, height: buttonSize))
        }
        
        let downButton = UIButton()
        downButton.setTitle("⬇️", for: .normal)
        downButton.addTarget(self, action: #selector(moveDown), for: .touchUpInside)
        view.addSubview(downButton)
        
        downButton.snp.makeConstraints { make in
            make.bottom.equalTo(imageView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: buttonSize, height: buttonSize))
        }
        
        let leftButton = UIButton()
        leftButton.setTitle("⬅️", for: .normal)
        leftButton.addTarget(self, action: #selector(moveLeft), for: .touchUpInside)
        view.addSubview(leftButton)
        
        leftButton.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.left).offset(-20)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: buttonSize, height: buttonSize))
        }
        
        let rightButton = UIButton()
        rightButton.setTitle("➡️", for: .normal)
        rightButton.addTarget(self, action: #selector(moveRight), for: .touchUpInside)
        view.addSubview(rightButton)
        
        rightButton.snp.makeConstraints { make in
            make.right.equalTo(imageView.snp.right).offset(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: buttonSize, height: buttonSize))
        }
                
    }

    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func moveUp(){
        
        let animationVC = AnimationViewController()
        animationVC.hero.isEnabled = true
        animationVC.hero.modalAnimationType = .slide(direction: .up)
        present(animationVC, animated: true, completion: nil)
   
    }
    
    @objc func moveDown(){
        
        let animationVC = AnimationViewController()
        animationVC.hero.isEnabled = true
        animationVC.hero.modalAnimationType = .cover(direction: .down)
        present(animationVC, animated: true, completion: nil)
        
    }
    
    @objc func moveLeft(){
        
        let animationVC = AnimationViewController()
        animationVC.hero.isEnabled = true
        animationVC.hero.modalAnimationType = .push(direction: .left)
        present(animationVC, animated: true, completion: nil)
    }
    
    @objc func moveRight(){
        
        let animationVC = AnimationViewController()
        animationVC.hero.isEnabled = true
        animationVC.hero.modalAnimationType = .zoomSlide(direction: .right)
        present(animationVC, animated: true, completion: nil)
    }
}
