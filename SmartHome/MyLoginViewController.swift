//
//  MyLoginViewController.swift
//  SmartHome
//
//  Created by David Lin on 4/3/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit
import CommonUX

public class MyLoginViewController: LoginViewController {
    
    public class override func getLoginViewControllerInstance() -> LoginViewController {
        let bundle = NSBundle(forClass: MyLoginViewController.self);
        let vc = MyLoginViewController(nibName: "MyLoginViewController", bundle: bundle);
        vc.authenticator = FacebookAuthenticator.sharedInstance;
        return vc;
    }
    
    @IBAction public override func doLogin() {
        self.showProgress("Logging in...");
        
        let authenticator = self.authenticator as! FacebookAuthenticator;
        authenticator.loginVia(self) { error, token in
            self.hideProgress();
            if let error = error {
                self.onLoginError(error);
            } else if let token = token {
                LoginFlowViewController.flowCompletionCallback?(error: nil, cancelled: false, token: token);
            } else {
                LoginFlowViewController.flowCompletionCallback?(error: nil, cancelled: true, token: nil);
            }
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad();
    }
}
