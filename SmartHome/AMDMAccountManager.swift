//
//  AMDMAccountManager.swift
//  SmartHome
//
//  Created by David Lin on 3/23/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit
import CommonUX

class AMDMAccountManager: IAuthenticator, IAccountManager {
    func create(identity: String, email: String, credential: String, callback: ((error: NSError?) -> Void)?) {
        fatalError("Not implemented");
    }
    
    func login(identity: String, _ credential: String, callback: ((error: NSError?, token: AnyObject?) -> Void)?) {
        fatalError("Not implemented");
    }
    
    func resendActivationEmailTo(email: String, callback: ((error: NSError?) -> Void)?) {
        fatalError("Not implemented");
    }
    
    func resetPasswordForEmail(email: String, callback: ((error: NSError?) -> Void)?) {
        fatalError("Not implemented");
    }
}
