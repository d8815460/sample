//
//  TGServiceGroup.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class TGServiceGroup: NSObject {
    
    // MARK: Managing Service Groups
    
    var name: String?;
    
    func updateName(name: String, completion: TGCompletionHandler?) {
        
    }
    
    var services: [TGService] = [];
    
    public func getServices() -> [TGService] { return services; }
    
    func addService(service: TGService, completion: TGCompletionHandler?) {
        
    }
    
    func removeService(service: TGService, completion: TGCompletionHandler?) {
        
    }
}