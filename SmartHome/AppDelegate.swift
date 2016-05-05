//
//  AppDelegate.swift
//  vetch-smarthome
//
//  Created by David Lin on 3/22/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit
import CommonUX
import IQKeyboardManagerSwift
import Parse
import ParseFacebookUtilsV4

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func reachabilityChanged(notif: NSNotification) {
        if (notif.name == ConnectionManager.NOTIF_REACHABLE_BY_WIFI) {
            print("Will reconnect");
        }
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        ConnectionManager.sharedInstance;
        
        let nc = NSNotificationCenter.defaultCenter();
        nc.addObserver(self, selector: #selector(AppDelegate.reachabilityChanged(_:)), name: ConnectionManager.NOTIF_REACHABLE_BY_WIFI, object: nil);
        nc.addObserver(self, selector: #selector(AppDelegate.reachabilityChanged(_:)), name: ConnectionManager.NOTIF_INTERNET_UNREACHABLE, object: nil);
        
        FacebookAuthenticator.sharedInstance.application(application, didFinishLaunchingWithOptions: launchOptions);
        
        //Theme Manager
        DefauleTheme().customizeAppAppearance();
        
        //IQKeyboardManagerSwift
        IQKeyboardManager.sharedManager().enable = true
        
        // Parse SDK
        // ****************************************************************************
        // Parse initialization
        // FIXME: CrashReporting currently query to cydia://        ParseCrashReporting.enable()
        Parse.setApplicationId("IohJb8hiBuOxK0PVxKgncImazE2WSUCSGvMpjQPN", clientKey: "CtRh8Ea2kegXU67HQepEWMrKPVmBYviwuYYGMUKm")
        PFFacebookUtils.initialize()
        // TODO: V4      PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
        // ****************************************************************************
        
        // Track app open.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
        if application.applicationIconBadgeNumber != 0 {
            application.applicationIconBadgeNumber = 0
            PFInstallation.currentInstallation().saveInBackground()
        }
        
        let defaultACL: PFACL = PFACL()
        // Enable public read access by default, with any newly created PFObjects belonging to the current user
        defaultACL.publicReadAccess = true
        PFACL.setDefaultACL(defaultACL, withAccessForCurrentUser: true)
        
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        
        return FacebookAuthenticator.sharedInstance.application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation);
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        FacebookAuthenticator.sharedInstance.applicationDidBecomeActive(application);
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }

}

