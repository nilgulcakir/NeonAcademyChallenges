
import UIKit
import SnapKit
import GoogleMobileAds

class ViewController: UIViewController {
    
    var screenWidth = CGFloat()
    var screenHeight = CGFloat()
    
    let banner = GADBannerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSize()
        setupUI()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "Admob Test"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        view.addSubview(label)

        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }


        let nextButton = UIButton()
        nextButton.setTitle("Next Page", for: .normal)
        nextButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        nextButton.tintColor = UIColor.white
        nextButton.backgroundColor = .systemBlue
        nextButton.layer.cornerRadius = 10

        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(32)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(45)
        }

        
        banner.rootViewController = self
        banner.adUnitID = "ca-app-pub-5740874519658000/2096001177"
        banner.load(GADRequest())
        banner.frame = CGRect(x: 0, y: 0.95 * screenHeight, width: screenWidth, height: 0.05 * screenHeight)
        view.addSubview(banner)
    }
    
    @objc func buttonTapped(){
        
        let nextViewController = SecondViewController()
        navigationController?.pushViewController(nextViewController, animated: true)

        
    }
    
    func setDefaultSize() {
        screenWidth = view.frame.size.width
        screenHeight = view.frame.size.height
    }
    
    
    
    

}

