//
//  CreateRecipeView.swift
//  Recipes
//
//  Created by Zachary.White on 3/1/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import UIKit

class CreateRecipeView: UIViewController, CreateIngredientDelegate, CreationInputDelegate {

    @IBOutlet var ingredientCreator: CreateIngredient?
    @IBOutlet var stepCreator: CreationInput?
    var recipe: Recipe = Recipe(name: "", description: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ingredientCreator?.delegate = self
        self.stepCreator?.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addIngredient(ingredient: Ingredient) {
        self.recipe.addIngredient(ingredient)
    }
    func addText(text: String) {
        self.recipe.addStep(text)
    }
}
