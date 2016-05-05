//
//  TGElementValue.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class TGElementValue: NSObject {
    private var nElementNo: Int = 0;
    private var nValue: Any;
    
    public init(strENo: String, value: Any) {
        nElementNo = Int(strENo)!;
        nValue = value;
    }
}