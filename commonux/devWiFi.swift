//
//  File.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class devWiFi: NSObject {
    public var mSSID: String?;
    public var mSecurity: String?
    public var nSignal = 0;
    public var nWhich = 0;
}

func ==(left: devWiFi, right: devWiFi) -> Bool {
    return left.mSSID == right.mSSID && left.mSecurity == right.mSecurity;
}

func !=(left: devWiFi, right: devWiFi) -> Bool {
    return !(left == right)
}