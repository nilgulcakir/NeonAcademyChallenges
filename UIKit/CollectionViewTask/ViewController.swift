
import UIKit
import SnapKit
import StoreKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellIdentifier = "CollectionViewCell"
    var collectionView: UICollectionView!

    var neonApps: [NeonApp] = [
        
        NeonApp(appIcon: "charging", appName: "Charging App", releaseDate: "2023", appCategory: "Productivity", appid: "https://apps.apple.com/tr/app/charging-animations-app/id1658246981?l=tr"),
        NeonApp(appIcon: "viral", appName: "Viral Sounds", releaseDate: "2023", appCategory: "Games", appid: "https://apps.apple.com/tr/app/viral-sounds-trending-music/id1624486173?l=tr"),
        NeonApp(appIcon: "faceDance", appName: "AI Face Dance", releaseDate: "2023", appCategory: "Productivity", appid: "https://apps.apple.com/tr/app/ai-face-dance/id6455987517?l=tr"),
        NeonApp(appIcon: "fonty", appName: "Fonty Font Changer", releaseDate: "2023", appCategory: "Games", appid: "https://apps.apple.com/tr/app/fonty-font-changer/id6444806061?l=tr"),
        NeonApp(appIcon: "videoGenerator", appName: "AI Video Generatоr", releaseDate: "2023", appCategory: "Games", appid: "https://apps.apple.com/tr/app/ai-music-voice-generator/id6447696368?l=tr"),
        NeonApp(appIcon: "smartCleaner", appName: "Smart Cleaner", releaseDate: "2023", appCategory: "Games", appid: "https://apps.apple.com/tr/app/smart-cleaner-free-up-space/id1576477935?l=tr"),
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    func setupUI(){
        
        view.backgroundColor = .white

        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.itemSize = CGSize(width: (view.frame.width - 24) / 2, height: 200)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        view.addSubview(collectionView)

        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return neonApps.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewCell
        let neonApp = neonApps[indexPath.item]
        cell.imageView.image = UIImage(named: neonApp.appIcon)
        cell.label.text = neonApp.appName
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let selectedNeonApp = neonApps[indexPath.item]
        let detailViewController = DetailViewController(neonApp: selectedNeonApp)
        self.navigationController?.pushViewController(detailViewController, animated: true)

//        detailViewController.modalPresentationStyle = .fullScreen
        present(detailViewController, animated: true)

        
    }
    
}

