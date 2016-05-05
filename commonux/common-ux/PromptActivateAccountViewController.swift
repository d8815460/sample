//
//  PromptActivateAccountViewController.swift
//  CommonUX
//
//  Created by David Lin on 3/22/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit
import Parse

public class PromptActivateAccountViewController: LoginFlowViewController {
    
    public var email: String = "";
    public var accountManager: IAccountManager!
    @IBOutlet public weak var whiteBackground: UIView!
    @IBOutlet public weak var whiteBoardTitle: UILabel!
    @IBOutlet public weak var whiteBoardContentLabel: UILabel!
    @IBOutlet public weak var whiteBoardSecondContentLabel: UILabel!
    @IBOutlet public weak var resendButton: UIButton!

    // MARK: - Life Cycle
    
    override public func viewDidLoad() {
        super.viewDidLoad();
        
        self.view.backgroundColor = DefauleTheme.MainColor
        self.whiteBackground.backgroundColor = DefauleTheme.loginWhiteColor
        
        self.whiteBoardTitle.text = NSLocalizedString("Account Created!", comment: "Account Created")
        self.whiteBoardContentLabel.text = NSLocalizedString("Please confirm your email address to activate your account.", comment: "Account Created")
        self.whiteBoardSecondContentLabel.text = NSLocalizedString("Didn't receive a verification email?", comment: "Account Created")
        
        self.resendButton.setTitle(NSLocalizedString("Resend Email", comment: "Account Created"), forState: .Normal)
        self.resendButton.setTitle(NSLocalizedString("Resend Email", comment: "Account Created"), forState: .Highlighted)
    }
    
    
    // MARK: - Resend Email support
    
    @IBAction func doResendActivationEmail() {
//        self.showProgress(NSLocalizedString("Processing...", comment: "Progress"));
        resendActivationEmailTo(email) { error in
            PFUser.requestPasswordResetForEmailInBackground(PFUser.currentUser()!.objectForKey("username") as! String, block: { (bool, error) in
                
            })
//            self.hideProgress()
            return false
        }
    }
    
    public func resendActivationEmailTo(email: String, cb: ChainedCallback?) {
        
        self.onResendActivationEmailSuccess()
        
        //這個要串 email 驗證的API
//        accountManager.resendActivationEmailTo(email) { error in
//            if cb != nil && cb!(error: error, userInfo: nil) {
//                return;
//            }
//            
//            if let error = error {
//                self.onResendActivationEmailError(error);
//            } else {
//                self.onResendActivationEmailSuccess();
//            }
//        }
    }
    
    public func onResendActivationEmailError(error: NSError) {
        showErrorDialog(error.localizedDescription);
    }
    
    public func onResendActivationEmailSuccess() {
        PFAlertView.showAlertWithTitle(nil, message: NSLocalizedString("We will send you another email soon!", comment: "Dialog message"), cancelButtonTitle: NSLocalizedString("OK", comment: "Dialog message"), otherButtonTitles: nil) { (selectedOtherButtonIndex) in
            // otherButton, first = 0, second = 1
            self.dismissViewControllerAnimated(true, completion: { 
                
            })
        }
    }
    
    // MARK: - Segue to Root View Controller Support
    
    @IBAction func doJumpToSplash() {
        navigationController?.popToRootViewControllerAnimated(true);
    }
}
