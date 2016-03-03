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
    @IBOutlet var table: UITableView?
    
    var recipe: Recipe = Recipe(name: "", description: "")
    var recipePresenter: RecipePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ingredientCreator?.delegate = self
        self.stepCreator?.delegate = self
        self.recipePresenter = RecipePresenter.init(recipeToPresent: self.recipe)
        self.table?.dataSource = self.recipePresenter
        self.table?.delegate = self.recipePresenter
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addIngredient(ingredient: Ingredient) {
        print("Adding Ingredient")
        self.recipe.addIngredient(ingredient)
        self.table?.reloadData()
    }
    func addText(text: String) {
        print("Adding Step")
        self.recipe.addStep(text)
        self.table?.reloadData()
    }
}
