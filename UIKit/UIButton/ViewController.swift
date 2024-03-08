

import UIKit
import SnapKit
import AVFoundation


class ViewController: UIViewController {

    var menuView: UIView?
    var highlightButton: UIButton?
    var bankRobberButton: UIButton?
    var audioPlayer: AVAudioPlayer?
    var toggleButton: UIButton?
    var hiddenButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .secondarySystemGroupedBackground

        createUI()
    }

    func createUI() {
        let optionsButton = UIButton()
        optionsButton.setTitle("Seçenekler", for: .normal)
        optionsButton.setTitleColor(UIColor.red, for: .normal)
        optionsButton.addTarget(self, action: #selector(optionsButtonTapped), for: .touchUpInside)

        view.addSubview(optionsButton)
        optionsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }


        menuView = createMenu()
        menuView?.isHidden = true
        view.addSubview(menuView!)
        menuView?.snp.makeConstraints { make in
            make.top.equalTo(optionsButton.snp.bottom)
            make.centerX.equalTo(optionsButton)
            make.width.equalTo(optionsButton)
            make.height.equalTo(80)
        }

        let showOpportunitiesButton = UIButton()
        showOpportunitiesButton.setTitle("Fırsatları Göster", for: .normal)
        showOpportunitiesButton.setTitleColor(UIColor.white, for: .normal)
        showOpportunitiesButton.addTarget(self, action: #selector(showOpportunitiesButtonTapped), for: .touchUpInside)

        showOpportunitiesButton.backgroundColor = UIColor.red
        showOpportunitiesButton.layer.cornerRadius = 10
        showOpportunitiesButton.layer.borderWidth = 2
        showOpportunitiesButton.layer.borderColor = UIColor.blue.cgColor
        showOpportunitiesButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        showOpportunitiesButton.titleLabel?.textAlignment = .center
        showOpportunitiesButton.layer.shadowColor = UIColor.black.cgColor
        showOpportunitiesButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        showOpportunitiesButton.alpha = 0.5

        view.addSubview(showOpportunitiesButton)
        showOpportunitiesButton.snp.makeConstraints { make in
            make.top.equalTo(optionsButton.snp.bottom).offset(90)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)

        }

        highlightButton = UIButton()
        highlightButton?.setTitle("Renk Değiştir", for: .normal)
        highlightButton?.setTitleColor(UIColor.white, for: .normal)

        highlightButton?.backgroundColor = UIColor.purple
        highlightButton?.layer.cornerRadius = 10
        highlightButton?.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        highlightButton?.titleLabel?.textAlignment = .center
        highlightButton?.tintColor = UIColor.purple

        highlightButton?.addTarget(self, action: #selector(highlightButtonTouchDown), for: .touchDown)
        highlightButton?.addTarget(self, action: #selector(highlightButtonTouchUp), for: .touchUpInside)
        highlightButton?.addTarget(self, action: #selector(highlightButtonTouchUp), for: .touchUpOutside)

        view.addSubview(highlightButton!)
        highlightButton?.snp.makeConstraints { make in
            make.top.equalTo(showOpportunitiesButton.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }

        bankRobberButton = UIButton()
        bankRobberButton?.setTitle("Banka Soy", for: .normal)
        bankRobberButton?.setTitleColor(UIColor.white, for: .normal)
        bankRobberButton?.backgroundColor = UIColor.red
        bankRobberButton?.layer.cornerRadius = 10

        bankRobberButton?.addTarget(self, action: #selector(bankRobberButtonTapped), for: .touchUpInside)

        view.addSubview(bankRobberButton!)
        bankRobberButton?.snp.makeConstraints { make in
            make.top.equalTo(highlightButton!.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        toggleButton = UIButton()
        toggleButton?.setTitle("Butonu Göster", for: .normal)
        toggleButton?.setTitleColor(UIColor.white, for: .normal)
        toggleButton?.backgroundColor = UIColor.green
        toggleButton?.layer.cornerRadius = 10
        toggleButton?.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)

        view.addSubview(toggleButton!)
        toggleButton?.snp.makeConstraints { make in
            make.top.equalTo(bankRobberButton!.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }

        hiddenButton = UIButton()
        hiddenButton?.setTitle("Gizli", for: .normal)
        hiddenButton?.setTitleColor(UIColor.white, for: .normal)
        hiddenButton?.backgroundColor = UIColor.orange
        hiddenButton?.layer.cornerRadius = 10
        hiddenButton?.isHidden = true

        view.addSubview(hiddenButton!)
        hiddenButton?.snp.makeConstraints { make in
            make.top.equalTo(toggleButton!.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }

    }

    func createMenu() -> UIView {
        let menuView = UIView()
        menuView.backgroundColor = .white
        menuView.layer.cornerRadius = 5
        menuView.layer.shadowColor = UIColor.black.cgColor
        menuView.layer.shadowOpacity = 0.5
        menuView.layer.shadowOffset = CGSize(width: 0, height: 2)

        let supportButton = createMenuButton(title: "Destek Çağırmak", action: #selector(supportButtonTapped))
        let uyarıButton = createMenuButton(title: "Halka Uyarı Ver", action: #selector(uyarıButtonTapped))

        menuView.addSubview(supportButton)
        menuView.addSubview(uyarıButton)

        supportButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)

        }

        uyarıButton.snp.makeConstraints { make in
            make.top.equalTo(supportButton.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }

        return menuView
    }

    func createMenuButton(title: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    @objc func showOpportunitiesButtonTapped() {
           print("Fırsatları Göster butonuna tıklandı.")
           menuView?.isHidden = true
       }
    
    @objc func optionsButtonTapped() {
        menuView?.isHidden = !(menuView?.isHidden ?? false)
    }

    @objc func supportButtonTapped() {
        print("Destek çağrıldı.")
        menuView?.isHidden = true
    }

    @objc func uyarıButtonTapped() {
        print("Halka uyarı verildi.")
        menuView?.isHidden = true
    }

    @objc func highlightButtonTouchDown() {
        UIView.animate(withDuration: 0.2) {
            self.highlightButton?.backgroundColor = UIColor.yellow
            self.highlightButton?.setTitleColor(UIColor.black, for: .normal)
        }
    }

    @objc func highlightButtonTouchUp() {
        UIView.animate(withDuration: 0.2) {
            self.highlightButton?.backgroundColor = UIColor.purple
        }
    }
    
    @objc func bankRobberButtonTapped() {

        UIView.animate(withDuration: 0.5, animations: {
            self.bankRobberButton?.transform = CGAffineTransform(rotationAngle: .pi / 12)
        }) { (_) in
            UIView.animate(withDuration: 0.5) {
                self.bankRobberButton?.transform = CGAffineTransform.identity
            }
        }

        playSound("musicc")

        bankRobberButton?.setTitle("Soygun İlerliyor", for: .normal)
    }
    
    @objc func toggleButtonTapped() {
        hiddenButton?.isHidden.toggle()
    }

    func playSound(_ soundName: String) {
            guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }

            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }


}

