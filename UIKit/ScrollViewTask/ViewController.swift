

import UIKit
import SnapKit

class ViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI(){
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.backgroundColor = UIColor.white
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }

        let contentView = UIView()
        contentView.backgroundColor = UIColor.white
        scrollView.addSubview(contentView)
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(view)
            make.height.equalTo(view).multipliedBy(2)
        }

        let label1 = UILabel()
        label1.text = "Etiket 1"
        label1.textAlignment = .center
        label1.textColor = UIColor.red
        contentView.addSubview(label1)
        
        label1.snp.makeConstraints { make in
            make.top.left.right.equalTo(contentView)
            make.height.equalTo(contentView).dividedBy(8)
        }

        let label2 = UILabel()
        label2.text = "Etiket 2"
        label2.textAlignment = .center
        label2.textColor = UIColor.red
        contentView.addSubview(label2)
        
        label2.snp.makeConstraints { make in
            make.top.equalTo(label1.snp.bottom)
            make.left.right.equalTo(contentView)
            make.height.equalTo(contentView).dividedBy(8)
        }

        let label3 = UILabel()
        label3.text = "Etiket 3"
        label3.textAlignment = .center
        label3.textColor = UIColor.red
        contentView.addSubview(label3)
        
        label3.snp.makeConstraints { make in
            make.top.equalTo(label2.snp.bottom)
            make.left.right.equalTo(contentView)
            make.height.equalTo(contentView).dividedBy(8)
        }

        let label4 = UILabel()
        label4.text = "Etiket 4"
        label4.textAlignment = .center
        label4.textColor = UIColor.red
        contentView.addSubview(label4)
        
        label4.snp.makeConstraints { make in
            make.top.equalTo(label3.snp.bottom)
            make.left.right.equalTo(contentView)
            make.height.equalTo(contentView).dividedBy(8)
        }

        let label5 = UILabel()
        label5.text = "Etiket 5"
        label5.textAlignment = .center
        label5.textColor = UIColor.red
        contentView.addSubview(label5)
        
        label5.snp.makeConstraints { make in
            make.top.equalTo(label4.snp.bottom)
            make.left.right.equalTo(contentView)
            make.height.equalTo(contentView).dividedBy(8)
        }

        let label6 = UILabel()
        label6.text = "Etiket 6"
        label6.textAlignment = .center
        label6.textColor = UIColor.red
        contentView.addSubview(label6)
        
        label6.snp.makeConstraints { make in
            make.top.equalTo(label5.snp.bottom)
            make.left.right.equalTo(contentView)
            make.height.equalTo(contentView).dividedBy(8)
        }

        let label7 = UILabel()
        label7.text = "Etiket 7"
        label7.textAlignment = .center
        label7.textColor = UIColor.red
        contentView.addSubview(label7)
        
        label7.snp.makeConstraints { make in
            make.top.equalTo(label6.snp.bottom)
            make.left.right.equalTo(contentView)
            make.height.equalTo(contentView).dividedBy(8)
        }

        let label8 = UILabel()
        label8.text = "Etiket 8"
        label8.textAlignment = .center
        label8.textColor = UIColor.red
        contentView.addSubview(label8)
        
        label8.snp.makeConstraints { make in
            make.top.equalTo(label7.snp.bottom)
            make.left.right.equalTo(contentView)
            make.height.equalTo(contentView).dividedBy(8)
            make.bottom.equalTo(contentView)
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let bottomOffset = scrollView.contentOffset.y + scrollView.frame.size.height
        if bottomOffset >= scrollView.contentSize.height - scrollView.contentInset.bottom {

            print("Kaydırma görünümünün sonuna ulaşıldı")

        }
    }
}

