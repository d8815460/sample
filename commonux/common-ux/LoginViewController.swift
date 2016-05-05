//
//  LoginViewController.swift
//  common-ux
//
//  Created by David Lin on 3/22/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit
import Parse

public class LoginViewController: LoginFlowViewController {
    
    @IBOutlet public weak var createAccountButton: UIButton!
    @IBOutlet public weak var emailTextField: UITextField!
    @IBOutlet public weak var passwordTextField: UITextField!
    @IBOutlet public weak var usernameIcon: UIImageView!
    
    @IBOutlet public weak var passwordIcon: UIImageView!
    
    @IBOutlet public weak var loginButton: UIButton!
    @IBOutlet public weak var forgotButton: UIButton!
    
    @IBOutlet public weak var loginViewBackground: UIView!
    @IBOutlet public weak var whiteBackground: UIView!
    
    public var authenticator: IAuthenticator!;
    public var accountManager: IAccountManager?;
    
    
    // MARK: - Life Cycle
    
    override public func viewDidLoad() {
        super.viewDidLoad();
        
        self.view.backgroundColor = DefauleTheme.MainColor
        self.loginViewBackground.backgroundColor = DefauleTheme.MainColor
        
        emailTextField?.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Email", comment: "LoginSigup"), attributes: [NSForegroundColorAttributeName: DefauleTheme.textPlaceholderColor])
        passwordTextField?.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Password", comment: "LoginSigup"), attributes: [NSForegroundColorAttributeName: DefauleTheme.textPlaceholderColor])
        loginButton.setTitle(NSLocalizedString("Login", comment: "LoginSigup"), forState: .Normal)
        forgotButton.setTitle(NSLocalizedString("Forgot password", comment: "LoginSigup"), forState: .Normal)
        createAccountButton.setTitle(NSLocalizedString("Create an account", comment: "LoginSigup"), forState: .Normal)
        self.title = NSLocalizedString("Login", comment: "LoginSigup")
        
        forgotButton.setBackgroundImage(getImageWithColor(UIColor.clearColor(), size: CGSizeMake(200, 200)), forState: UIControlState.Normal)
        forgotButton.setBackgroundImage(getImageWithColor(UIColor.clearColor(), size: CGSizeMake(200, 200)), forState: UIControlState.Highlighted)
        forgotButton.setTitleColor(DefauleTheme.MainColor, forState: UIControlState.Normal)
        createAccountButton.setBackgroundImage(getImageWithColor(UIColor.clearColor(), size: CGSizeMake(200, 200)), forState: UIControlState.Normal)
        createAccountButton.setBackgroundImage(getImageWithColor(UIColor.clearColor(), size: CGSizeMake(200, 200)), forState: UIControlState.Highlighted)
        createAccountButton.setTitleColor(DefauleTheme.MainColor, forState: UIControlState.Normal)
        
        whiteBackground.backgroundColor = DefauleTheme.loginWhiteColor
    }
    
    // MARK: - Login Support
 
    // this is a convinient IBAction hook for sub-class to implement login button handler
    // thie IBAction requires usernameTextField and passwordTextField IBOutlets to be hooked in
    @IBAction public func doLogin() {
        self.showProgress(NSLocalizedString("Logging In...", comment: "Progress"));
        PFUser.logInWithUsernameInBackground(emailTextField.text!, password: passwordTextField.text!, block: { (user, error) in
            self.hideProgress()
            if user != nil {
                if user?.objectForKey("emailVerified") != nil {
                    //已經驗證過，轉場回首頁
                    if user?.objectForKey("emailVerified")! as! Bool == true {
                        self.dismissViewControllerAnimated(true, completion: {
                            
                        })
                    } else {
                        //轉場到未驗證 email 畫面
                        let vc = LoginViewController.getPromptActivateAccountViewController()
                        let nvc = self.navigationController
                        nvc?.pushViewController(vc, animated: true)
                    }
                } else {
                    //轉場到未驗證 email 畫面
                    let vc = LoginViewController.getPromptActivateAccountViewController()
                    let nvc = self.navigationController
                    nvc?.pushViewController(vc, animated: true)
                }
            } else {
                let errorString = error?.userInfo["error"] as! String
                PFAlertView.showAlertWithTitle(nil, message: NSLocalizedString(errorString, comment: "Login"), cancelButtonTitle: NSLocalizedString("OK", comment: "Login"), otherButtonTitles: nil, completion: { (selectedOtherButtonIndex) in
                    // otherButton, first = 0, second = 1
                    print("button pressed\(selectedOtherButtonIndex)")
                })
            }
        })
        
//        loginWithIdentity(emailTextField!.text!, andCredential: passwordTextField!.text!) { error in
//            self.hideProgress();
//            return false;
//        }
    }
    
