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
        if let table = self.tableView, let model = Router.getCurrentViewModel() as? [String: String] {
            let recipe = RecipeListInteractor.sharedInstance.getRecipe(model["RecipeName"]!)
            self.recipePresenter = RecipePresenter.init(recipeToPresent: recipe!)
            table.dataSource = self.recipePresenter
            table.delegate = self.recipePresenter
            self.title = model["RecipeName"]!
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
