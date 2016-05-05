//
//  TGUtility.swift
//  SmartHome
//
//  Created by 駿逸 陳 on 2016/4/19.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit
import Parse

class TGUtility {
    // MARK: - TGUtility

    // MARK: - Dashboard上所有的物件，輸入的條件是將 Hub 物件丟進去。
    class func getAllAccessoriesOnDashBoard(hObject: PFObject, block completionBlock: ((succeeded: Bool, array: NSArray?) -> Void)?) {
        //這裡要送cmd給Function Layer層
        let queryAllAccessories: PFQuery = PFQuery(className: hObject.parseClassName)
        
        queryAllAccessories.findObjectsInBackgroundWithBlock { (accessories, error) in
            if error == nil {
                completionBlock!(succeeded: true, array: accessories)
            }
        }
    }
    
    // MARK: - query所有的 IP Hubs 物件，輸入的條件是 query 所有 aid = 0 的物件
    class func getAllIPHubs(user: PFUser, block completionBlock: ((succeeded: Bool, array: NSArray?) -> Void)?) {
        //這裡要送cmd給Function Layer層
        
        let queryUsersIPHubs: PFQuery = PFQuery(className: "HObject")
        queryUsersIPHubs.whereKey("user", equalTo: user)
        queryUsersIPHubs.whereKey("aid", equalTo: 0)
        queryUsersIPHubs.findObjectsInBackgroundWithBlock { (allObjects, error) in
            if error == nil {
                completionBlock!(succeeded: true, array: allObjects)
            }
        }
    }
    
}
