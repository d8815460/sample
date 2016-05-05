//
//  DevConnStatus.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public enum DevConnStatus: Int {
    case DevConntPwdError = -2
    case DevConntError = -1
    case DevDisconnected = 0
    case DevConnecting = 1
    case DevConnected = 2
}
