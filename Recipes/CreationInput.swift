//
//  CreationInput.swift
//  Recipes
//
//  Created by Zachary.White on 3/1/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import UIKit

protocol CreationInputDelegate {
    func addText(text: String)
}

class CreationInput: UIControl {

    @IBOutlet var addButton: UIButton! = UIButton()
    @IBOutlet var addField: UITextField! = UITextField()
    var delegate: CreationInputDelegate?
    
    @IBAction func add(sender: AnyObject, withEvent: UIEvent) {
        if let d = self.delegate, let t = self.addField.text {
            d.addText(t)
        }
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let view = NSBundle.mainBundle().loadNibNamed("CreationInput", owner: self, options: nil)[0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
    }

}
