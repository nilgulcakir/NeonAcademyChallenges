
import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {

        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height

        view.backgroundColor = UIColor.white

        let clubTitleLabel = UILabel()
        clubTitleLabel.text = "Komedi Kulübü"
        clubTitleLabel.textColor = .blue
        clubTitleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        clubTitleLabel.textAlignment = .center
        view.addSubview(clubTitleLabel)

        let clubImageView = UIImageView()
        clubImageView.image = UIImage(named: "r1")
        clubImageView.contentMode = .scaleAspectFit
        view.addSubview(clubImageView)

        var previousEventInfoView: UIView?

        let imageNames = ["r2", "r3", "r4"]
        let eventNames = ["Gösteri 1", "Gösteri 2", "Gösteri 3"]

        for i in 0..<3 {

            let eventInfoView = UIView()
            eventInfoView.backgroundColor = UIColor.purple
            view.addSubview(eventInfoView)
        
            let eventImageView = UIImageView()
            eventImageView.image = UIImage(named: imageNames[i])
            eventImageView.contentMode = .scaleAspectFit
            eventInfoView.addSubview(eventImageView)

            let eventNameLabel = UILabel()
            eventNameLabel.text = eventNames[i]
            eventNameLabel.font = UIFont.systemFont(ofSize: 16)
            eventNameLabel.textColor = .white
            eventNameLabel.textAlignment = .left
            eventInfoView.addSubview(eventNameLabel)

            let ticketPriceLabel = UILabel()
            ticketPriceLabel.text = "Bilet Fiyatı: \(200 + i * 5) TL"
            ticketPriceLabel.font = UIFont.systemFont(ofSize: 14)
            ticketPriceLabel.textColor = .white
            ticketPriceLabel.textAlignment = .left
            eventInfoView.addSubview(ticketPriceLabel)

            let eventDateLabel = UILabel()
            eventDateLabel.text = "Tarih: 0\(i + 1) Ocak 2024"
            eventDateLabel.font = UIFont.systemFont(ofSize: 14)
            eventDateLabel.textColor = .white
            eventDateLabel.textAlignment = .left
            eventInfoView.addSubview(eventDateLabel)

            if i == 0 {
                clubTitleLabel.snp.makeConstraints { make in
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
                    make.centerX.equalToSuperview()
                }

                clubImageView.snp.makeConstraints { make in
                    make.top.equalTo(clubTitleLabel.snp.bottom).offset(20)
                    make.left.right.equalToSuperview().inset(20)
                    make.height.equalTo(150)
                }
            }

            eventInfoView.snp.makeConstraints { make in
                if let previousView = previousEventInfoView {
                    make.top.equalTo(previousView.snp.bottom).offset(20)
                } else {
                    make.top.equalTo(clubImageView.snp.bottom).offset(20)
                }
                make.left.right.equalToSuperview().inset(20)
                make.height.equalTo(120)
            }

            eventImageView.snp.makeConstraints { make in
                make.top.left.bottom.equalToSuperview().inset(10)
                make.width.equalTo(100)
            }

            eventNameLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(10)
                make.left.equalTo(eventImageView.snp.right).offset(10)
                make.right.equalToSuperview().inset(10)
                make.height.equalTo(20)
            }

            ticketPriceLabel.snp.makeConstraints { make in
                make.top.equalTo(eventNameLabel.snp.bottom).offset(8)
                make.left.equalTo(eventImageView.snp.right).offset(10)
                make.right.equalToSuperview().inset(10)
                make.height.equalTo(20)
            }

            eventDateLabel.snp.makeConstraints { make in
                make.top.equalTo(ticketPriceLabel.snp.bottom).offset(8)
                make.left.equalTo(eventImageView.snp.right).offset(10)
                make.right.equalToSuperview().inset(10)
                make.height.equalTo(20)
            }
            
            previousEventInfoView = eventInfoView
        }
    }
}
