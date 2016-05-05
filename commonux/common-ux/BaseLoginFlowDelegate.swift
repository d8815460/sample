//
//  BaseLoginFlowDelegate.swift
//  CommonUX
//
//  Created by David Lin on 3/23/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class BaseLoginFlowDelegate: NSObject, LoginFlowDelegate {
    public func getAuthenticator() -> IAuthenticator {
        fatalError("Subclass should override and returns a valid authenticator");
    }
    
    public func getAccountManager() -> IAccountManager? {
        return nil;
    }
    
    public func getTermOfServiceUrl() -> String? {
        return nil;
    }
    
    public func willTransitionFromStep(
        step: LoginFlowStep,
        withOldViewController viewController: LoginFlowViewController?,
        toStep newStep: LoginFlowStep,
        withNewViewController newViewController: LoginFlowViewController?) -> LoginFlowViewController? {
            return newViewController;
    }
    
    public func didLoginWithIdentity(identity: String, andToken token: AnyObject) {}
    
    public func didFailToLoginWithError(error: NSError) -> Bool {
        return false;
    }
}