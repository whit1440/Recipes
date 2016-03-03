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
    public var description: String = ""
    public var steps: [String] = [String]()
    public var ingredients: [Ingredient] = [Ingredient]()
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
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
}