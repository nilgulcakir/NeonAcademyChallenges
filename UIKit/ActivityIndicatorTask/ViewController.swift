
import UIKit
import SnapKit

class ViewController: UIViewController {

    var countLabel: UILabel!
    var activityIndicator: UIActivityIndicatorView!
    var startButton: UIButton!
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        
        countLabel = UILabel()
        countLabel.text = "0"
        countLabel.textAlignment = .center
        view.addSubview(countLabel)
        countLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
        }

        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor.blue
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        startButton = UIButton(type: .system)
        startButton.setTitle("Başla", for: .normal)
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(countLabel.snp.bottom).offset(20)
        }
    }

    @objc func startButtonTapped() {
        
        activityIndicator.startAnimating()
        startButton.isEnabled = false

        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.count += 1
            self.countLabel.text = "\(self.count)"

            if self.count == 100 {
                timer.invalidate()
                self.activityIndicator.stopAnimating()
                self.startButton.isEnabled = true
            } else if self.count % 10 == 0 {

                let randomColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
                self.activityIndicator.color = randomColor
            }
        }
    }
}
