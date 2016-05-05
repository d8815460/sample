//
//  ViewController.swift
//  vetch-smarthome
//
//  Created by David Lin on 3/22/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit
import CommonUX;

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!;
    var userLoggedIn = false;
    
    let am = CommonUX.InMemoryAccountManager();

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        if (!userLoggedIn) {
            MyLoginViewController.launchForResultVia(self, authenticator: nil) { error, cancelled, token in
                print("Login completed \(error) \(cancelled) \(token)");
                self.userLoggedIn = token != nil;
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        am.create(identity: "david", credential: "1234", email: "david.lin@quma.me", meta: nil, callback: nil);
        
        let nc = NSNotificationCenter.defaultCenter();
        nc.addObserver(self, selector: #selector(ViewController.reachabilityChanged(_:)), name: ConnectionManager.NOTIF_REACHABLE_BY_WIFI, object: nil);
        nc.addObserver(self, selector: #selector(ViewController.reachabilityChanged(_:)), name: ConnectionManager.NOTIF_INTERNET_UNREACHABLE, object: nil);
    }
    
    func reachabilityChanged(notif: NSNotification) {
        print(notif.name);
    }
    
    @IBAction func doLogout() {
        userLoggedIn = false;
        MyLoginViewController.launchForResultVia(self, authenticator: nil) { error, cancelled, token in
            print("Login completed \(error) \(cancelled) \(token)");
            self.userLoggedIn = token != nil;
        }
    }
    
    @IBAction func doLANSearch() {
        MyLANSearchViewController.launchForResult(via: self) { error, result in
            if error != nil {
                print("Error occured \(error!.localizedDescription)");
            } else if result != nil {
                print("Selected LAN uid \(result!.uid!)")
            } else {
                print("No LAN Selected");
            }
        }
    }
}

