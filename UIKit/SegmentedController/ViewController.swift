//
//  ViewController.swift
//  exampleSegmentedController
//
//  Created by Nilgul Cakir on 11.12.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let segmentedControl = UISegmentedControl(items: ["Neon Academy 2023", "Neon", "Apps"])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    func setupUI(){
        
        resizeSegmentedControl(with: 0.9)
        
        view.addSubview(segmentedControl)
               
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(60)
        }

        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.red], for: .init(rawValue: 0))
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.green], for: .init(rawValue: 1))
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.blue], for: .init(rawValue: 2))

        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            print("Neon Academy 2023 seçildi")
            resizeSegmentedControl(with: 0.9)
            
        case 1:
            print("Neon seçildi")
            resizeSegmentedControl(with: 0.85)
        case 2:
            print("Apps seçildi")
            resizeSegmentedControl(with: 0.80)
        default:
            break
        }
    }

    func resizeSegmentedControl(with scale: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.segmentedControl.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
}
