//
//  AppDelegate.swift
//  Tax
//
//  Created by Yun on 2019/1/3.
//  Copyright © 2019 Higgs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let nav = UINavigationController.init(rootViewController: MainViewController.init(nibName: "MainViewController", bundle: nil))
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        window?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return true
    }

}

