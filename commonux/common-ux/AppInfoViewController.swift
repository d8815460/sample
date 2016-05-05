//
//  AppInfoViewController.swift
//  CommonUX
//
//  Created by David Lin on 4/6/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit

public class AppInfoViewController: BaseViewController {
    
    
    @IBOutlet weak var logoImageView: UIImageView?
    @IBOutlet weak var AppVersionLabel: UILabel?
    @IBOutlet weak var IOTCVersionLabel: UILabel?
    @IBOutlet weak var AVAPIVersionLabel: UILabel?
    @IBOutlet weak var firmewareVersionLabel: UILabel?
    @IBOutlet weak var copyrightVersionLabel: UILabel?
    @IBOutlet weak var appTitleLabel: UILabel?
    
    var logoImage: UIImage?;
    var appTitle: String?;
    
    // MARK: - Flow Support
    
    public static func launch(via via: UIViewController, logoImage: UIImage?, appTitle: String?) {
        let vc = getAppInfoViewControllerInstance()
        vc.logoImage = logoImage
        vc.appTitle = appTitle
        let nvc = UINavigationController(rootViewController: vc)
        via.presentViewController(nvc, animated: true, completion: nil)
    }
    
    public class func getAppInfoViewControllerInstance() -> AppInfoViewController {
        let bundle = NSBundle(forClass: AppInfoViewController.self);
        return AppInfoViewController(nibName: "AppInfoViewController", bundle: bundle);
    }
    
    // MARK: - Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logoImageView?.image = UIImage(named: "logo.png")
        self.appTitleLabel?.text = self.appTitle
        self.AppVersionLabel?.text = "Version 1.0.0"
        self.IOTCVersionLabel?.text = "IOTCAPIs 1.0.0.0"
        self.AVAPIVersionLabel?.text = "AVAPIs 1.0.0.0"
        self.firmewareVersionLabel?.text = "Firmeware version 1.0.0.0"
        self.copyrightVersionLabel?.text = "Copyright © 2016. All rights reserved."
        
        self.navigationItem.title = NSLocalizedString("About", comment: "View Controller Title")
    }

}
