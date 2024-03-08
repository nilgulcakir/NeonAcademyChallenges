import UIKit
import SnapKit

class ViewController: UIViewController {

    var isDevice1On = false
    var isDevice2On = false

    let appNameLabel = UILabel()
    let deviceStatusLabel = UILabel()

    let dataLabel = UILabel()

    let device1View = UIView()
    let device2View = UIView()


    let device1Image = UIImageView(image: UIImage(named: "resim1"))
    let device2Image = UIImageView(image: UIImage(named: "resim2"))

    let device1Button = UIButton()
    let device2Button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .secondarySystemGroupedBackground
        
        createUI()

    }

    func createUI(){

        dataLabel.text = getCurrentDate()

        appNameLabel.text = "FUTURE TECH"
        appNameLabel.textColor = .blue
        appNameLabel.font = .boldSystemFont(ofSize: 30)
        appNameLabel.textAlignment = .center

        view.addSubview(appNameLabel)
        appNameLabel.snp.makeConstraints( {make in
            make.top.equalToSuperview().offset(100)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()

        })

        deviceStatusLabel.text = "BAĞLI CİHAZLARIN DURUMU"
        deviceStatusLabel.textColor = .brown
        deviceStatusLabel.font = .boldSystemFont(ofSize: 15)
        deviceStatusLabel.textAlignment = .center

        view.addSubview(deviceStatusLabel)
        deviceStatusLabel.snp.makeConstraints( {make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(110)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()

        })

        dataLabel.textColor = .blue
        view.addSubview(dataLabel)
        dataLabel.snp.makeConstraints( { make in
            make.top.equalTo(deviceStatusLabel.snp.bottom).offset(20)
            make.centerX.equalTo(view)

        })

        view.addSubview(device1Image)
        device1Image.snp.makeConstraints { make in
            make.top.equalTo(dataLabel.snp.bottom).offset(40)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.height.equalTo(80)
            make.width.equalTo(80)

        }

        device1View.backgroundColor = UIColor.yellow
        view.addSubview(device1View)
        device1View.snp.makeConstraints { make in
            make.top.equalTo(dataLabel.snp.bottom).offset(20)
            make.centerX.equalTo(device1Image)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }

        view.addSubview(device2Image)
        device2Image.snp.makeConstraints { make in
            make.top.equalTo(deviceStatusLabel.snp.bottom).offset(75)
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-40)
        }
        
        device2View.backgroundColor = UIColor.yellow
        view.addSubview(device2View)
        device2View.snp.makeConstraints { make in
            make.top.equalTo(dataLabel.snp.bottom).offset(20)
            make.centerX.equalTo(device2Image)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }

        device1Button.setTitle("OFF", for: .normal)
        device1Button.setTitleColor(UIColor.blue, for: .normal)
        device1Button.addTarget(self, action: #selector(device1ButtonTapped), for: .touchUpInside)

        view.addSubview(device1Button)
        device1Button.snp.makeConstraints { make in
            make.top.equalTo(device1Image.snp.bottom).offset(10)
            make.centerX.equalTo(device1Image)
        }

        device2Button.setTitle("OFF", for: .normal)
        device2Button.setTitleColor(UIColor.blue, for: .normal)
        device2Button.addTarget(self, action: #selector(device2ButtonTapped), for: .touchUpInside)

        view.addSubview(device2Button)
        device2Button.snp.makeConstraints { make in
            make.top.equalTo(device2Image.snp.bottom).offset(10)
            make.centerX.equalTo(device2Image)
        }
        
        self.view.bringSubviewToFront(device1Image)
        self.view.bringSubviewToFront(device2Image)
    }

    @objc func device1ButtonTapped(){

        isDevice1On.toggle()
        let title = isDevice1On ? "OFF" : "ON"
        device1Button.setTitle(title, for: .normal)
        device1Button.setTitleColor(isDevice1On ? .red : .blue , for: .normal)

    }

    @objc func device2ButtonTapped(){
        isDevice1On.toggle()
        let title = isDevice1On ? "OFF" : "ON"
        device2Button.setTitle(title, for: .normal)
        device2Button.setTitleColor(isDevice1On ? .red : .blue , for: .normal)
    }

    func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: Date())
    }
}
