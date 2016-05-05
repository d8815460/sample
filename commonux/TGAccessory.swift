//
//  TGAccessory.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class TGAccessory: NSObject {
    
    private let TAG = "TGAccessory";
    
    private var mstrUid: String?;
    
    public func getUid() -> String? { return mstrUid; }
    
    public func setUid(mstrUid: String) { self.mstrUid = mstrUid; }
    
    private var mstrPwd: String?;
    
    // XXX(YC): android code has no explicit default value, but default value of an enum is 0, which maps to .DevDisconnected
    private var mConnStatus: DevConnStatus = .DevDisconnected;
    
    private var mLastIotcErrCode = 0;
    
    private var mnAID = -1;
    
    public func getAID() -> Int { return mnAID; }
    
    // MARK: - Managing TGAccessory Information
    
    private var mnIconType: Int = 0;
    
    public func getIconType() -> Int { return mnIconType; }
    
    private var mstrName: String?;
    public func getName() -> String? { return mstrName; }
    func updateName(name: String, completion: TGCompletionHandler?) {
        
    }
    
    private var mTGRoom: TGRoom?;
    
    func getRoom() -> TGRoom? { return mTGRoom; }
    private var mTGServices: [TGService];
    public func getTGServices() -> [TGService] { return mTGServices; }
    
    var mConnection: Int = 0;
 
    // MARK: - Managing Bridged Accessories
    
    private var mBridged: Bool = false;
    
    // MARK: - Getting and Setting the Delegate
    var delegate: TGAccessoryDelegate?;
    
    public init(AID strAID: String, name strAName: String, iconType nIconType: Int, roomName strRoomName: String, services tgServices: [TGService], connection: Int, bridged: Bool) {
        mTGServices = tgServices;
        mnAID = Int(strAID)!;
        mstrName = strAName;
        mConnection = connection;
        mBridged = bridged;
        mnIconType = nIconType;
        
        super.init();
    }
    
    private var listener: IRegisterSmartDevListener?;
    
    public func connect(time_in_ms: Int) {
        print("\(TAG): UID: \(mstrUid) connect with TimeOut: \(time_in_ms)");
        if (mConnStatus == .DevDisconnected) {
            print("\(TAG): UID: \(mstrUid) connect------>is connected");
        } else if (mConnStatus == .DevConnecting) {
            print("\(TAG): UID: \(mstrUid) connect------>is connecting");
        } else {
            mConnStatus = .DevConnecting;
            mLastIotcErrCode = 0;
            // XXX(YC): forcily unwrapping uid below, should connect crash app if uid not set?
            listener?.connectionStatusChanged(uid: mstrUid!, connectionStatus: mConnStatus, IotcErrCode: mLastIotcErrCode);
        }
    }
}