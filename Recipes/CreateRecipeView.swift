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
        if let model = Router.getCurrentViewModel() as? [String: String] {
            self.title = model["RecipeName"]
            self.recipe.name = model["RecipeName"]!
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Finish", style: UIBarButtonItemStyle.Plain, target: self, action: "finish")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    func finish() {
        RecipeListInteractor.sharedInstance.saveRecipe(self.recipe)
        // TODO - not sure this is the right spot for this, logically
        self.navigationController?.popViewControllerAnimated(true)
    }
}
