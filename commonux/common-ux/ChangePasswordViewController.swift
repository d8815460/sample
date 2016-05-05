//
//  ChangePasswordViewController.swift
//  CommonUX
//
//  Created by David Lin on 4/6/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit

public class ChangePasswordViewController: AccountFlowViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!;
    var oldPasswordTextField: UITextField?;
    var newPasswordTextField: UITextField?;
    var confirmNewPasswordTextField: UITextField?;
    
    // MARK: - UITableViewDataSource
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4; // Old Password, New Password, Confirm Password, Update
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1; // 1 row for each section
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section;
        if section < 3 {
            let c = tableView.dequeueReusableCellWithIdentifier("editCell")!;
            let textField = c.viewWithTag(1) as? UITextField;
            if section == 0 { self.oldPasswordTextField = textField }
            if section == 1 { self.newPasswordTextField = textField }
            if section == 2 { self.confirmNewPasswordTextField = textField }
            textField?.placeholder = NSLocalizedString("Password", comment: "Placeholder");
            return c;
        } else if section == 3 {
            let c = tableView.dequeueReusableCellWithIdentifier("updateCell")!;
            let label = c.viewWithTag(1) as? UILabel;
            label?.text = NSLocalizedString("Update", comment: "Cell Title");
            return c;
        }
        
        fatalError("Invalid indexpath \(indexPath)) for ChangePassword");
    }
    
    // MARK: - UITableViewDelegate
    
    public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let titles: [String?] = [
            NSLocalizedString("Old Password", comment: "Section Title"),
            NSLocalizedString("New Password", comment: "Section Title"),
            NSLocalizedString("Confirm New Password", comment: "Section Title"),
            nil]
        return titles[section];
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        if indexPath.section == 3 {
            if oldPasswordTextField?.text?.characters.count == 0 {
                showErrorDialog(NSLocalizedString("Please enter your old password", comment: "Error Message"));
                return;
            }
            
            if newPasswordTextField?.text?.characters.count == 0 {
                showErrorDialog(NSLocalizedString("Please enter your new password", comment: "Error Message"));
                return;
            }
            
            if newPasswordTextField?.text != confirmNewPasswordTextField?.text {
                showErrorDialog(NSLocalizedString("Passwords do not match", comment: "Error Message"));
                return;
            }
            
            showProgress(NSLocalizedString("Processing...", comment: "Progress"));
            delay(1) {
                self.hideProgress();
                self.showInfoDialog(NSLocalizedString("Your password has been updated", comment: "Alert Message"));
            }
        }
    }
    
    // MARK: - Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
