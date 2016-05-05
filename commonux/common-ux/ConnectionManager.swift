//
//  ConnectionManager.swift
//  CommonUX
//
//  Created by David Lin on 3/28/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class ConnectionManager: NSObject {
    public static let NOTIF_REACHABLE_BY_WIFI = "NOTIF_REACHABLE_BY_WIFI";
    public static let NOTIF_REACHABLE_BY_CELLULAR = "NOTIF_REACHABLE_BY_CELLULAR";
    public static let NOTIF_INTERNET_UNREACHABLE = "NOTIF_INTERNET_UNREACHABLE";

    // IOTC connectivity
    public static let NOTIF_IOTC_UID_REACHABLE_BY_LAN = "NOTIF_UID_REACHABLE_BY_LAN";
    public static let NOTIF_IOTC_UID_REACHABLE_BY_INTERNET = "NOTIF_UID_REACHABLE_BY_INTERNET";
    public static let NOTIF_IOTC_UID_UNREACHABLE = "NOTIF_UID_UNREACHABLE";
    
    // RDT connectivity
    public static let NOTIF_RDT_UID_REACHABLE_BY_LAN =
        "NOTIF_RDT_UID_REACHABLE_BY_LAN";
    public static let NOTIF_RDT_UID_REACHABLE_BY_INTERNET =
        "NOTIF_RDT_UID_REACHABLE_BY_LAN";
    public static let NOTIF_RDT_UID_UNREACHABLE =
        "NOTIF_RDT_UID_REACHABLE_BY_LAN";
    
    // Accessory connectivity
    public static let NOTIF_HOME_AID_REACHABLE_BY_LAN =
        "NOTIF_HOME_AID_REACHABLE_BY_LAN";
    public static let NOTIF_HOME_AID_REACHABLE_BY_INTERNET =
        "NOTIF_HOME_AID_REACHABLE_BY_INTERNET";
    public static let NOTIF_HOME_AID_UNREACHABLE =
        "NOTIF_HOME_AID_UNREACHABLE";
    
    public static let sharedInstance = ConnectionManager();
    
    private let reachability: Reachability;
    
    private override init() {
        let nc = NSNotificationCenter.defaultCenter();
        reachability = try! Reachability.reachabilityForInternetConnection();
        reachability.whenReachable = { reachability in
            dispatch_async(dispatch_get_main_queue()) {
                if reachability.isReachableViaWiFi() {
                    nc.postNotificationName(ConnectionManager.NOTIF_REACHABLE_BY_WIFI, object: nil);
                } else {
                    nc.postNotificationName(ConnectionManager.NOTIF_REACHABLE_BY_CELLULAR, object: nil);
                }
            }
        }
        reachability.whenUnreachable = { reachability in
            dispatch_async(dispatch_get_main_queue()) {
                nc.postNotificationName(ConnectionManager.NOTIF_INTERNET_UNREACHABLE, object: nil);
            }
        }
        try! reachability.startNotifier();
        super.init();
    }
    
    public var isInternetReachableViaWifi: Bool {
        get {
            return reachability.isReachableViaWiFi();
        }
    }
    
    public var isInternetReachableViaCelluar: Bool {
        get {
            return reachability.isReachableViaWWAN();
        }
    }
    
    public var isInternetReachable: Bool {
        get {
            return reachability.isReachable();
        }
    }
    
    public func isUidReachableViaLAN(uid: String)-> Bool {
        return true;
    }
    
    public func isUidReachableViaInternet(uid: String) -> Bool {
        return true;
    }
}