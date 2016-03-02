//
//  Recipe.swift
//  Recipes
//
//  Created by Zachary.White on 2/29/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import Foundation
public struct Recipe {
    public var name: String = ""
    public var description: String = ""
    public var steps: Array<String> = []
    public var ingredients: [String: Ingredient] = [String: Ingredient]()
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    public mutating func addStep(step: String) {
        self.steps.append(step)
    }
    
    public mutating func addIngredient(ing: Ingredient) {
        self.ingredients[ing.name] = ing
    }
    
    public mutating func removeStep(index: Int) {
        self.steps.removeAtIndex(index)
    }
    public mutating func removeIngredient(name: String) throws {
        if let index = self.ingredients.indexForKey(name) {
            self.ingredients.removeAtIndex(index)
        } else {
            throw InputError.NameIncorrect
        }
    }
}