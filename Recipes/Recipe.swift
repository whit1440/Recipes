//
//  Recipe.swift
//  Recipes
//
//  Created by Zachary.White on 2/29/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import Foundation

public class Recipe {
    public var name: String = ""
    public var desc: String = ""
    public var steps: [String] = [String]()
    public var ingredients: [Ingredient] = [Ingredient]()
    
    init(name: String, description: String) {
        self.name = name
        self.desc = description
    }
    
    public func addStep(step: String) {
        self.steps.append(step)
    }
    
    public func addIngredient(ing: Ingredient) {
        self.ingredients.append(ing)
    }
    
    public func removeStep(index: Int) {
        self.steps.removeAtIndex(index)
    }
    public func removeIngredient(index: Int) throws {
        self.ingredients.removeAtIndex(index)
    }
    public func ingredientAtIndex(index: Int) -> Ingredient {
        return self.ingredients[index]
    }
    
    func stepsToString() -> String {
        return self.steps.joinWithSeparator("#")
    }
    func stepsFromString(input: String) {
        self.steps.appendContentsOf(input.componentsSeparatedByString("#"))
    }
    func ingredientsToString() -> String {
        var output = ""
        for i in self.ingredients {
           output += "\(i.serialize())+"
        }
        return output
    }
    func ingredientsFromString(input: String) {
        var parts = input.componentsSeparatedByString("+")
        parts.removeLast()
        for i in parts {
            self.addIngredient(Ingredient.deserialize(i))
        }
    }
    public func serialize() -> String {
        return "\(self.name);\(self.desc);\(self.stepsToString());\(self.ingredientsToString())"
    }
    public static func deserialize(input: String) -> Recipe {
        let parts = input.componentsSeparatedByString(";")
        let r = Recipe.init(name: parts[0], description: parts[1])
        r.stepsFromString(parts[2])
        r.ingredientsFromString(parts[3])
        return r
    }
}