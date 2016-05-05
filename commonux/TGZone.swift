//
//  TGZone.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class TGZone: NSObject {
    
    // MARK: Managing Zones
    
    private var ZName: String?;
    func getZName() -> String? { return ZName; }
    func updateName(zname: String, completiong: TGCompletionHandler?) {
        
    }
    private var mTGRooms: [TGRoom] = [];
    func getRooms() -> [TGRoom] { return mTGRooms; }
    func addRoom(room: TGRoom, completion: TGCompletionHandler?) {
        
    }
    func removeRoom(room: TGRoom, completion: TGCompletionHandler?) {
        
    }
}