//
//  Router.swift
//  Recipes
//
//  Created by Zachary.White on 3/1/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import UIKit

class Router: UINavigationController, UINavigationControllerDelegate {
    
    private static var modelStack: Array<[String: AnyObject]> = Array()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    static func navigateToCreateRecipe(controller: UIViewController, model: [String: AnyObject]?) {
        Router.performNavigation("ListToCreate", controller: controller, model: model)
    }
    
    static func navigateToViewRecipe(controller: UIViewController, model: [String: AnyObject]?) {
        Router.performNavigation("ListToRecipe", controller: controller, model: model)
    }
    
    static func performNavigation(identifier: String, controller: UIViewController, model:[String: AnyObject]?) {
        if let m = model {
            Router.modelStack.append(m)
        } else {
            Router.modelStack.append(["":""])
        }
        controller.performSegueWithIdentifier(identifier, sender: controller)
    }
    
    static func getCurrentViewModel() -> [String: AnyObject]? {
        return Router.modelStack.last
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // discard old model data when the view stack is popped
        if(operation == UINavigationControllerOperation.Pop) {
            Router.modelStack.popLast()
        }
        return nil
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
