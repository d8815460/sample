//
//  KANavigationController.swift
//  SmartHome
//
//  Created by 駿逸 陳 on 2016/4/18.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit
import CommonUX
import Parse

class KANavigationController: UINavigationController {

    private var ipHubsSelectedObserver:     NSObjectProtocol?
    private var ipCameraSelectedObserver:   NSObjectProtocol?
    private var accountSelectedObserver:    NSObjectProtocol?
    private var helpSelectedObserver:       NSObjectProtocol?
    private var aboutSelectedObserver:      NSObjectProtocol?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        addObservers()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        removeObservers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func addObservers() {
        let center = NSNotificationCenter.defaultCenter()
        
        // Do any additional setup after loading the view.
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // if bundle is nil the main bundle will be used
        
        
        ipHubsSelectedObserver = center.addObserverForName(kTGLeftMenuDidSelectedIPHubs, object: nil, queue: nil, usingBlock: { (notification: NSNotification!) in
            //ipHubs主頁
            print("ipHubsSelected index \(notification.object!)")
            let dashboard: TGDashboardViewController = storyboard.instantiateViewControllerWithIdentifier("dashboard") as! TGDashboardViewController
            self.setViewControllers([dashboard], animated: false)
            self.viewControllers.first?.title = "IP Hub_\(notification.object!)"
            
        })
        
        ipCameraSelectedObserver = center.addObserverForName(kTGLeftMenuDidSelectedCamera, object: nil, queue: nil, usingBlock: { (notification: NSNotification!) in
            //ipCamera主頁
            print("ipCameraSelected")
            
            // 確認是 AlertController 的bug
//            let quetion = UIAlertController(title: nil, message: NSLocalizedString("You have't installed <IP CAM app>, go to App Store and install now?", comment: "Left Menu"), preferredStyle: .Alert)
//            
//            
//            let laterAction = UIAlertAction(title: NSLocalizedString("Later", comment: "Left Menu"),style: .Default, handler:{
//                (action:UIAlertAction!) -> Void in
//                print("Later")
//            })
//            
//            let installAction = UIAlertAction(title: NSLocalizedString("Install", comment: "Left Menu"),style: .Default, handler:{
//                (action:UIAlertAction!) -> Void in
//                print("Install")
//            })
//            
//            quetion.addAction(laterAction)
//            quetion.addAction(installAction)
//            
//            self.presentViewController(quetion, animated: false, completion: nil)
            
            // 使用PFAlertView 會讓 NavigationBar上的按鈕 跑掉，不知道為什麼。
            PFAlertView.showAlertWithTitle(nil, message: NSLocalizedString("You have't installed <IP CAM app>, go to App Store and install now?", comment: "Left Menu"), cancelButtonTitle: NSLocalizedString("Later", comment: "Left Menu"), otherButtonTitles: [NSLocalizedString("Install", comment: "Left Menu")], completion: { (selectedOtherButtonIndex) in
                // otherButton, first = 0, second = 1
                print("button pressed\(selectedOtherButtonIndex)")
                
                if selectedOtherButtonIndex == 0 {
                    let itunesURL:NSURL = NSURL(string: "itms-apps://itunes.apple.com/app/992808592")!
                    UIApplication.sharedApplication().openURL(itunesURL)
                }
            })
        })
        
        accountSelectedObserver = center.addObserverForName(kTGLeftMenuDidSelectedAccount, object: nil, queue: nil, usingBlock: { (notification: NSNotification!) in
            //account主頁
            print("accountSelected")
            let frameworkBundle = NSBundle(identifier: kTGCommonUXBundleIdentifierKey)
            let storyboard = UIStoryboard(name: "Account", bundle: frameworkBundle)
            
            let vc: AccountFlowViewController = storyboard.instantiateViewControllerWithIdentifier("AccountManager") as! AccountFlowViewController
            self.setViewControllers([vc], animated: false)
        })
        
        helpSelectedObserver = center.addObserverForName(kTGLeftMenuDidSelectedHelp, object: nil, queue: nil, usingBlock: { (notification: NSNotification!) in
            //help主頁
            print("helpSelected")
        })
        
        aboutSelectedObserver = center.addObserverForName(kTGLeftMenuDidSelectedAbout, object: nil, queue: nil, usingBlock: { (notification: NSNotification!) in
            //about主頁
            print("aboutSelected")
            let frameworkBundle = NSBundle(identifier: kTGCommonUXBundleIdentifierKey)
            let storyboard = UIStoryboard(name: "About", bundle: frameworkBundle)
            let about: AppInfoViewController = storyboard.instantiateViewControllerWithIdentifier("about") as! AppInfoViewController
            self.setViewControllers([about], animated: false)
        })
    }
    
    private func removeObservers() {
        let center = NSNotificationCenter.defaultCenter()
        
        if ipHubsSelectedObserver != nil {
            center.removeObserver(ipHubsSelectedObserver!)
        }
        if ipCameraSelectedObserver != nil {
            center.removeObserver(ipCameraSelectedObserver!)
        }
        if accountSelectedObserver != nil {
            center.removeObserver(accountSelectedObserver!)
        }
        if helpSelectedObserver != nil {
            center.removeObserver(helpSelectedObserver!)
        }
        if aboutSelectedObserver != nil {
            center.removeObserver(aboutSelectedObserver!)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
