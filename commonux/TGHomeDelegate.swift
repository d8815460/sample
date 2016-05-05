//
//  TGHomeDelegate.swift
//  CommonUX
//
//  Created by David Lin on 4/12/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public protocol TGHomeDelegate {
    // MARK: - Observing Home Cnfiguration
    func homeDidUpdateName(home: TGHome);
    func home(home: TGHome, didAddAccessory accessory: TGAccessory);
    func home(home: TGHome, didUpdateRoom room: TGRoom, forAccessory acccessory: TGAccessory);
    func home(home: TGHome, didRemoveAccessory acccessory: TGAccessory);
    func home(home: TGHome, didAddRoom room: TGRoom);
    func home(home: TGHome, didUpdateNameForRoom room: TGRoom);
    func home(home: TGHome, didAddRoom room: TGRoom, toZone zone: TGZone);
    func home(home: TGHome, didRemoveRoom room: TGRoom, fromZone zone: TGZone);
    func home(home: TGHome, didRemoveRoom room: TGRoom);
    func home(home: TGHome, didAddZone zone: TGZone);
    func home(home: TGHome, didUpdateNameForZone zone: TGZone);
    func home(home: TGHome, didRemoveZone zone: TGZone);
    func home(home: TGHome, didAddUser user: TGUser);
    func home(home: TGHome, didRemoveUser user: TGUser);
    
    // MARK: - Observing TGService Configuration
    func home(home: TGHome, didAddServiceGroup group: TGServiceGroup);
    func home(home: TGHome, didUpdateNameForServiceGroup group: TGServiceGroup);
    func home(home: TGHome, didAddService service: TGService, toServiceGroup group: TGServiceGroup);
    func home(home: TGHome, didRemoveService service: TGService, fromServiceGroup group: TGServiceGroup);
    func home(home: TGHome, didRemoveServiceGroup group: TGServiceGroup);
    
    // MARK: - Observing Action and Trigger Configuration
    func home(home: TGHome, didAddActionSet actionSet: TGActionSet);
    func home(home: TGHome, didUpdateNameForActionSet actionSet: TGActionSet);
    func home(home: TGHome, didUpdateActionsForActionSet actionSet: TGActionSet);
    func home(home: TGHome, didRemoveActionSet actionSet: TGActionSet);
    func home(home: TGHome, didAddTrigger trigger: TGTrigger);
    func home(home: TGHome, didUpdateNameForTrigger trigger: TGTrigger);
    func home(home: TGHome, didUpdateTrigger trigger: TGTrigger);
    func home(home: TGHome, didRemoveTrigger trigger: TGTrigger);
    
    // MARK: - Observing Accessories
    func home(home: TGHome, didEncounterErrorerror: Int, forAccessory  accessory: TGAccessory);
    func home(home: TGHome, didUnblockAccessory accessory: TGAccessory);
    
}
