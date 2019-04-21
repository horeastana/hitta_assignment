//
//  BaseElements.swift
//  HittaTechAssignmentUITests
//
//  Created by Horea Stana on 19/04/2019.
//  Copyright © 2019 Raluca Toadere. All rights reserved.
//

import XCTest

    //Define application
    let app = XCUIApplication()

    //Define scroll view
    var scrollViewsQuery: XCUIElementQuery {
        return app.scrollViews
    }

    //Define scroll view element query
    var elementsQuery: XCUIElementQuery {
        return scrollViewsQuery.otherElements
    }

    //Define navigation bar
    var navBar: XCUIElementQuery {
        return app.navigationBars
    }

    //Define sheet query
    var sheetsQuery: XCUIElementQuery {
        return app.sheets
    }

