//
//  TGAccessoryDelegate.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public protocol TGAccessoryDelegate {
    func accessoryDidUpdateName(accessory: TGAccessory);
    func accessoryDidUpdateReachability(accessory: TGAccessory);
    func accessoryDidUpdateServices(accessory: TGAccessory);
    func accessory(accessory: TGAccessory, didUpdateNameForService service: TGService);
    func accessory(accessory: TGAccessory, service: TGService, didUpdateValueForCharacteristic element: TGElement);
    func accessory(accessory: TGAccessory, didUpdateAssociatedServiceTypeForService service: TGService);
}