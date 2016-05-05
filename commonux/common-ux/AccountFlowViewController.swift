//
//  AccountFlowViewController.swift
//  CommonUX
//
//  Created by David Lin on 4/6/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import UIKit

public typealias AccountFlowCompletionCallback = (error: NSError?, isConnected: Bool) -> Void;

public class AccountFlowViewController: BaseViewController {

    public static var flowCompletionCallback: AccountFlowCompletionCallback?;
    
    public class func inflateVCNamed(name: String) -> UIViewController {
        let bundle = NSBundle(forClass: LoginFlowViewController.self);
        let sb = UIStoryboard(name: "Account", bundle: bundle)
        return sb.instantiateViewControllerWithIdentifier(name);
    }
}
