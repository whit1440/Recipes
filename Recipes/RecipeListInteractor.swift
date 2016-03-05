//
//  RecipeListInteractor.swift
//  Recipes
//
//  Created by Zachary.White on 2/29/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import UIKit

class RecipeListInteractor: NSObject {
    static let sharedInstance = RecipeListInteractor()
    
    private var recipeList: [String: Recipe] = [String: Recipe]()
    private var sortedKeys: [String] = [String]()
    
    override init() {
        super.init()
    }
    
    func getRecipe(name: String) -> Recipe? {
        guard let recipe = self.recipeList[name] else { return nil }
        return recipe
    }
    func getRecipeAtIndex(index: Int) -> Recipe? {
        guard let name: String = self.sortedKeys[index] else { return nil }
        guard let recipe = self.recipeList[name] else { return nil }
        return recipe
    }
    func saveRecipe(recipe: Recipe) {
        self.recipeList[recipe.name] = recipe
        self.refreshSortedKeys()
    }
    
    func removeRecipe(name: String) {
        self.recipeList.removeValueForKey(name)
        self.refreshSortedKeys()
    }
    
    func getRecipeCount() -> Int {
        return self.recipeList.count
    }
    
    private func refreshSortedKeys() {
        self.sortedKeys = Array(self.recipeList.keys).sort()
    }
}
