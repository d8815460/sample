//
//  TGAccessoryBrowser.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class TGAccessoryBrowser: NSObject {
    
    // MARK: - Discovering Accessories
    
    var discoveredAccessories: [TGAccessory] = [];
    
    public func getDiscoveredAccessories() -> [TGAccessory] { return discoveredAccessories; }
        
    func startSearchingForNewAccessories() {
        
    }
    
    func stopSearchingForNewAccessories() {
        
    }
    
    // MARK: - Geting and Setting the Delegate
    
    var delegate: TGAccessoryBrowserDelegate?;
    
    public init(accessories: [TGAccessory], browserDelegate: TGAccessoryBrowserDelegate?) {
        discoveredAccessories = accessories;
        delegate = browserDelegate;
    }
    
    public init(browserDelegate: TGAccessoryBrowserDelegate?) {
        delegate = browserDelegate;
    }
    
}