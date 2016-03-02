//
//  CreationInput.swift
//  Recipes
//
//  Created by Zachary.White on 3/1/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import UIKit

class CreationInput: UIControl {

    @IBOutlet var addButton: UIButton! = UIButton()
    @IBOutlet var addField: UITextField! = UITextField()
    
    @IBAction func add(sender: AnyObject, withEvent: UIEvent) {

    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let view = NSBundle.mainBundle().loadNibNamed("CreationInput", owner: self, options: nil)[0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
    }

}
