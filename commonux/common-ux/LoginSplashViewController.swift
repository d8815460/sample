//
//  LoginSplashViewController.swift
//  CommonUX
//
//  Created by David Lin on 3/22/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit
import Parse


public class LoginSplashViewController: LoginFlowViewController {

    public var authenticator: IAuthenticator!;
    public var accountManager: IAccountManager!;
    
    @IBOutlet public var  backgroundImageView: UIImageView!
    // MARK: - Segue to Login Support
    @IBOutlet public weak var loginButton: UIButton!
    @IBOutlet public weak var creatButton: UIButton!
    
    public override func viewDidLoad() {
        loginButton.setTitle(NSLocalizedString("Login", comment: "Splash"), forState: UIControlState.Normal)
        creatButton.setTitle(NSLocalizedString("Create Account", comment: "Splash"), forState: UIControlState.Normal)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        creatButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    public override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func doSelectLogin() {
        let vc = LoginSplashViewController.getLoginViewControllerInstance();
        vc.accountManager = self.accountManager;
        vc.authenticator = self.authenticator;
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    // MARK: - Sugue to Create Account Support
    
    @IBAction func doSelectRegister() {
        let vc = LoginSplashViewController.getCreateAccountViewControllerInstance();
        vc.accountManager = self.accountManager;
        vc.authenticator = self.authenticator;
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    // MARK: - Flow Launch Support
    
    public class func getCreateAccountViewControllerInstance() -> CreateAccountViewController {
        return inflateVCNamed("CreateAccountViewController") as! CreateAccountViewController;
    }
    
    public class func getLoginSplashViewControllerInstance() -> LoginSplashViewController {
        return inflateVCNamed("LoginSplashViewController") as! LoginSplashViewController;
    }
    
    public class func getLoginViewControllerInstance() -> LoginViewController {
        return inflateVCNamed("LoginViewController") as! LoginViewController;
    }
    
    public static func launchForResultVia(via: UIViewController,
                                          authenticator: IAuthenticator?,
                                          accountManager: IAccountManager?,
                                          cb: LoginFlowCompletionCallback?) {
        let vc = getLoginSplashViewControllerInstance();
        if vc.accountManager == nil {
            vc.accountManager = accountManager;
        }
        if vc.authenticator == nil {
            vc.authenticator = authenticator;
        }
        LoginFlowViewController.flowCompletionCallback = cb; // set static
        let nvc = UINavigationController(rootViewController: vc);
        via.presentViewController(nvc, animated: true, completion: nil);
    }
}
