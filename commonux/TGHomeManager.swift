//
//  TGHomeManager.swift
//  CommonUX
//
//  Created by David Lin on 4/12/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class TGHomeManager: NSObject {
    
    // MARK: Managing Homes
    var primaryHome: TGHome?
    public func getPrimaryHome() -> TGHome? { return primaryHome; }
    var homes: [TGHome] = [];
    func addHomeWithName(name: String, completion: TGCompletionHandler?) {
        
    }
    func removeHome(home: TGHome, completion: TGCompletionHandler?) {
        
    }
    func updatePrimaryHome(home: TGHome) {
        
    }
    
    // MARK: - Setting and Getting the Delegate
    var delegate: TGHomeManagerDelegate?
    
    private var connectionManager: TGConnectionManager?;
    
    // XXX(YC): Not yet refactored
    /*
    private static instance: IOTCHomeAutomationCtrl?;
    
    public static func getInstance() -> IOTCHomeAutomationCtrl? {
        if (instance == nil) {
            instance = IOTCHomeAutomationCtrl();
        }
        return instance;
    }
     */
}