    // this is a convinient function that can be called by sub-class to start the login procedure
    public func loginWithIdentity(identity: String, andCredential credential: String, callback cb: ChainedCallback?) {
        authenticator.login(identity, credential: credential) { error, token in
            if cb != nil && cb!(error: error, userInfo: ["token": token]) {
                return;
            }
            
            if let error = error {
                self.onLoginError(error);
                return;
            }
            
            guard let token = token else {
                let err = NSError(domain: "CommonUX", code: 0, userInfo: [NSLocalizedDescriptionKey: "Authentication service did not return a token"]);
                self.onLoginError(err);
                return;
            }

            self.onLoginSuccess(token: token);
        }
    }
    
    // this is an override point for sub-class, sub-class can decide the way it wants to handle
    // login error, default behavior is to present a alert controller showing the error
    public func onLoginError(error: NSError) {
        self.showErrorDialog(error.localizedDescription);
    }
    
    public func onLoginSuccess(token token: AnyObject) {
        // all is good, no error, and has token, we are finished
        LoginFlowViewController.flowCompletionCallback?(error: nil, cancelled: false, token: token);
        self.navigationController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil);
    }
    
    // MARK: - Segye to Create Account Support
    
    @IBAction func doRegister() {
        if self.accountManager == nil {
            let vc = LoginViewController.getCreateAccountViewControllerInstance()
            vc.accountManager = self.accountManager
            let nvc = self.navigationController
            nvc?.popToRootViewControllerAnimated(false)
            nvc?.pushViewController(vc, animated: true)
        } else {
            // guard against invalid state
        }
    }
    
    // MARK: - Segue to Reset Password Support
    
    @IBAction func doForgetPassword() {
        let vc = LoginViewController.getResetPasswordViewControllerInstance()
        vc.authenticator = self.authenticator;
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    // MARK: - Flow Launch Support

    public class func getResetPasswordViewControllerInstance() -> ResetPasswordViewController {
        return inflateVCNamed("ResetPasswordViewController") as! ResetPasswordViewController
    }
    
    public class func getCreateAccountViewControllerInstance() -> CreateAccountViewController {
        return inflateVCNamed("CreateAccountViewController") as! CreateAccountViewController
    }
    
    public class func getLoginViewControllerInstance() -> LoginViewController {
        return inflateVCNamed("LoginViewController") as! LoginViewController
    }

    public class func getPromptActivateAccountViewController() -> PromptActivateAccountViewController {
        return inflateVCNamed("PromptActivateAccountViewController") as! PromptActivateAccountViewController
    }
    
    public static func launchForResultVia(via: UIViewController,
                                          authenticator: IAuthenticator?,
                                          cb: LoginFlowCompletionCallback?) {
        
        let vc = getLoginViewControllerInstance();
        LoginFlowViewController.flowCompletionCallback = cb;
        if authenticator != nil {
            vc.authenticator = authenticator;
        }
        let nvc = UINavigationController(rootViewController: vc);
        via.presentViewController(nvc, animated: true, completion: nil);
    }
    
    // MARK: - private func
    
    private func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    
}
