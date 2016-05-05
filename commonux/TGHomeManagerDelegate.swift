//
//  TGHomeManagerDelegate.swift
//  CommonUX
//
//  Created by David Lin on 4/12/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public protocol TGHomeManagerDelegate {
    
    func homeManager(manager: TGHomeManager, didAddHome home: TGHome);
    func homeManager(manager: TGHomeManager, didRemoveHome home: TGHome);
    func homeManagerDidUpdateHomes(manager: TGHomeManager);
    func homeManagerDidUpdatePrimaryHome(manager: TGHomeManager);

}
