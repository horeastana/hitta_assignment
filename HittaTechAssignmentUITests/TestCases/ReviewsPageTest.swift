//
//  HittaTechAssignmentUITests.swift
//  HittaTechAssignmentUITests
//
//  Created by Ionut Gavris on 19/04/2019.
//  Copyright © 2019 Raluca Toadere. All rights reserved.
//

import XCTest

class ReviewsPageTests: BaseFunctions {
    
    //Set of preconditions that will be executed before each test run from this class
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    //Set of preconditions that will be executed after each test run
    override func tearDown() {
        //To be filled with tear down instructions, for future, actually it's not needed
    }
    
    //**********************************************************
    // Description: Check initial UI elements (company elements)
    //**********************************************************
    func testCheckUIElements() {
        //Wait for reviews page to be loaded, checking the company name
        waitForElementToBeDisplayed(ReviewsPage.restaurantNameText.element)
        XCTAssertEqual(elementsQueryGetText(0), "Phil\'s Burger AB")
        
        //Verify title of the page is displayed
        XCTAssert(ReviewsPage.reviewsText.element.exists, "Reviews title from company page is not displayed")
        
        //Verify if rating score of restaurant is displayed
        XCTAssert(elementsQueryGetText(2).contains("."), "Rating score is not displayed")
        
        //Verify if number of reviews for this restaurant is displayed
        XCTAssert(elementsQueryGetText(3).starts(with: "from"), "Number of reviews is not displayed")
        
        //Verify if View all reviews button is displayed in company block
        XCTAssert(ReviewsPage.viewAllReviewsButton.element.exists, "View all reviews button from company page is not displayed")
        
        //Verify if rating block title is displayed
        XCTAssert(ReviewsPage.rateAndReviewText.element.exists, "Rating text title is not displayed")
        
        //Verify if rating block text description is displayed
        XCTAssert(ReviewsPage.shareExperienceText.element.exists, "Rating share experience text is not displayed")
        
        //Verify if review stars are displayed in rating block
        XCTAssert(ReviewsPage.reviewSlider.element.exists, "Review stars are not displayed in reviews page")
    }
}
