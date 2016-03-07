//
//  Recipe.swift
//  Recipes
//
//  Created by Zachary.White on 2/29/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import Foundation

class Recipe {
    var name: String = ""
    var desc: String = ""
    var steps: [String] = [String]()
    var ingredients: [Ingredient] = [Ingredient]()
    
    init(name: String, description: String) {
        self.name = name
        self.desc = description
    }
    
    func addStep(step: String) {
        self.steps.append(step)
    }
    
    func addIngredient(ing: Ingredient) {
        self.ingredients.append(ing)
    }
    
    func removeStep(index: Int) {
        self.steps.removeAtIndex(index)
    }
    func removeIngredient(index: Int) throws {
        self.ingredients.removeAtIndex(index)
    }
    func ingredientAtIndex(index: Int) -> Ingredient {
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
    func serialize() -> String {
        return "\(self.name);\(self.desc);\(self.stepsToString());\(self.ingredientsToString())"
    }
    static func deserialize(input: String) -> Recipe {
        let parts = input.componentsSeparatedByString(";")
        let r = Recipe.init(name: parts[0], description: parts[1])
        r.stepsFromString(parts[2])
        r.ingredientsFromString(parts[3])
        return r
    }
}