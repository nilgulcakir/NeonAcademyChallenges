
import UIKit
import SnapKit


class ViewController: UIViewController {

    
    let label = UILabel()
    let subTitleLabel = UILabel()
    let imageView = UIImageView()
    let pageControl = UIPageControl()
    
    let titles = ["baslık1","baslık2","baslık3","baslık4","baslık5"]
    let subtitles = ["baslık1","baslık1","baslık1","baslık1","baslık1"]
    let imageNames = ["page1","page2","page3","page4","page1",]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        updatePageContent()
    }
    
    func setupUI(){
        
        view.backgroundColor = .white
        
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalToSuperview()
        }
        
        subTitleLabel.textColor = .white
        subTitleLabel.textAlignment = .center
        subTitleLabel.font = UIFont.italicSystemFont(ofSize: 16)
        
        view.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { make in
            
            make.top.equalTo(label.snp.bottom).offset(10)
            make.centerX.equalToSuperview()

        }
        
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 300, height: 200))
        }
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = 5
        pageControl.pageIndicatorTintColor = UIColor.orange
        pageControl.currentPageIndicatorTintColor = UIColor.blue
        
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        
        pageControl.addTarget(self, action: #selector(PageControlChanged), for: .valueChanged)
        pageControl.currentPage = 0
        pageControl.numberOfPages = 5
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
    }
    
    @objc func PageControlChanged(){
        updatePageContent()
    }
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer){
        
        print("sayfalar arası geçiş yapıldı")
    }
    
    func updatePageContent(){
        
        label.text = titles[pageControl.currentPage]
        subTitleLabel.text = subtitles[pageControl.currentPage]
        imageView.image = UIImage(named: imageNames[pageControl.currentPage])

        let colors: [UIColor] = [.systemPink, .lightGray, .systemFill, .systemIndigo, .systemPurple]
        view.backgroundColor = colors[pageControl.currentPage]
    }

}

