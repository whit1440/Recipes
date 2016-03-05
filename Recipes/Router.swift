//
//  Router.swift
//  Recipes
//
//  Created by Zachary.White on 3/1/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import UIKit

public class Router: UINavigationController, UINavigationControllerDelegate {
    
    public static var sharedInstance: Router?
    
    private var modelStack: Array<[String: AnyObject]> = Array()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Router.sharedInstance = self
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func navigateToCreateRecipe(controller: UIViewController, model: [String: AnyObject]?) {
        self.performNavigation("ListToCreate", controller: controller, model: model)
    }
    
    public func navigateToViewRecipe(controller: UIViewController, model: [String: AnyObject]?) {
        self.performNavigation("ListToRecipe", controller: controller, model: model)
    }
    
    public func back() {
        self.popViewControllerAnimated(true)
    }
    
    private func performNavigation(identifier: String, controller: UIViewController, model:[String: AnyObject]?) {
        if let m = model {
            self.modelStack.append(m)
        } else {
            self.modelStack.append(["":""])
        }
        controller.performSegueWithIdentifier(identifier, sender: controller)
    }
    
    public func getCurrentViewModel() -> [String: AnyObject]? {
        return self.modelStack.last
    }
    
    public func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // discard old model data when the view stack is popped
        if(operation == UINavigationControllerOperation.Pop) {
            self.modelStack.popLast()
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
