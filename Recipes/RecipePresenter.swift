//
//  RecipePresenter.swift
//  Recipes
//
//  Created by Zachary.White on 3/2/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import UIKit

class RecipePresenter: NSObject, UITableViewDataSource, UITableViewDelegate {

    var recipe: Recipe?
    
    init(recipeToPresent: Recipe) {
        self.recipe = recipeToPresent
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Steps"
        } else {
            return "Ingredients"
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print(self.recipe)
        let cell = UITableViewCell()
        if indexPath.section == 0 {
            cell.textLabel?.text = self.recipe?.steps[indexPath.row]
        } else {
            if let i = self.recipe?.ingredientAtIndex(indexPath.row) {
                cell.textLabel?.text = "\(i.quantityToString()) \(i.name)"   
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return (self.recipe?.steps.count)!
        } else {
            return (self.recipe?.ingredients.count)!
        }
    }
    
}
