//
//  TGRoom.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class TGRoom: NSObject {
    
    public override init() {
        super.init();
    }
    
    // MARK: - Managing Rooms
    
    private var RName: String?;
    func updateName(name: String, completion: TGCompletionHandler?) {
        
    }
    
    private var mAccessories: [TGAccessory] = [];
    func getAccessories() -> [TGAccessory] { return mAccessories; }
}