//
//  TGCache.swift
//  SmartHome
//
//  Created by 駿逸 陳 on 2016/4/19.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit

final class TGCache {
    private var cache: NSCache
    
    // MARK:- Initialization
    
    static let sharedCache = TGCache()
    
    private init() {
        self.cache = NSCache()
    }
    
    // MARK:- PAPCache
    
    func clear() {
        cache.removeAllObjects()
    }
}
