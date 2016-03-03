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
    var onSelect: (name: String) -> Void = {_ in }
    var addComplete: (() -> Void)?
    private var secrectRows: Int = 0
    
    @objc func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipeListInteractor.sharedInstance.getRecipeCount() + self.secrectRows
    }
    @objc func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.row == RecipeListInteractor.sharedInstance.getRecipeCount() {
            let view = UITextField()
            view.placeholder = "New Recipe"
            view.frame = CGRectMake(cell.frame.origin.x + 20, cell.frame.origin.y, cell.frame.width - 20, cell.frame.height)
            cell.addSubview(view)
            view.becomeFirstResponder()
            view.addTarget(self, action: "didReturn", forControlEvents: UIControlEvents.PrimaryActionTriggered)
            view.returnKeyType = UIReturnKeyType.Next
        } else {
            if let r: Recipe = RecipeListInteractor.sharedInstance.getRecipeAtIndex(indexPath.row) {
                cell.textLabel?.text = r.name
            }
        }
        return cell
    }
    @objc func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row < RecipeListInteractor.sharedInstance.getRecipeCount()) {
            if let r = RecipeListInteractor.sharedInstance.getRecipeAtIndex(indexPath.row) {
                self.onSelect(name: r.name)
            }
        }
    }
    func addRecipe(complete: () -> Void) {
        self.secrectRows = 1
        self.addComplete = complete
    }
    func didReturn() {
        print("done")
        if let c = self.addComplete {
            c()
        }
    }
}
