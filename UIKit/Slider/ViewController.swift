
import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let dragonSlider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        
    }
    
    func createUI(){
        dragonSlider.minimumValue = 0
        dragonSlider.maximumValue = 50
        dragonSlider.value = 25
        dragonSlider.minimumTrackTintColor = .green
        dragonSlider.maximumTrackTintColor = .red
        dragonSlider.thumbTintColor = .blue

        view.addSubview(dragonSlider)
        dragonSlider.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
        }

        dragonSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
    @objc func sliderValueChanged() {
        let sliderValue = round(dragonSlider.value)
        dragonSlider.value = sliderValue

        print("Slider Değeri: \(sliderValue)")
        if sliderValue == 50 {
            
            print("Ejderhaya Ulaşıldı")
        }
    }
}

