

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let label = UILabel()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        
        label.textAlignment = .center
        label.textColor = .black
        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}


