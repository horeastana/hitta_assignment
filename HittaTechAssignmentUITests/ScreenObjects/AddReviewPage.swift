//
//  AddReviewPage.swift
//  HittaTechAssignmentUITests
//
//  Created by Horea Stana on 20/04/2019.
//  Copyright © 2019 Raluca Toadere. All rights reserved.
//

import XCTest

//Define add review page elements
enum AddReviewPage: String {
    case fiveStars = "I loved it"
    case fourStars = "I liked it"
    case threeStars = "It was OK"
    case twoStars = "I didn\'t like it"
    case oneStar = "I hated it"
    case yourNameTextField = ""
    case experienceTextView = "Add more details on your experience..."
    var element: XCUIElement {
        switch self {
        case .fiveStars, .fourStars, .threeStars, .twoStars, .oneStar:
            return app.staticTexts[self.rawValue]
        case .yourNameTextField:
            return app.textFields.element(boundBy: 0)
        case .experienceTextView:
            return app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 2).children(matching: .textView).element
        }
    }
}

//Define add review page queries
enum AddReviewPageQuery: String {
    case reviewSliderQuery = ""
    var element: XCUIElementQuery {
        switch self {
        case .reviewSliderQuery:
            return app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other)
        }
    }
}

//Define sheet buttons
enum SheetsQueryButtons: String {
    case exitAndSaveButton = "Exit and save your review"
    case exitWithoutSaveButton = "Exit without saving"
    case cancelButton = "Cancel"
    var element: XCUIElement {
        switch self {
        case .exitAndSaveButton, .exitWithoutSaveButton, .cancelButton:
            return sheetsQuery.buttons[self.rawValue]
        }
    }
}

//Define navigation bar buttons
enum NavBarButtons: String {
    case closeButton = "Close"
    case saveButton = "Save"
    var element: XCUIElement {
        switch self {
        case .closeButton, .saveButton:
            return navBar.buttons[self.rawValue]
        }
    }
}

//Define alert message elements
enum AlertMessage: String {
    case titleText = "Thank you for your review"
    case contentText = "You're helping others make smarter decisions every day"
    case okayButton = "Okay!"
    var element: XCUIElement {
        switch self {
        case .titleText, .contentText:
            return app.alerts.staticTexts[self.rawValue]
        case .okayButton:
            return app.alerts.buttons[self.rawValue]
        }
    }
}
