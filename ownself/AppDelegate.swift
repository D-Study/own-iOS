//
//  AppDelegate.swift
//  ownself
//
//  Created by maccli1 on 2017. 11. 28..
//  Copyright © 2017년 myoung. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        initDefalutOption()
        
        
        let navigat = UINavigationController()
        if let sign: String = defaults.object(forKey: "isSign") as? String, sign == "no" {
            navigat.pushViewController(VcIntro(), animated: false)
        } else {
            navigat.pushViewController(VcHome(), animated: false)
        }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let window = self.window {
            window.backgroundColor = UIColor.white
            window.rootViewController = navigat
            window.makeKeyAndVisible()
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }
    func applicationDidEnterBackground(_ application: UIApplication) { }
    func applicationWillEnterForeground(_ application: UIApplication) { }
    func applicationDidBecomeActive(_ application: UIApplication) { }
    func applicationWillTerminate(_ application: UIApplication) { }
    
    //MARK: ## Etc Method ##
    func initDefalutOption() { //init set UserDefault
        
        // is sign or not sign
        // no -> Intro
        // Member, nonMember -> Home
        if defaults.object(forKey: "isSign") == nil {
            defaults.set("no", forKey: "isSign")
            defaults.synchronize()
        }
        
        
    }
    
    
}

