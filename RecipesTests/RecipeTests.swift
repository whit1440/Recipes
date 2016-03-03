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
        XCTAssertEqual(r.description, "Sunny Side")
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
}
