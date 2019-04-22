//
//  AddReviewViaCloseButtonTest.swift
//  HittaTechAssignmentUITests
//
//  Created by Horea Stana on 20/04/2019.
//  Copyright © 2019 Raluca Toadere. All rights reserved.
//

import XCTest

class AddReviewViaCloseButtonTest: BaseFunctions {
    
    //Set of preconditions that will be executed before each test run from this class
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    //Set of preconditions that will be executed after each test run
    override func tearDown() {
        //To be filled with tear down instructions, for future, actually it's not needed
    }
    
    //**************************************
    // Description: Check cancel review flow
    //**************************************
    func testCancelReview() {
        //Wait for reviews page to be loaded, checking the company name
        waitForElementToBeDisplayed(ReviewsPage.restaurantNameText.element)
        
        //Go to add review page and wait for it to load
        ReviewsPageQuery.reviewSliderQuery.element.element(boundBy: 0).tap()
        waitForElementToBeDisplayed(AddReviewPage.oneStar.element)
        
        //Tap on Close->Cancel button
        NavBarButtons.closeButton.element.tap()
        waitForElementToBeDisplayed(SheetsQueryButtons.cancelButton.element)
        SheetsQueryButtons.cancelButton.element.tap()
        
        //Verify if reviews page is displayed after cancel the review
        //This will fail because user remains in add review page
        XCTAssert(ReviewsPage.emptyStars.element.exists, "After cancel the review, reviews page is not displayed")
    }
    
    //***********************************************************
    // Description: Check exit WITH save review flow,
    //              when reviewer name and description are filled
    //***********************************************************
    func testCloseAndSaveReview() {
        //Wait for reviews page to be loaded, checking the company name
        waitForElementToBeDisplayed(ReviewsPage.restaurantNameText.element)
        
        //Go to add review page and wait for it to load
        ReviewsPageQuery.reviewSliderQuery.element.element(boundBy: 4).tap()
        waitForElementToBeDisplayed(AddReviewPage.fiveStars.element)
        
        //Fill in user name and experience
        AddReviewPage.experienceTextView.element.clearAndEnterText(text: "My description is here")
        AddReviewPage.yourNameTextField.element.clearAndEnterText(text: "Horea")
        
        //Tap on Close->Exit and save your review button and wait for reviews page to load
        NavBarButtons.closeButton.element.tap()
        waitForElementToBeDisplayed(SheetsQueryButtons.exitAndSaveButton.element)
        SheetsQueryButtons.exitAndSaveButton.element.tap()
        waitForElementToBeDisplayed(AddedReviewFrame.ratedStars.element)
        
        //Verify if review was saved and UI elements are displayed according to previous steps
        XCTAssert(!ReviewsPage.describeYourExperienceButton.element.exists, "Describe your experience button is displayed for review")
        XCTAssertEqual(AddedReviewFrame.reviewDescription.element.label, "My description is here", "Experience text is not displayed for review")
        XCTAssertEqual(AddedReviewFrame.reviwerNameText.element.label, "Horea", "Reviewer name is not displayed")
        XCTAssert(!ReviewsPage.rateAndReviewText.element.exists, "Rate and review default text is displayed even if a review exists")
        XCTAssert(ReviewsPage.yourReviewText.element.exists, "Your review text is not displayed even if a review exists")
        XCTAssertEqual(AddedReviewFrame.addedReviewTimeText.element.label, "1m ago - hitta.se", "Added review time is not displayed")
        XCTAssert(AddedReviewFrame.ratedStars.element.exists, "Added review stars is not displayed")
    }
    
    //***********************************************************
    // Description: Check exit WITHOUT save review flow,
    //              when reviewer name and description are filled
    //***********************************************************
    func testCloseWithoutSaveReview() {
        //Wait for reviews page to be loaded, checking the company name
        waitForElementToBeDisplayed(ReviewsPage.restaurantNameText.element)
        
        //Go to add review page and wait for it to load
        ReviewsPageQuery.reviewSliderQuery.element.element(boundBy: 4).tap()
        waitForElementToBeDisplayed(AddReviewPage.fiveStars.element)
        
        //Fill in user name and experience
        AddReviewPage.experienceTextView.element.clearAndEnterText(text: "My description is here")
        AddReviewPage.yourNameTextField.element.clearAndEnterText(text: "Horea")
        
        //Tap on Close->Exit without saving button and wait for reviews page to load
        NavBarButtons.closeButton.element.tap()
        waitForElementToBeDisplayed(SheetsQueryButtons.exitWithoutSaveButton.element)
        SheetsQueryButtons.exitWithoutSaveButton.element.tap()
        waitForElementToBeDisplayed(AddedReviewFrame.ratedStars.element)
        
        //Verify if review was saved and UI elements are displayed according to previous steps
        XCTAssert(!ReviewsPage.describeYourExperienceButton.element.exists, "Describe your experience button is displayed for review")
        XCTAssertEqual(AddedReviewFrame.reviewDescription.element.label, "My description is here", "Experience text is not displayed for review")
        XCTAssertEqual(AddedReviewFrame.reviwerNameText.element.label, "Horea", "Reviewer name is not displayed")
        XCTAssert(!ReviewsPage.rateAndReviewText.element.exists, "Rate and review default text is displayed even if a review exists")
        XCTAssert(ReviewsPage.yourReviewText.element.exists, "Your review text is not displayed even if a review exists")
        XCTAssertEqual(AddedReviewFrame.addedReviewTimeText.element.label, "1m ago - hitta.se", "Added review time is not displayed")
        XCTAssert(AddedReviewFrame.ratedStars.element.exists, "Added review stars is not displayed")
    }
    
