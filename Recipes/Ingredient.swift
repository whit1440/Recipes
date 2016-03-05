//
//  Ingredient.swift
//  Recipes
//
//  Created by Zachary.White on 2/29/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import Foundation
public class Ingredient {
    public var name: String = ""
    public var quantity: Float = 0
    public var measurement: String = ""
    private let standardMeasurements: [Float] = [0, 1/8, 1/4, 1/3, 1/2, 2/3, 3/4 ]
    private let standardMeasurementsMap: [String] = ["0", "⅛","¼","⅓","½","⅔","¾" ]
    
    public init(name: String, quantity: Float, measurement: String = "None") {
        self.name = name
        self.quantity = quantity
        self.measurement = measurement
    }
    public func quantityToString() -> String {
        let q: Int = Int.init(self.quantity)
        let fraction = self.floatToFraction()
        var output: String = ""
        output += (q > 0) ? "\(q) " : ""
        output += ((self.quantity % 1) > 0) ? "\(fraction) " : ""
        output += (self.measurement != "None") ? "\(self.measurement)" : ""
        return output
    }
    private func floatToFraction() -> String {
        let mod = self.quantity % 1
        if(mod == 0) { return "" }
        for i in 0..<self.standardMeasurements.count - 1 {
            if self.standardMeasurements[i] <= mod && self.standardMeasurements[i+1] >= mod {
                let lowerDiff = mod - self.standardMeasurements[i]
                let upperDiff = self.standardMeasurements[i+1] - mod
                return (lowerDiff < upperDiff) ? self.standardMeasurementsMap[i] : self.standardMeasurementsMap[i+1]
            }
        }
        return self.standardMeasurementsMap[self.standardMeasurements.count - 1]
    }
    public func toString() -> String {
        return "\(self.quantityToString()) \(self.name)"
    }
    public func serialize() -> String {
        return "\(self.name)#\(self.quantity)#\(self.measurement)"
    }
    public static func deserialize(input: String) -> Ingredient {
        let parts = input.componentsSeparatedByString("#")
        if let qty = Float.init(parts[1]) {
            return Ingredient.init(name: parts[0], quantity: qty, measurement: parts[2])
        } else {
            return Ingredient.init(name: parts[0], quantity: 0, measurement: parts[2])
        }
    }
}