//
//  BaseFunctions.swift
//  HittaTechAssignmentUITests
//
//  Created by Horea Stana on 19/04/2019.
//  Copyright © 2019 Raluca Toadere. All rights reserved.
//

import XCTest

class BaseFunctions: XCTestCase {
    
    //Define wait for element to be hittable function
    func waitForElementToBeDisplayed(_ element: XCUIElement, timeout: TimeInterval = 30) {
        let hittable = NSPredicate(format: "hittable == true")
        let expectations = expectation(for: hittable, evaluatedWith: element, handler: nil)
        XCTWaiter().wait(for: [expectations], timeout: timeout)
    }
    
    //Define function that get text from element
    func elementsQueryGetText(_ index: Int) -> String {
        return elementsQuery.staticTexts.element(boundBy: index).label
    }
}

extension XCUIElement {
    
    //Extend XCUIElement class in order to add clear and add text to a textfield
    func clearAndEnterText(text: String) -> Void {
        let fieldValue = self.value as! String
        var deleteString: String = ""
        self.tap()
        for _ in fieldValue {
            deleteString += "\u{8}"
        }
        self.typeText(deleteString)
        self.typeText(text)
    }
}
