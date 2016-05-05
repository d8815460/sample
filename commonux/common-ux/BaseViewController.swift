//
//  BaseViewController.swift
//  CommonUX
//
//  Created by David Lin on 3/22/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit
import MBProgressHUD

public class BaseViewController: UIViewController {

    public func showProgress(title: String) {
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true);
        hud.mode = .Indeterminate;
        hud.labelText = title;
    }
    
    public func hideProgress() {
        MBProgressHUD.hideHUDForView(self.view, animated: true);
    }
    
    public func showDialog(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .Alert);
        ac.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Button"), style: .Default, handler: nil));
        self.presentViewController(ac, animated: true, completion: nil);
    }
    
    public func showErrorDialog(message: String) {
        showDialog(NSLocalizedString("Error", comment: "Dialog Title"), message: message);
    }
    
    public func showInfoDialog(message: String) {
        showDialog(NSLocalizedString("Info", comment: "Dialog Title"), message: message);
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
