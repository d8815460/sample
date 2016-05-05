//
//  TGConnectionManager.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class TGConnectionManager: NSObject {
    private let TAG = "TGConnectionManager";
    private var listener: IRegisterSmartDevListener?;
    
    // XXX(YC): Android code uses a pointer to old codes, we don't have time to
    // refactor all those for now.
    //private static var mIotcHACtrl: IOTCHomeAutomationCtrl;
    
    public func connet(time_in_ms: Int) {
        
    }

    // XXX(YC): Android code uses a pointer to old codes, we don't have time to
    // refactor all those for now.
    /*
    public static func getIotcHACtrl() -> IOTCHomeAutomationCtrl {
        if (mIotcHACtrl == nil) {
            mIotcHACtrl = IOTCHomeAutomationCtrl();
        }
        return mIotcHACtrl!;
    }
    */
}