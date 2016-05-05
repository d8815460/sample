//
//  TGActionSet.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class TGActionSet: NSObject {
    
    // MARK: - Managing Action Sets
    
    var name: String?;
    
    func updateName(name: String, completion: TGCompletionHandler?) {
        
    }
    
    var actions = Set<TGAction>();
    func addAction(action: TGAction, completion: TGCompletionHandler?) {
        
    }
    
    func removeAction(action: TGAction, completion: TGCompletionHandler?) {
        
    }
    
    var executing = false;
}