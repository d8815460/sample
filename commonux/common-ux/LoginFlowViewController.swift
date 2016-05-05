//
//  LoginFlowViewController.swift
//  CommonUX
//
//  Created by David Lin on 3/23/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit

public typealias LoginFlowCompletionCallback = (error: NSError?, cancelled: Bool, token: AnyObject?) -> Void;
public typealias SimpleAPICallback = (error: NSError?) -> Void;
public typealias LoginCallback = (error: NSError?, token: AnyObject?) -> Void;
public typealias ChainedCallback = (error: NSError?, userInfo: Any?) -> Bool; // return true to break the chain

public class LoginFlowViewController: BaseViewController {

    public static var flowCompletionCallback: LoginFlowCompletionCallback?;
    
    public class func inflateVCNamed(name: String) -> UIViewController {
        let bundle = NSBundle(forClass: LoginFlowViewController.self);
        let sb = UIStoryboard(name: "Login", bundle: bundle)
        return sb.instantiateViewControllerWithIdentifier(name);
    }
}

public protocol IAuthenticator {
    func login(identity: String,
               credential: String,
               callback: LoginCallback?);
    
    func resetPasswordForEmail(email: String,
                               callback: SimpleAPICallback?);
}

public protocol IAccountManager {
    
    func create(identity identity: String,
                credential: String,
                email: String,
                meta: [String: AnyObject]?,
                callback: SimpleAPICallback?);
    
    func resendActivationEmailTo(email: String,
                                 callback: SimpleAPICallback?);
}
