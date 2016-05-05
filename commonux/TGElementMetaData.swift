//
//  TGElementMetaData.swift
//  CommonUX
//
//  Created by David Lin on 4/11/16.
//  Copyright © 2016 TUTK. All rights reserved.
//

import Foundation

public class TGElementMetaData: NSObject {
    
    // MARK: Numeric Value Ranges
    
    private var minimumValue: Int = 0;
    func getMinimumValue() -> Int { return minimumValue; }
    private var maximumValue: Int = 0;
    func getMaximumValue() -> Int { return maximumValue; }
    private var stepValue: Int = 0;
    func getStepvalue() -> Int { return stepValue; }
    
    // MARK: - Format and Units
    
    private var format: String = "";
    func getFormat() -> String? { return format; }
    private var units: String = ""
    func getUnits() -> String? { return units; }
    
    public init(minimumValue: Int, maximumValue: Int, stepValue: Int, format: String, units: String) {
        self.minimumValue = minimumValue;
        self.maximumValue = maximumValue;
        self.stepValue = stepValue;
        self.format = format;
        self.units = units;
        super.init();
    }
}