//
//  TGHome.swift
//  CommonUX
//
//  Created by David Lin on 4/12/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class TGHome: NSObject {

    // MARK: Information About the TGHome
    private var mstrHName: String?;
    func getHName() -> String? { return mstrHName; }
    func updateName(hname: String, completion: TGCompletionHandler?) {
        
    }
    private var mPrimary = false;
    func getPrimary() -> Bool { return mPrimary; }
    
    // MARK: Managing Accessories
    private var mAccessories: [TGAccessory] = [];
    func addAccessory(accessory: TGAccessory, compeltion: TGCompletionHandler?) {
        
    }
    func assignAccessoryToRoom(accessory: TGAccessory, room: TGRoom, compeltion: TGCompletionHandler?) {
        
    }
    func removeAccessory(accessory: TGAccessory, compeltion: TGCompletionHandler?) {
        
    }
    func unblockAccessory(accessory: TGAccessory, compeltion: TGCompletionHandler?) {
        
    }
    
    // MARK: - Managing Rooms
    private var mTGRooms: [TGRoom] = [];
    func addRoomWithName(name: String, room: TGRoom, completion: TGCompletionHandler?) {
        
    }
    func removeRoom(room: TGRoom, completion: TGCompletionHandler?) {
        
    }
    
    // MARK: - Managing Zones
    private var mTGZones: [TGZone] = [];
    func addZoneWithName(name: String, zone: TGZone, completion: TGCompletionHandler?) {
        
    }
    func removeZone(zone: TGZone, completion: TGCompletionHandler?) {
        
    }
    
    // MARK: - Managing Services
    func servicesWithTypes(serviceTypes: [String]) -> [TGService] {
        return [];
    }
    var serviceGroups: [TGServiceGroup] = [];
    public func getServiceGroups() -> [TGServiceGroup] { return serviceGroups; }
    func addServiceGroupWithName(serviceGroupName: String, completion: TGCompletionHandler?) {
        
    }
    func removeServiceGroup(group: TGServiceGroup, completion: TGCompletionHandler?) {
    
    }
    
    // MARK: - Managing Actions
    
    // MARK: - Managing Users
    
    // MARK: - Getting and Setting the Delegate
    
    var delegate: TGHomeDelegate?;
    
    // MARK: - Constants
    
    private var listUIDs: [TGUIDINFO] = [];
    public func getListUIDs() -> [TGUIDINFO] { return listUIDs; }
}