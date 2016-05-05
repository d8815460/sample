//
//  CreateAccountViewController.swift
//  CommonUX
//
//  Created by David Lin on 3/22/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit
import Parse


public class CreateAccountViewController: LoginFlowViewController {

    // MARK: - Overridable fields

    @IBOutlet public weak var termOfServiceHolderView: UIView?
    @IBOutlet public weak var firstNameTextField: UITextField?
    @IBOutlet public weak var lastNameTextField: UITextField?
    @IBOutlet public weak var emailTextField: UITextField?
    @IBOutlet public weak var passwordTextField: UITextField?
    @IBOutlet public weak var passwordConfirmTextField: UITextField?
    @IBOutlet public weak var mainPromptLabel: UILabel?;
    @IBOutlet public weak var termOfTextView: UITextView!
    @IBOutlet public weak var termButton: UIButton!
    @IBOutlet public weak var createButton: UIButton!
    @IBOutlet public weak var alreadyHaveAccountButton: UIButton!
    @IBOutlet weak var inputViewBackground: UIView!
    @IBOutlet weak var whiteBackground: UIView!
    
    @IBOutlet weak var theTermTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var theTermBottomConstraint: NSLayoutConstraint!
    
    
    public var accountManager: IAccountManager!;
    public var authenticator: IAuthenticator!;
    
    public var termOfServicePath: String? {
        return nil; // sub-class can override
    }
    
    // MARK: - Life Cycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // Theme
        self.view.backgroundColor = DefauleTheme.MainColor
        self.inputViewBackground.backgroundColor = DefauleTheme.MainColor
        self.whiteBackground.backgroundColor = DefauleTheme.loginWhiteColor
        self.mainPromptLabel?.textColor = DefauleTheme.MainColor
        
        switch DefauleTheme.getDeviceType {
        case "iphone6":
            theTermTrailingConstraint.constant = 40
            theTermBottomConstraint.constant = 19
        case "iphone6plus":
            theTermTrailingConstraint.constant = 45
            theTermBottomConstraint.constant = 18
        case "iphone5":
            theTermTrailingConstraint.constant = 160
            theTermBottomConstraint.constant = 3
            
        case "iphone4":
            theTermTrailingConstraint.constant = 120
            theTermBottomConstraint.constant = 30
            termOfTextView.hidden = true
            termButton.hidden = true
        default:
            break
        }
        
        mainPromptLabel?.text = NSLocalizedString("New Account", comment: "LoginSigup")
        termOfTextView.text = NSLocalizedString("Password must be a combination of 8 to 20 characters and contain at least one capital letter and one number. By pressing \"create\" to agree with", comment: "LoginSigup")
        termButton.setTitle(NSLocalizedString("the term of use", comment: "LoginSigup"), forState: .Normal)
        alreadyHaveAccountButton.setTitle(NSLocalizedString("I already have an account.", comment: "LoginSigup"), forState: .Normal)
        createButton.setTitle(NSLocalizedString("Create", comment: "LoginSigup"), forState: .Normal)
        self.title = NSLocalizedString("Create Account", comment: "LoginSigup")
        
