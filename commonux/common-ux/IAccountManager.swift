//
//  IAccountCreator.swift
//  CommonUX
//
//  Created by David Lin on 3/23/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public typealias CompletionCallback = (error: NSError?) -> Void

public protocol IAccountManager {
    
    func create(identity: String,
                credential: String,
                email: String,
                meta: [String: AnyObject]?,
                callback: CompletionCallback?);
    
    func resendActivationEmail(email: String,
                               callback: CompletionCallback?);
}
