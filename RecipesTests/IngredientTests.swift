//
//  IngredientTests.swift
//  Recipes
//
//  Created by Zachary.White on 3/2/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import XCTest
@testable import Recipes
class IngredientTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCanBeInstantiated() {
        let i = Ingredient.init(name: "a", caleries: 0, quantity: 4)
        XCTAssertNotNil(i)
        XCTAssertEqual(i.name, "a")
        XCTAssertEqual(i.quantity, 4)
    }
    func testCanSetMeasurement() {
        let i = Ingredient.init(name: "a", caleries: 0, quantity: 4)
        i.measurement = "Cups"
        XCTAssertEqual(i.measurement, "Cups")
    }
    func testCanFormatQuantityAsString() {
        let i = Ingredient.init(name: "a", caleries: 0, quantity: 4.25)
        i.measurement = "Oz"
        XCTAssertEqual("4 ¼ Oz", i.quantityToString())
    }
}
