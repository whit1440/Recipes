//
//  RecipeView.swift
//  Recipes
//
//  Created by Zachary.White on 3/3/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import UIKit

class RecipeView: UIViewController {
    
    @IBOutlet var tableView: UITableView?
    var recipePresenter: RecipePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let table = self.tableView, let model = Router.sharedInstance?.getCurrentViewModel() as? [String: String] {
            // get the passed model from the router
            let recipe = RecipeListInteractor.sharedInstance.getRecipe(model["RecipeName"]!)
            // init the presenter using the recipe
            self.recipePresenter = RecipePresenter.init(recipeToPresent: recipe!)
            // ui table view stuff
            table.dataSource = self.recipePresenter
            table.delegate = self.recipePresenter
            
            self.title = model["RecipeName"]!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
