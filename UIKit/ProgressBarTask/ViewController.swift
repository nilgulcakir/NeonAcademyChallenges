

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var progressView: UIProgressView!
    var progressButton: UIButton!
    var currentProgress: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI(){
        
        progressView = UIProgressView(progressViewStyle: .default)
        view.addSubview(progressView)
        
        progressView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.width.equalTo(200)
            make.height.equalTo(20)
        }

        progressButton = UIButton(type: .system)
        progressButton.setTitle("Görev Tamamlandı", for: .normal)
        view.addSubview(progressButton)
        
        progressButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(progressView.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        progressButton.addTarget(self, action: #selector(increaseProgress), for: .touchUpInside)
    }
    
    @objc func increaseProgress() {

        currentProgress += 1.0
        if currentProgress > 10.0 {
            currentProgress = 0.0
        }

        progressView.setProgress(currentProgress / 10.0, animated: true)
    }
}
