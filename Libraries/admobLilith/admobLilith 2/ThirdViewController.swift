
import UIKit
import SnapKit
import GoogleMobileAds

class ThirdViewController: UIViewController, GADFullScreenContentDelegate {
    
    var label : UILabel?
    var rewardedAd : GADRewardedAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .systemGray
        
        label = UILabel()
        label?.text = "Admob TEST"
        label?.textColor = .black
        label?.textAlignment = .center
        label?.font = .systemFont(ofSize: 24, weight: .bold)
        view.addSubview(label!)
        label?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
        }
        
        let button = UIButton(type: .system)
        button.setTitle("Üçüncü Sayfa", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemPink
        button.layer.borderColor = UIColor.black.cgColor
        
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label!.snp.bottom).offset(32)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(45)
        }
    }
    
    @objc func buttonTapped(_ sender : UIButton) {

        let request = GADRequest()
        GADRewardedAd.load(withAdUnitID:"ca-app-pub-3940256099942544/1712485313", request: request, completionHandler: { [self] ad, error in
            rewardedAd = ad
            rewardedAd?.fullScreenContentDelegate = self
            rewardedAd?.present(fromRootViewController: self, userDidEarnRewardHandler: {
                self.label?.text = "Başarılı!"
            })
        }
        )
    }

      func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
      }

      func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad will present full screen content.")
      }

      func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
      }
    
}
