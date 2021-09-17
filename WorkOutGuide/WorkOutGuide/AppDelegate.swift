//
//  AppDelegate.swift
//  WorkOutGuide
//
//  Created by Sriharsha on 13/08/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UINavigationBar.appearance().tintColor = UIColor.white
//        UINavigationBar.appearance().barTintColor = UIColor(red: 0.87, green: 0.53, blue: 0.50, alpha: 1.00)
        UINavigationBar.appearance().barTintColor = appColor
        return true
    }
    
    func printValue()
    {
        print("i am inside app delegate")
    }
    
    func getPlistDict() -> NSDictionary
    {
        var dictionary = NSDictionary()
        
        let  path = Bundle.main.path(forResource: "WorkOuts", ofType: "plist")
        
        if let validPath = path
        {
            let dict = NSDictionary(contentsOfFile: validPath)

            if let validDict = dict
            {
             dictionary = validDict
            }
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

