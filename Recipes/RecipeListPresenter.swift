//
//  RecipeListPresenter.swift
//  Recipes
//
//  Created by Zachary.White on 2/29/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import UIKit

class RecipeListPresenter: NSObject, UITableViewDataSource, UITableViewDelegate {
    static let sharedInstance = RecipeListPresenter()
    
    @objc func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipeListInteractor.sharedInstance.getRecipeCount()
    }
    @objc func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let r: Recipe = RecipeListInteractor.sharedInstance.getRecipeAtIndex(indexPath.row) {
            cell.textLabel?.text = r.name
        }
        return cell
    }
}
