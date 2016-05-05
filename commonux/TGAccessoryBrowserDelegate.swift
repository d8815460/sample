//
//  TGAccessoryBrowserDelegate.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public protocol TGAccessoryBrowserDelegate {

    // MARK: - Tracking New Accessories
    func accessoryBrowser(browser: TGAccessoryBrowser, didFindNewAccessory accessory: TGAccessory);
    func accessoryBrowser(browser: TGAccessoryBrowser, didRemoveNewAccessory accessory: TGAccessory);
    
}
