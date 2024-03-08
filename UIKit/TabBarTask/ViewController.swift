

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        
        func setupUI(){
            

            let tabBarController = UITabBarController()
            
            tabBarController.selectedIndex = 0
            
            // İlk sayfa
            let firstViewController = FirstViewController()
            firstViewController.title = "Sayfa 1"
            firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

            let firstNavController = UINavigationController(rootViewController: firstViewController)

            let secondViewController = SecondViewController()
            secondViewController.title = "Sayfa 2"
            secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
            let secondNavController = UINavigationController(rootViewController: secondViewController)

            let thirdViewController = ThirdViewController()
            thirdViewController.title = "Sayfa 3"
            thirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
            let thirdNavController = UINavigationController(rootViewController: thirdViewController)

            let fourthViewController = FourthViewController()
            fourthViewController.title = "Sayfa 4"
            fourthViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 3)
            let fourthNavController = UINavigationController(rootViewController: fourthViewController)

            tabBarController.viewControllers = [firstNavController, secondNavController, thirdNavController, fourthNavController]

            addChild(tabBarController)
            view.addSubview(tabBarController.view)
            tabBarController.didMove(toParent: self)
            
            tabBarController.view.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
}


