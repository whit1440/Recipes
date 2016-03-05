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
        
        RecipeListPresenter.sharedInstance.onSelect = { name in
            Router.sharedInstance?.navigateToViewRecipe(self, model: ["RecipeName": name])
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "New Recipe", style: UIBarButtonItemStyle.Plain, target: self, action: "newRecipe")
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
        // Dispose of any resources that can be recreated.
    }
    
    func newRecipe() {
        RecipeListPresenter.sharedInstance.addRecipe({ name in
            Router.sharedInstance?.navigateToCreateRecipe(self, model: ["RecipeName": name])
        })
        let set = NSIndexSet.init(index: 0)
        self.tableView.reloadSections(set, withRowAnimation: UITableViewRowAnimation.Automatic)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
