//
//  CustomTabBarController.swift
//  InstagramCloneTask
//
//  Created by Nilgul Cakir on 27.12.2023.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        
        view.backgroundColor = .lightGray
        
        let feedVC = FeedViewController()
        let uploadVC = UploadViewController()
        let settingsVC = SettingsViewController()

        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "square.grid.2x2"), selectedImage: nil)
        uploadVC.tabBarItem = UITabBarItem(title: "Upload", image: UIImage(systemName: "arrow.up.circle"), selectedImage: nil)
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), selectedImage: nil)


        viewControllers = [feedVC, uploadVC, settingsVC]
                
    }
}
