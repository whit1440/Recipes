//
//  RecipeListView.swift
//  Recipes
//
//  Created by Zachary.White on 2/29/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import UIKit

class RecipeListView: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = RecipeListPresenter.sharedInstance
        self.tableView.delegate = RecipeListPresenter.sharedInstance
        
        // setup callback for row selection
        RecipeListPresenter.sharedInstance.onSelect = { name in
            Router.sharedInstance?.navigateToViewRecipe(self, model: ["RecipeName": name])
        }
        
        // setup New Recipe button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "New Recipe", style: UIBarButtonItemStyle.Plain, target: self, action: "newRecipe")
        // TODO - shouldn't be hardcoded
        self.title = "Recipes"
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    override func viewDidDisappear(animated: Bool) {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func newRecipe() {
        // callback for the submission of the new recipe text field
        RecipeListPresenter.sharedInstance.addRecipe({ name in
            Router.sharedInstance?.navigateToCreateRecipe(self, model: ["RecipeName": name])
        })
        // only reload the first section
        let set = NSIndexSet.init(index: 0)
        self.tableView.reloadSections(set, withRowAnimation: UITableViewRowAnimation.Automatic)
    }
}