    //***************************************************************
    // Description: Check exit WITH save review,
    //              when reviewer name and description are NOT filled
    //***************************************************************
    func testCloseAndSaveEmptyReview() {
        //Wait for reviews page to be loaded, checking the company name
        waitForElementToBeDisplayed(ReviewsPage.restaurantNameText.element)
        
        //Go to add review page and wait for it to load
        ReviewsPageQuery.reviewSliderQuery.element.element(boundBy: 4).tap()
        waitForElementToBeDisplayed(AddReviewPage.fiveStars.element)
        
        //Tap on Close->Exit and save your review button and wait for reviews page to load
        NavBarButtons.closeButton.element.tap()
        waitForElementToBeDisplayed(SheetsQueryButtons.exitAndSaveButton.element)
        SheetsQueryButtons.exitAndSaveButton.element.tap()
        waitForElementToBeDisplayed(AddedReviewFrame.ratedStars.element)
        
        //Verify if review was saved and UI elements are displayed according to previous steps
        XCTAssert(ReviewsPage.describeYourExperienceButton.element.exists, "Describe your experience button is not displayed for review")
        XCTAssertEqual(AddedReviewFrame.reviwerNameText.element.label, "Anonymous", "Anonymous reviewer name is not displayed")
        XCTAssert(!ReviewsPage.rateAndReviewText.element.exists, "Rate and review default text is displayed even if a review exists")
        XCTAssert(ReviewsPage.yourReviewText.element.exists, "Your review text is not displayed even if a review exists")
        XCTAssertEqual(AddedReviewFrame.addedReviewTimeText.element.label, "1m ago - hitta.se", "Added review time is not displayed")
        XCTAssert(AddedReviewFrame.ratedStars.element.exists, "Added review stars is not displayed")
    }
    
    //***************************************************************
    // Description: Check exit WITHOUT save review,
    //              when reviewer name and description are NOT filled
    //***************************************************************
    func testCloseWithoutSaveEmptyReview() {
        //Wait for reviews page to be loaded, checking the company name
        waitForElementToBeDisplayed(ReviewsPage.restaurantNameText.element)
        
        //Go to add review page and wait for it to load
        ReviewsPageQuery.reviewSliderQuery.element.element(boundBy: 4).tap()
        waitForElementToBeDisplayed(AddReviewPage.fiveStars.element)
        
        //Tap on Close->Exit without saving button and wait for reviews page to load
        NavBarButtons.closeButton.element.tap()
        waitForElementToBeDisplayed(SheetsQueryButtons.exitWithoutSaveButton.element)
        SheetsQueryButtons.exitWithoutSaveButton.element.tap()
        waitForElementToBeDisplayed(AddedReviewFrame.ratedStars.element)
        
        //Verify if review was saved and UI elements are displayed according to previous steps
        XCTAssert(ReviewsPage.describeYourExperienceButton.element.exists, "Describe your experience button is not displayed for review")
        XCTAssertEqual(AddedReviewFrame.reviwerNameText.element.label, "Anonymous", "Anonymous reviewer name is not displayed")
        XCTAssert(!ReviewsPage.rateAndReviewText.element.exists, "Rate and review default text is displayed even if a review exists")
        XCTAssert(ReviewsPage.yourReviewText.element.exists, "Your review text is not displayed even if a review exists")
        XCTAssertEqual(AddedReviewFrame.addedReviewTimeText.element.label, "1m ago - hitta.se", "Added review time is not displayed")
        XCTAssert(AddedReviewFrame.ratedStars.element.exists, "Added review stars is not displayed")
    }
}

