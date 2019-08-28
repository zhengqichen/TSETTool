//
//  AppDelegate.swift
//  ZQStatusBarDemo
//
//  Created by 雷丹 on 2019/7/19.
//  Copyright © 2019 CZQ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let nvc = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = nvc
        /// 全局修改状态栏字体颜色：需要在plist里面添加
        /// key:View controller-based status bar appearance
        /// value:no
//        UIApplication.shared.statusBarStyle = .lightContent
        return true
    }

    
    
    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

