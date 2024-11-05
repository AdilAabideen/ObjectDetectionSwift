//
//  AppDelegate.swift
//  Object Detection By Adil Aabideen
//
//  Created by Adil Aabideen in 2024.
//  All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // Called when the app has finished launching. Customize as needed.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // This method is triggered when the app is moving from an active to inactive state.
    // It can be due to interruptions (e.g., phone calls) or the user closing the app.
    func applicationWillResignActive(_ application: UIApplication) {
        // Pause ongoing tasks, disable timers, or prepare for the app to enter a background state.
    }

    // Called when the app enters the background. Use this to save data or release resources.
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Save application data or release resources to preserve state in case the app is terminated.
    }

    // Called as the app transitions from the background to active. Revert changes made in `applicationDidEnterBackground`.
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Restore the application to its active state as needed.
    }

    // Restart tasks that were paused or stopped while the app was inactive.
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Refresh the UI if needed and resume paused tasks.
    }

    // Invoked when the app is about to terminate. Save any important data here.
    func applicationWillTerminate(_ application: UIApplication) {
        // This is called instead of `applicationDidEnterBackground` if the app is closing.
    }
}
