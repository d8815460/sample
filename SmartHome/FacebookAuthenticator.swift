//
//  FacebookAuthenticator.swift
//  SmartHome
//
//  Created by David Lin on 4/3/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit
import CommonUX
import ParseFacebookUtilsV4

class FacebookAuthenticator : IAuthenticator {
    
    func login(identity: String,
               credential: String,
                 callback: LoginCallback?) {
        fatalError("OAuth does not support login with identity / credential");
    }
    
    func resetPasswordForEmail(email: String,
                               callback: SimpleAPICallback?) {
        fatalError("OAuth does not support resetting password");
    }
    
    
    func loginVia(vc: UIViewController, callback cb: LoginCallback?) {
        let manager = FBSDKLoginManager();
        manager.logInWithReadPermissions(["public_profile"], fromViewController: vc) { result, error in
            if error != nil {
                cb?(error: error, token: nil);
            } else if result.isCancelled {
                cb?(error: nil, token: nil);
            } else {
                cb?(error: nil, token: result.token)
            }
        }
    }
    
    static let sharedInstance = FacebookAuthenticator();
    
    // MARK: - App Delegate Life Cycle Hooks
    
    func application(app: UIApplication, didFinishLaunchingWithOptions options: [NSObject: AnyObject]?) {
        FBSDKApplicationDelegate.sharedInstance().application(app, didFinishLaunchingWithOptions: options);
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url , sourceApplication: sourceApplication, annotation: annotation);
    }

    func applicationDidBecomeActive(application: UIApplication) {
        FBSDKAppEvents.activateApp();
    }
}