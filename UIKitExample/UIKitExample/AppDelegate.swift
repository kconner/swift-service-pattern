//
//  AppDelegate.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-19.
//

import UIKit
import UIKitExampleServices

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    fileprivate var environment: (any Environment)?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Load/gather app configuration
        let configuration = Configuration(message: "o hai mark")
        
        // Service setup
        environment = EnvironmentImp(configuration: configuration)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

extension SceneDelegate {
    
    // If you know a way for the app to hand a new scene some data
    // before it connects, I'd like to replace this use of .shared.
    var appDelegateEnvironment: (any Environment)? {
        (UIApplication.shared.delegate as? AppDelegate)?.environment
    }
    
}
