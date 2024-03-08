//
//  ViewController.swift
//  lottieTask
//
//  Created by Nilgul Cakir on 18.12.2023.
//

import UIKit
import SnapKit
import Lottie

class ViewController: UIViewController {

    let animationView = LottieAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLottieAnimation()
      
    }
    func setupLottieAnimation() {

        let animation = LottieAnimation.named("computer")
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)

        animationView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(200)
        }
            
    }
    
    func setupUI(){
        
        let startButton = UIButton()
        startButton.setTitle("Başla", for: .normal)
        startButton.tintColor = UIColor.white
        startButton.backgroundColor = UIColor.red
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        view.addSubview(startButton)
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        let stopButton = UIButton()
        stopButton.setTitle("Dur", for: .normal)
        stopButton.tintColor = UIColor.white
        stopButton.backgroundColor = UIColor.blue
        stopButton.layer.cornerRadius = 10
        stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        view.addSubview(stopButton)

        stopButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
        }

        let continueButton = UIButton()
        continueButton.setTitle("Devam Et", for: .normal)
        continueButton.tintColor = UIColor.white
        continueButton.backgroundColor = UIColor.brown
        continueButton.layer.cornerRadius = 10
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        view.addSubview(continueButton)

        continueButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
    
    @objc func startButtonTapped(){
        
        self.animationView.play()
    }
    
    @objc func stopButtonTapped(){
        
        self.animationView.stop()
        
    }
    
    @objc func continueButtonTapped(){
        
        self.animationView.play()
        
    }
}

