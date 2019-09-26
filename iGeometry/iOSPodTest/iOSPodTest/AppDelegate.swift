//
//  AppDelegate.swift
//  iOSPodTest
//
//  Created by Nail Sharipov on 26/09/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import UIKit
import iGeometry

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        print(IntPoint(x: 1, y: 1))
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

