//
//  AppDelegate.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/24/22.
//

import UIKit
#if DEBUG
import FPSLabel
#endif

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    // Check ios version for ios < 13
    private func SYSTEM_VERSION_LESS_THAN(version: String) -> Bool {
        return UIDevice.current.systemVersion.compare(version, options: .numeric) == .orderedAscending
    }

    func buildAppConfig() -> Void {
        let themeColors = Colors(primaryDark: .systemBlue, primaryLight: .systemOrange, secondaryDark: .black, secondaryLight: .systemBlue, textColorDark: .black, textColorLight: .white, primaryBackgroundColor: .white, secondaryBackgroundColor: .blue, disabledTextColor: .lightGray, whiteTransparentColor: .init(white: 1, alpha: 0.5))
        
        let themeFonts = Fonts()
        
        let theme = AppTheme.Builder()
            .addColors(colors: themeColors)
            .addFonts(fonts: themeFonts)
            .build()
        
        //Singleton with builder, commit-> no return
        AppConfig.Builder()
//            .setServerConfig(serverConfig: serverConfig)
            .setThemeType(themeType: .NORMAL)
            .setNormalTheme(theme: theme)
            .setDarkTheme(theme: theme)
            .setLocale(local: "en")
            .commit()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //make app config
        buildAppConfig()

        
        if SYSTEM_VERSION_LESS_THAN(version: "13.0") {
            let navigationController = UINavigationController()
            self.window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = navigationController
            let rootCoordinator = AuthCoordinator(navigationController: navigationController)
            rootCoordinator.start()
            self.window?.makeKeyAndVisible()
#if DEBUG
        FPSLabel.install(on: self.window)
#endif
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

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .portrait
    }
}

