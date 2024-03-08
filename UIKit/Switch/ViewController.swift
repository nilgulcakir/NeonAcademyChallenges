import UIKit
import SnapKit

class ViewController: UIViewController {

    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .brightGreen
        return view
    }()


    let colorSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = false
        switchControl.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        switchControl.thumbTintColor = .black
        return switchControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
      
    }
    
    func createUI(){
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        view.addSubview(colorSwitch)
        colorSwitch.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
    }
    
    @objc func switchValueChanged() {
        mainView.backgroundColor = colorSwitch.isOn ? .brightGreen : .darkRed
        colorSwitch.onTintColor = colorSwitch.isOn ? .darkRed : .brightGreen
        colorSwitch.thumbTintColor = .black
    }
}

extension UIColor {
    static var darkRed: UIColor {
        return UIColor(red: 0.7, green: 0, blue: 0, alpha: 1.0)
    }

    static var brightGreen: UIColor {
        return UIColor(red: 0, green: 0.8, blue: 0, alpha: 1.0)
    }
}


