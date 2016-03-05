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
    
    var recipe: Recipe = Recipe(name: "", description: "")// blank recipe
    var recipePresenter: RecipePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // delegates for the subviews
        self.ingredientCreator?.delegate = self
        self.stepCreator?.delegate = self
        // presenter for recipe being created
        self.recipePresenter = RecipePresenter.init(recipeToPresent: self.recipe)
        self.table?.dataSource = self.recipePresenter
        self.table?.delegate = self.recipePresenter
        // pull the recipe name entered on previous screen
        if let model = Router.sharedInstance?.getCurrentViewModel() as? [String: String] {
            self.title = model["RecipeName"]
            self.recipe.name = model["RecipeName"]!
        }
        // setup the finish button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Finish", style: UIBarButtonItemStyle.Plain, target: self, action: "finish")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addIngredient(ingredient: Ingredient) {
        self.recipe.addIngredient(ingredient)
        self.table?.reloadData()
    }
    func addText(text: String) {
        self.recipe.addStep(text)
        self.table?.reloadData()
    }
    func finish() {
        // TODO - view should not call interactor directly
        RecipeListInteractor.sharedInstance.saveRecipe(self.recipe)
        // go back to the list
        Router.sharedInstance?.back()
    }
}
