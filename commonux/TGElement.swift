//
//  TGElement.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class TGElement: NSObject {
    
    // MARK: - Information About a Characteristic
    
    private var mstrElementType: String?;
    public func getElementType() -> String? { return mstrElementType; }
    private var mTGService: TGService?;
    private var mProperties: [String]?;
    private var mMetaData: TGElementMetaData?;
    func getMetaData() -> TGElementMetaData? { return mMetaData; }
    
    // MARK: - Receiving Notifications
    
    func enableNotification(enable: Bool, completion: TGCompletionHandler?) {
        
    }
    private var mNotificationEnabled: Any?;
    func getNotificationEnabled() -> Any? { return mNotificationEnabled; }
    
    // MARK: - Managing Values
    
    private var mValues: [TGElementValue] = [];
    func readValueWithCompletionHandler(completion: TGCompletionHandler?) {
        
    }
    func writeValue(value: Any, completion: TGCompletionHandler?) {
        
    }
    func writeValue(value: Any, completion: (() -> Void)?) {
        completion?();
    }
    func updateAuthorizationData(data: Any, completion: TGCompletionHandler?) {
        
    }
    
    // MARK: - Constants
    
    // XXX(YC): Android code uses a function named "init", which has special meaning in 
    // iOS, so in iOS, we use "bootstrap" instead of "init".
    public func bootstrap() {
        
    }
    
    public func bootstrapWithDb(elementType strElementType: String, metadata: TGElementMetaData?, notificationEnabled: Any?, values: [TGElementValue]) {
        mstrElementType = strElementType;
        mTGService = nil;
        mProperties = nil;
        mMetaData = metadata;
        mNotificationEnabled = notificationEnabled;
        mValues = values;
    }
}