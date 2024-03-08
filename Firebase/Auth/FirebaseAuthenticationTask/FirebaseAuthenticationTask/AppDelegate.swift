//
//  AppDelegate.swift
//  FirebaseAuthenticationTask
//
//  Created by Nilgul Cakir on 24.12.2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
    
        return true
        
    }



}

