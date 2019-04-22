//
//  ReviewsPage.swift
//  HittaTechAssignmentUITests
//
//  Created by Horea Stana on 19/04/2019.
//  Copyright © 2019 Raluca Toadere. All rights reserved.
//

import XCTest

//Define reviews page elements
enum ReviewsPage: String {
    case restaurantNameText = "Phil's Burger AB"
    case reviewsText = "Reviews"
    case viewAllReviewsButton = "View all reviews"
    case rateAndReviewText = "Rate and review"
    case shareExperienceText = "Share your experience to help others"
    case reviewSlider = ""
    case describeYourExperienceButton = "Describe your experience"
    case yourReviewText = "Your review"
    case emptyStars = "empty_star_big"
    var element: XCUIElement {
        switch self {
        case .restaurantNameText, .reviewsText, .rateAndReviewText, .shareExperienceText, .yourReviewText:
            return elementsQuery.staticTexts[self.rawValue]
        case .viewAllReviewsButton:
            return scrollViewsQuery.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element(boundBy: 0).buttons[self.rawValue]
        case .reviewSlider:
            return scrollViewsQuery.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element
        case .describeYourExperienceButton:
            return scrollViewsQuery.otherElements.buttons[self.rawValue]
        case .emptyStars:
            return elementsQuery.images[self.rawValue]
        }
    }
}

//Define reviews page queries
enum ReviewsPageQuery: String {
    case reviewSliderQuery = ""
    var element: XCUIElementQuery {
        switch self {
        case .reviewSliderQuery:
            return scrollViewsQuery.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other)
        }
    }
}

//Define saved review block frame
enum AddedReviewFrame: String {
    case reviwerNameText = ""
    case addedReviewTimeText = "Review time"
    case ratedStars = "Rated stars"
    case reviewDescription = "Description"
    var element: XCUIElement {
        switch self {
        case .reviwerNameText:
            return scrollViewsQuery.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element(boundBy: 1).staticTexts.element(boundBy: 1)
        case .addedReviewTimeText:
            return scrollViewsQuery.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element(boundBy: 1).staticTexts.element(boundBy: 2)
        case .ratedStars:
            return scrollViewsQuery.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        case .reviewDescription:
            return scrollViewsQuery.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element(boundBy: 1).staticTexts.element(boundBy: 3)
        }
    }
}
