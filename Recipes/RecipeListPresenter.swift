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
    
    var onSelect: (name: String) -> Void = {_ in } // callback for row selection
    var addComplete: ((name: String) -> Void)? // callback for submission of text field
    private var secrectRows: Int = 0
    
    @objc func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipeListInteractor.sharedInstance.getRecipeCount() + self.secrectRows
    }
    @objc func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.row == RecipeListInteractor.sharedInstance.getRecipeCount() {
            // TODO - this feels like view specific stuff, consider moving this
            let view = UITextField()
            view.placeholder = "New Recipe"
            view.frame = CGRectMake(cell.frame.origin.x + 20, cell.frame.origin.y, cell.frame.width - 20, cell.frame.height)
            view.becomeFirstResponder()
            view.addTarget(self, action: "didReturn:", forControlEvents: UIControlEvents.PrimaryActionTriggered)
            view.returnKeyType = UIReturnKeyType.Next
            cell.addSubview(view)
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
    func addRecipe(complete: (name: String) -> Void) {
        self.secrectRows = 1
        self.addComplete = complete
    }
    func didReturn(sender: AnyObject) {
        self.secrectRows = 0
        if let c = self.addComplete, let field = sender as? UITextField, let text = field.text {
            c(name: text)
        }
    }
}
