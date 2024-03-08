//
//  SecondViewController.swift
//  admobLilith
//
//  Created by Nilgul Cakir on 21.12.2023.
//

import UIKit
import SnapKit
import GoogleMobileAds

class SecondViewController: UIViewController, GADFullScreenContentDelegate {
    
    var interstitial: GADInterstitialAd?
    var label : UILabel?
    var rewardedAd : GADRewardedAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        
        view.backgroundColor = .systemRed
        
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: "ca-app-pub-3940256099942544/4411468910", request: request) { ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            self.interstitial = ad
            self.interstitial?.fullScreenContentDelegate = self
            self.interstitial?.present(fromRootViewController: self)
        }
        
        let secondlabel = UILabel()
        secondlabel.text = "Admob Test"
        secondlabel.textColor = .black
        secondlabel.textAlignment = .center
        secondlabel.font = .systemFont(ofSize: 24, weight: .bold)
        view.addSubview(secondlabel)
        
        secondlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
        
        
        let secondButton = UIButton()
        secondButton.setTitle("Next Page", for: .normal)
        secondButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        secondButton.tintColor = UIColor.white
        secondButton.backgroundColor = .systemBlue
        secondButton.layer.cornerRadius = 10
        
        view.addSubview(secondButton)
        secondButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(secondlabel.snp.bottom).offset(32)
            make.height.equalTo(120)
            make.height.equalTo(50)
        }
    }
    // Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }
    // Tells the delegate that the ad will present full screen content.
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad will present full screen content.")
    }
    // Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
    }
    
    @objc func buttonTapped() {
        
        
        let thirdVC = ThirdViewController()
        thirdVC.modalPresentationStyle = .fullScreen
        present(thirdVC, animated: true)
        
        
        
    }
    
}
