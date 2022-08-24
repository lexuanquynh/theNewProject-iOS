//
//  AppDelegate.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/24/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    // Check ios version for ios < 13
    private func SYSTEM_VERSION_LESS_THAN(version: String) -> Bool {
        return UIDevice.current.systemVersion.compare(version, options: .numeric) == .orderedAscending
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if SYSTEM_VERSION_LESS_THAN(version: "13.0") {
//            let taskDetailViewController = TaskDetailViewController(nibName: "TaskDetailViewController", bundle: nil)
//            let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
////            let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
//            self.window = UIWindow(frame: UIScreen.main.bounds)
//            self.window?.rootViewController = loginViewController
//            self.window?.makeKeyAndVisible()
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

