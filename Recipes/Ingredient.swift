//
//  Ingredient.swift
//  Recipes
//
//  Created by Zachary.White on 2/29/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import Foundation
public struct Ingredient {
    public var name: String = ""
    public var caleriesPerGram: Float = 0
    public var quantity: Float = 0
    public var measurement: String = ""
    private let standardMeasurements: [Float] = [ 1/8, 1/4, 1/3, 3/8, 1/2, 5/8, 2/3, 3/4, 7/8 ]
    private let standardMeasurementsMap: [String] = [ "⅛","¼","⅓","⅜","½","⅝","⅔","¾","⅞" ]
    
    public init(name: String, caleries: Float, quantity: Float) {
        self.name = name
        self.caleriesPerGram = caleries
        self.quantity = quantity
    }
    public init(name: String, caleries: Float, quantity: Float, measurement: String) {
        self.name = name
        self.caleriesPerGram = caleries
        self.quantity = quantity
        self.measurement = measurement
    }
    func quantityToString() -> String {
        let q: Int = Int.init(self.quantity)
        let fraction = self.floatToFraction()
        return "\(q) \(fraction)\(self.measurement)"
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
}