        emailTextField?.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Email", comment: "LoginSigup"), attributes: [NSForegroundColorAttributeName: DefauleTheme.textPlaceholderColor])
        firstNameTextField?.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("First name (optional)", comment: "LoginSigup"), attributes: [NSForegroundColorAttributeName: DefauleTheme.textPlaceholderColor])
        lastNameTextField?.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Last name (optional)", comment: "LoginSigup"), attributes: [NSForegroundColorAttributeName: DefauleTheme.textPlaceholderColor])
        passwordTextField?.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Password", comment: "LoginSigup"), attributes: [NSForegroundColorAttributeName: DefauleTheme.textPlaceholderColor])
        passwordConfirmTextField?.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Confirm Password", comment: "LoginSigup"), attributes: [NSForegroundColorAttributeName: DefauleTheme.textPlaceholderColor])
        
        termButton.setBackgroundImage(getImageWithColor(UIColor.clearColor(), size: CGSizeMake(200, 200)), forState: UIControlState.Normal)
        termButton.setBackgroundImage(getImageWithColor(UIColor.clearColor(), size: CGSizeMake(200, 200)), forState: UIControlState.Highlighted)
        termButton.setTitleColor(DefauleTheme.MainColor, forState: UIControlState.Normal)
        
        alreadyHaveAccountButton.setBackgroundImage(getImageWithColor(UIColor.clearColor(), size: CGSizeMake(200, 200)), forState: UIControlState.Normal)
        alreadyHaveAccountButton.setBackgroundImage(getImageWithColor(UIColor.clearColor(), size: CGSizeMake(200, 200)), forState: UIControlState.Highlighted)
        alreadyHaveAccountButton.setTitleColor(DefauleTheme.MainColor, forState: UIControlState.Normal)
        
        
    }
    
    // MARK: - UI Events
    
    @IBAction func doShowTermOfUse() {
        guard let path = termOfServicePath else {
            return;
        }
        
        let bundle = NSBundle(forClass: WebBrowserViewController.self);
        let vc = WebBrowserViewController(nibName: "WebBrowserViewController", bundle: bundle);
        
        vc.url = NSURL(string: path);
        vc.title = NSLocalizedString("Term of Use", comment: "View Controller Title");
        vc.presentedModally = true;
        let nvc = UINavigationController(rootViewController: vc);
        self.navigationController?.presentViewController(nvc, animated: true, completion: nil);
    }
    
    // MARK: - Create Account Support 
    
    @IBAction func doCreate() {
        // Parse creat Account
        if PFUser.currentUser() == nil {
            let user = PFUser()
            user.username = emailTextField?.text!
            user.email    = emailTextField?.text!
            user.password = passwordTextField?.text!
            if firstNameTextField?.text != nil {
                user.setValue(firstNameTextField?.text!, forKey: "firstName")
            }
            if lastNameTextField?.text != nil {
                user.setValue(lastNameTextField?.text!, forKey: "lastName")
            }
            
            self.showProgress(NSLocalizedString("Creating Account...", comment: "Sign up"))
            
            if passwordTextField?.text != passwordConfirmTextField?.text! {
                self.hideProgress()
                PFAlertView.showAlertWithTitle(nil, message: NSLocalizedString("Your password is not the same.", comment: "Sign up"), cancelButtonTitle: NSLocalizedString("OK", comment: "Sign up"), otherButtonTitles: nil, completion: { (selectedOtherButtonIndex) in
                    // otherButton, first = 0, second = 1
                    print("button pressed\(selectedOtherButtonIndex)")
                })
            }else{
                user.signUpInBackgroundWithBlock({ (bool, error) in
                    self.hideProgress()
                    if (error != nil) {
                        let errorString = error?.userInfo["error"] as! String
                        PFAlertView.showAlertWithTitle(nil, message: NSLocalizedString(errorString, comment: "Sign up"), cancelButtonTitle: NSLocalizedString("OK", comment: "Sign up"), otherButtonTitles: nil, completion: { (selectedOtherButtonIndex) in
                            // otherButton, first = 0, second = 1
                            print("button pressed\(selectedOtherButtonIndex)")
                        })
                    }else{
                        let vc = CreateAccountViewController.getResetPasswordViewControllerInstance();
                        self.navigationController?.pushViewController(vc, animated: true);
                        return
                    }
                })
            }
        }
        
        
//        let vc = CreateAccountViewController.getResetPasswordViewControllerInstance();
//        self.navigationController?.pushViewController(vc, animated: true);
//        return
        
        /* 暫時採用上面測試
        if passwordTextField!.text != passwordConfirmTextField!.text {
            showErrorDialog(NSLocalizedString("Passwords do not match", comment: "Error Message"));
            return
        }
        
        self.showProgress(NSLocalizedString("Creating Account...", comment: "Sign up"));
        createAccountWithIdentity(emailTextField!.text!, credential: passwordTextField!.text!, email: emailTextField!.text!, andMeta: nil) { error in
            self.hideProgress();
            return false
        }
        */
    }
    
    public class func getResetPasswordViewControllerInstance() -> PromptActivateAccountViewController {
        return inflateVCNamed("PromptActivateAccountViewController") as! PromptActivateAccountViewController;
    }
    
    public func createAccountWithIdentity(identity: String, credential: String, email: String, andMeta meta: [String: AnyObject]?, callback cb: ChainedCallback?) {
        
        accountManager.create(identity: identity, credential: credential, email: email, meta: meta) { error in
            self.hideProgress()
            
            if cb != nil && cb!(error: error, userInfo: nil) {
                return;
            }
            
            if let error = error {
                self.onCreateAccountError(error);
            } else {
                self.onCreateAccountSuccess(email: email);
            }
        }
    }
    
    public func onCreateAccountError(error: NSError) {
        self.showErrorDialog(error.localizedDescription);
    }
    
    public func onCreateAccountSuccess(email email: String) {
        let vc = CreateAccountViewController.getPromptActivateAccountViewControllerInstance();
        
        vc.accountManager = self.accountManager;
        vc.email = email;
        
        let nvc = self.navigationController;
        nvc?.popToRootViewControllerAnimated(false);
        nvc?.pushViewController(vc, animated: true);
    }
    
    // MARK: - Segue to Login Support
    
    @IBAction func doLogin() {
        let vc = CreateAccountViewController.getLoginViewControllerInstance();
        
        vc.authenticator = self.authenticator;
        vc.accountManager = self.accountManager;
        
        let nvc = self.navigationController;
        nvc?.popToRootViewControllerAnimated(false);
        nvc?.pushViewController(vc, animated: true);
    }
    
    // MARK: - Flow Launch Support
    
    public class func getLoginViewControllerInstance() -> LoginViewController {
        return inflateVCNamed("LoginViewController") as! LoginViewController;
    }
    
    public class func getPromptActivateAccountViewControllerInstance() -> PromptActivateAccountViewController {
        return inflateVCNamed("PromptActivateAccountViewController") as! PromptActivateAccountViewController;
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
