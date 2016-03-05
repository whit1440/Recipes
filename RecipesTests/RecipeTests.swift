//
//  RecipesTests.swift
//  RecipesTests
//
//  Created by Zachary.White on 2/29/16.
//  Copyright © 2016 Zach White. All rights reserved.
//

import XCTest
@testable import Recipes

class RecipesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCanBeInstantiated() {
        let r = Recipe.init(name: "Eggs", description: "Sunny Side")
        XCTAssertNotNil(r)
        XCTAssertEqual(r.name, "Eggs")
        XCTAssertEqual(r.desc, "Sunny Side")
    }
    
    func testCanAddSteps() {
        let r = Recipe.init(name: "a", description: "b")
        r.addStep("Stir")
        XCTAssertNotNil(r.steps)
        XCTAssertEqual(r.steps.count, 1)
        XCTAssertEqual(r.steps[0], "Stir")
    }
    
    func testCanRemoveSteps() {
        let r = Recipe.init(name: "a", description: "b")
        r.addStep("Stir")
        r.addStep("Mix")
        XCTAssertEqual(r.steps.count, 2)
        r.removeStep(0)
        XCTAssertEqual(r.steps.count, 1)
        XCTAssertEqual(r.steps[0], "Mix")
    }
    
    func testCanConvertStepsToString() {
        let r = Recipe.init(name: "a", description: "b")
        r.addStep("Stir")
        r.addStep("Mix")
        XCTAssertEqual(r.stepsToString(), "Stir#Mix")
    }
    
    func testCanConvertStringToSteps() {
        let r = Recipe.init(name: "a", description: "b")
        r.stepsFromString("Stir#Mix")
        XCTAssertEqual(r.steps, ["Stir", "Mix"])
    }
    
    func testSerializeForwardAndBack() {
        let r = Recipe.init(name: "a", description: "b")
        r.addStep("Mix")
        r.addStep("Stir")
        r.addIngredient(Ingredient.init(name: "Banana", quantity: 1, measurement: "Cups"))
        let r1 = Recipe.deserialize(r.serialize())
        XCTAssertEqual(r.serialize(), r1.serialize())
    }
}
