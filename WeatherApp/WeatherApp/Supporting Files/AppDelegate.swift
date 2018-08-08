//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Arvin San Miguel on 8/7/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let main = WeatherViewController()
        let navigation = UINavigationController(rootViewController: main)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.navigationBar.largeTitleTextAttributes = [ NSAttributedStringKey.foregroundColor: UIColor.black,
                                                              NSAttributedStringKey.font: UIFont(name: "SFCompactDisplay-Semibold", size: 32)! ]
        navigation.navigationBar.topItem?.title = "Weather Forecast"
        navigation.navigationBar.isTranslucent = false
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigation
        
        return true
    }

}

