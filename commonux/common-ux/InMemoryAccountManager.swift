//
//  InMemoryAuthenticator.swift
//  common-ux
//
//  Created by David Lin on 3/22/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class InMemoryAccountManager: IAuthenticator, IAccountManager {
    
    public var credentials: [String: String] = [:] // a Username => password mapping
    
    public init() {}
    
    private func MakeError(code: NSInteger, msg: String) -> NSError {
        return NSError(domain: "InMemoryAuthenticationService", code: code, userInfo: [NSLocalizedDescriptionKey: msg])
    }
    
    public func login(identity: String,
                      credential: String,
                      callback: LoginCallback?) {
        // guard against some simple error input
        if (identity.characters.count == 0) {
            callback?(error: MakeError(125, msg: "Please provide username"), token: nil);
        } else if (credential.characters.count == 0) {
            callback?(error: MakeError(124, msg: "Please provide password"), token: nil);
        } else if (credentials[identity] != credential) {
            callback?(error: MakeError(123, msg: "Failed to login"), token: nil);
        } else {
            callback?(error: nil, token: identity);
        }
    }
    
    public func resetPasswordForEmail(email: String, callback: ((error: NSError?) -> Void)? = nil) {
        
        if (email.characters.count == 0) {
            callback?(error: MakeError(125, msg: "Please provide email"));
            return;
        }
        
        delay(1) {
            callback?(error: nil);
        }
    }

    
    public func create(identity identity: String,
                                credential: String,
                                email: String,
                                meta: [String: AnyObject]?,
                                callback cb: SimpleAPICallback?) {
        
        // guard against some simple error input
        if (identity.characters.count == 0) {
            cb?(error: MakeError(125, msg: "Please provide username"));
        } else if (email.characters.count == 0) {
            cb?(error: MakeError(125, msg: "Please provide email"));
        } else if (credential.characters.count == 0) {
            cb?(error: MakeError(124, msg: "Please provide password"));
        } else if (credentials[identity] != nil) {
            cb?(error: MakeError(126, msg: "User already exists"));
        } else {
            credentials[identity] = credential;
            cb?(error: nil);
        }
    }

    
    public func resendActivationEmailTo(email: String, callback cb: SimpleAPICallback?) {
        
        if (email.characters.count == 0) {
            cb?(error: MakeError(125, msg: "Please provide email"));
            return;
        }
        
        delay(1) {
            cb?(error: nil);
        }
    }
}