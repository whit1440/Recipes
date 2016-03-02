//
//  CreateIngredient.swift
//  Recipes
//
//  Created by Zachary.White on 3/1/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import UIKit

protocol CreateIngredientDelegate {
    func addIngredient(ingredient: Ingredient)
}

class CreateIngredient: UIControl {
    
    @IBOutlet var qty: UIPickerView?
    @IBOutlet var subQty: UIPickerView?
    @IBOutlet var type: UISegmentedControl?
    @IBOutlet var addButton: UIButton?
    @IBOutlet var textField: UITextField?
    
    var delegate: CreateIngredientDelegate?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let view = NSBundle.mainBundle().loadNibNamed("CreateIngredient", owner: self, options: nil)[0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
        self.qty?.dataSource = QuantityPickerSource.sharedInstance
        self.qty?.delegate = QuantityPickerSource.sharedInstance
        self.subQty?.dataSource = SubQuantityPickerSource.sharedInstance
        self.subQty?.delegate = SubQuantityPickerSource.sharedInstance
    }
    @IBAction func didAddIngredient(sender: AnyObject) {
        guard let d = self.delegate, let name = self.textField?.text else { return }
        let q = Float.init(QuantityPickerSource.sharedInstance.selection) + SubQuantityPickerSource.sharedInstance.selection
        var i = Ingredient.init(name: name, caleries: 0, quantity: q)
        if let m = self.type, let title = m.titleForSegmentAtIndex(m.selectedSegmentIndex) {
            i.measurement = title
        }
        d.onAdd(i)
    }
    
}

class QuantityPickerSource: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    static var sharedInstance = QuantityPickerSource()
    
    private let standardMeasurements: [Int] = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
    var selection: Int = 0
    
    @objc func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.standardMeasurements.count
    }
    @objc func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    @objc func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(self.standardMeasurements[row])"
    }
    @objc func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selection = self.standardMeasurements[row]
    }
}

class SubQuantityPickerSource: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    static var sharedInstance = SubQuantityPickerSource()
    
    private let standardMeasurements: [Float] = [ 1/8, 1/4, 1/3, 3/8, 1/2, 5/8, 2/3, 3/4, 7/8 ]
    private let standardMeasurementsMap: [String] = [ "⅛","¼","⅓","⅜","½","⅝","⅔","¾","⅞" ]
    var selection: Float = 1/8
    
    @objc func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.standardMeasurementsMap.count
    }
    @objc func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    @objc func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.standardMeasurementsMap[row]
    }
    @objc func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selection = self.standardMeasurements[row]
    }
}