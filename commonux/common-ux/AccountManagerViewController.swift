//
//  AccountManagerViewController.swift
//  CommonUX
//
//  Created by David Lin on 4/6/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit
import Parse

public class AccountManagerViewController: AccountFlowViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak private var tableView: UITableView!;
    
    var profileInfos: [(String, String)] = [];
    var isConnected: Bool = true;
    
    // MARK: - UITableViewDataSource
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2; // profile + logout
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1 + profileInfos.count; // email + change password + rest
        } else if section == 1 {
            return 1; // logout
        }
        return 0; // be exhaustive
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row;
        if indexPath.section == 0 {
            let cnt = self.tableView(tableView, numberOfRowsInSection: 0)
            if row == cnt - 1 {
                let c = tableView.dequeueReusableCellWithIdentifier("rightCaretCell")!;
                c.textLabel?.text = NSLocalizedString("Change Password", comment: "Cell title");
                return c;
            } else if row < cnt - 1 {
                let info = profileInfos[row];
                let c = tableView.dequeueReusableCellWithIdentifier("rightDetailCell")!;
                c.textLabel?.text = info.0;
                c.detailTextLabel?.text = info.1;
                return c;
            }
        } else if indexPath.section == 1 {
            let c = tableView.dequeueReusableCellWithIdentifier("logoutCell")!;
            let label = c.viewWithTag(1) as? UILabel;
            label?.text = NSLocalizedString("Log Out", comment: "Cell title");
            return c;
        }

        fatalError("Invalid indexpath \(indexPath)) for AccountManager");
    }
    
    // MARK: - UITableViewDelegate
    
    public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return NSLocalizedString("Profile", comment: "Section Title")
        }
        return nil
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cnt = self.tableView(tableView, numberOfRowsInSection: 0)
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        if indexPath.section == 0 && indexPath.row == cnt - 1 {
            let vc = AccountManagerViewController.getChangePasswordViewControllerInstance()
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 0 {
            // perform logout, and exit flow
            let ac = UIAlertController(title: NSLocalizedString("Confirm", comment: "Alert Title"),
                                       message: NSLocalizedString("Do you want to log out?", comment: "Alert Message"),
                                       preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Button"), style: .Default) { act in
                PFUser.logOutInBackgroundWithBlock({ (error) in
                    if error != nil {
                        let errorString = error?.userInfo["error"] as! String
                        PFAlertView.showAlertWithTitle(nil, message: NSLocalizedString(errorString, comment: "AccountManager"), cancelButtonTitle: NSLocalizedString("OK", comment: "AccountManager"), otherButtonTitles: nil, completion: { (selectedOtherButtonIndex) in
                            // otherButton, first = 0, second = 1
                        })
                    } else {
                        self.viewDidAppear(true)
                    }
                })
                
                
//                self.showProgress(NSLocalizedString("Logging Out...", comment: "Progress"))
//                delay(1) {
//                    self.hideProgress()
//                    self.isConnected = false
//                    self.doClose()
//                }
            });
            
            ac.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Button"), style: .Cancel) { act in });
            self.presentViewController(ac, animated: true) {};
        }
    }
    
    @IBAction public func doClose() {
        AccountFlowViewController.flowCompletionCallback?(error: nil, isConnected: isConnected);
        self.navigationController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil);
    }
    
    // MARK: - Subclass Customisable
    
    // MARK: - Flow Support
    
    public static func launchForResult(via via: UIViewController, withProfileInfos profileInfos: [(String, String)]?, cb: AccountFlowCompletionCallback?) {
        let vc = gtAccountManagerViewControllerInstance();
        if let profileInfos = profileInfos {
            vc.profileInfos = profileInfos;
        }
        AccountFlowViewController.flowCompletionCallback = cb;
        let nvc = UINavigationController(rootViewController: vc);
        via.presentViewController(nvc, animated: true, completion: nil);
    }
    
    public class func getChangePasswordViewControllerInstance() -> ChangePasswordViewController {
        return inflateVCNamed("ChangePassword") as! ChangePasswordViewController;
    }
    
    public class func gtAccountManagerViewControllerInstance() -> AccountManagerViewController {
        return inflateVCNamed("AccountManager") as! AccountManagerViewController;
    }

    // MARK: - Life Cycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        /* 使用者還沒登入，使用 framework 裡面的 Login storybaord */
        if PFUser.currentUser() == nil {
            let frameworkBundle = NSBundle(identifier: "com.tutk.commonux")
            let storyboard = UIStoryboard(name: "Login", bundle: frameworkBundle)
            self.presentViewController(storyboard.instantiateInitialViewController()!, animated: true) {
                
            }
        }
    }
}
