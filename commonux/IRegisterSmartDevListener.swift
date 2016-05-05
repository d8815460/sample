//
//  IRegisterSmartDevListener.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public protocol IRegisterSmartDevListener {
    func connectionStatusChanged(uid strUid: String, connectionStatus devConnStatus: DevConnStatus, IotcErrCode nIotcErrCode: Int);
    func didCompleteReadData(uid strUid: String, sessionID: Int, channelIdx: Int, readLength read_length: Int, val: AnyObject?);
    func didCompleteWriteData(RDTWriteReturnValue nRDT_WriteRetVal: Int, uid strUid: String, sessionID: Int, channelIdx: Int, readLength read_length: Int, val: AnyObject?);
    func didResponseQueryDevicePassword(uid StrUid: String, passResponse usPassResponse: UInt16);
}
