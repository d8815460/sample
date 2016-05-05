//
//  ResetPasswordViewController.swift
//  CommonUX
//
//  Created by David Lin on 3/23/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit
import Parse

public class ResetPasswordViewController: LoginFlowViewController {
    
    @IBOutlet public weak var whiteBackground: UIView!
    @IBOutlet public weak var whiteBoardTitle: UILabel!
    @IBOutlet public weak var whiteBoardContentLabel: UILabel!
    @IBOutlet public weak var inputBackgroundView: UIView!
    @IBOutlet public weak var emailIcon: UIImageView!
    @IBOutlet public weak var emailTextField: UITextField!
    @IBOutlet public weak var resetButton: UIButton!
    
    
    public var authenticator: IAuthenticator!
    
    // Mark - Life cycle
    public override func viewDidLoad() {
        
        self.view.backgroundColor = DefauleTheme.MainColor
        self.inputBackgroundView.backgroundColor = DefauleTheme.MainColor
        self.whiteBackground.backgroundColor = DefauleTheme.loginWhiteColor
        self.whiteBoardTitle.textColor = DefauleTheme.MainColor
        self.whiteBoardTitle.text = NSLocalizedString("Dont Worry!", comment: "Reset password")
        self.whiteBoardContentLabel.text = NSLocalizedString("Enter your email address to request a password reset.", comment: "Reset password")
        self.resetButton.setTitle(NSLocalizedString("Reset Password", comment: "Reset password"), forState: .Normal)
        self.emailTextField?.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Email", comment: "Reset password"), attributes: [NSForegroundColorAttributeName: DefauleTheme.textPlaceholderColor])
        self.emailTextField?.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Email", comment: "Reset password"), attributes: [NSForegroundColorAttributeName: DefauleTheme.textPlaceholderColor])
        self.title = NSLocalizedString("Reset Password", comment: "Reset password")
    }
    
    @IBAction func doResetPassword() {
        if emailTextField!.text?.characters.count == 0 {
            onResetPasswordError(NSError(domain: "CommonUX", code: 0, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("Please enter your email", comment: "Error message")]));
            return;
        }
        
        showProgress(NSLocalizedString("Processing...", comment: "Progress Title"))
        resetPasswordForEmail(emailTextField!.text!) { error in
            self.hideProgress();
            return false;
        }
    }
    
    public func resetPasswordForEmail(email: String, callback cb: ChainedCallback?) {
            PFUser.requestPasswordResetForEmailInBackground(email, block: { (bool, error) in
                self.hideProgress()
                if error != nil {
                    let errorString = error?.userInfo["error"] as! String
                    PFAlertView.showAlertWithTitle(nil, message: NSLocalizedString(errorString, comment: "ResetPassword"), cancelButtonTitle: NSLocalizedString("OK", comment: "ResetPassword"), otherButtonTitles: nil, completion: { (selectedOtherButtonIndex) in
                        // otherButton, first = 0, second = 1
                        print("button pressed\(selectedOtherButtonIndex)")
                    })
                } else {
                    PFAlertView.showAlertWithTitle(nil, message: NSLocalizedString("An Email has been sent to your account to verity the password reset request.", comment: "ResetPassword"), cancelButtonTitle: NSLocalizedString("Login", comment: "ResetPassword"), otherButtonTitles: nil, completion: { (selectedOtherButtonIndex) in
                        // otherButton, first = 0, second = 1
                        print("button pressed\(selectedOtherButtonIndex)")
                        //回到A1頁面
                        self.gotoSplashViewController()
                    })
                }
            })
        }
//        authenticator.resetPasswordForEmail(email) { error in
//            if cb != nil && cb!(error: error, userInfo: nil) {
//                return;
//            }
//            if let error = error {
//                self.onResetPasswordError(error);
//            } else {
//                self.onResetPasswordSuccess();
//            }
//        }
//    }
    
    public func onResetPasswordError(error: NSError) {
        let ac = UIAlertController(title: NSLocalizedString("Success", comment: "Dialog Title"), message: NSLocalizedString("An email has been sent to your account to verify the password reset request", comment: "Dialog message"), preferredStyle: .Alert);
        let callaction = UIAlertAction(title: NSLocalizedString("Login", comment: "Button"), style: .Default, handler: {
            (action:UIAlertAction!) -> Void in
            self.gotoSplashViewController()
        })
        ac.addAction(callaction)
        self.presentViewController(ac, animated: true, completion: nil);
        
        /* 還沒有API，暫時改成上面的模擬 */
//        showErrorDialog(error.localizedDescription);
    }
    
    public func gotoSplashViewController() {
        let nvc = self.navigationController;
        nvc?.popToRootViewControllerAnimated(false)
    }
    
    public func onResetPasswordSuccess() {
        self.showDialog(NSLocalizedString("Success", comment: "Dialog Title"), message: NSLocalizedString("An email has been sent to your account to verify the password reset request", comment: "Dialog message"));
    }
}
