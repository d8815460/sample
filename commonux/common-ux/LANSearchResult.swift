//
//  LANSearchResult.swift
//  CommonUX
//
//  Created by David Lin on 3/28/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class LANSearchResult: NSObject {
    
    public let uid: String?;
    public let ipv4: String?;
    public let ipv6: String?;
    public let name: String?;
    
    public init(uid: String?, ipv4: String?, ipv6: String?, name: String?) {
        self.uid = uid
        self.ipv4 = ipv4;
        self.ipv6 = ipv6;
        self.name = name;
        super.init();
    }
}