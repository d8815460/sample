//
//  TGService.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class TGService: NSObject {
    
    // MARK: - Managing Services
    
    private var mstrSName: String?;
    public func getstrSName() -> String? { return mstrSName; }
    func updateName(name: String, completion: TGCompletionHandler?) {
        
    }
    private var mTGAccessory: TGAccessory?;
    func getAccessory() -> TGAccessory? { return mTGAccessory; }
    private var mstrServiceType: String?;
    func getServiceType() -> String? { return mstrServiceType; }
    private var mstrAssociatedServiceType: String?
    func getAssociatedServieType() -> String? { return mstrAssociatedServiceType; }
    func updateAssociatedServiceType(serviceType: String, completion: TGCompletionHandler?) {
        
    }
    private var mElementList: [TGElement];
    public func getElementList() -> [TGElement] { return mElementList; }
    
    public init(listElement: [TGElement]) {
        mElementList = listElement;
        super.init();
    }
}