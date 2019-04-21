//
//  AddReviewCheckTexts.swift
//  HittaTechAssignmentUITests
//
//  Created by Horea Stana on 19/04/2019.
//  Copyright © 2019 Raluca Toadere. All rights reserved.
//

import XCTest

class AddReviewViaSaveButtonTest: BaseFunctions {
    
    //Set of preconditions that will be executed before each test run from this class
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    //Set of preconditions that will be executed after each test run
    override func tearDown() {
        //To be filled with tear down instructions, for future, actually it's not needed
    }
    
    //*************************************************************
    // Description: Check the text under the stars changing flow,
    //              according to number of stars in add review page
    //*************************************************************
    func testCheckRatingText() {
        //Wait for reviews page to be loaded, checking the company name
        waitForElementToBeDisplayed(ReviewsPage.restaurantNameText.element)
        
        //Go to add review page and wait for it to load
        ReviewsPageQuery.reviewSliderQuery.element.element(boundBy: 0).tap()
        waitForElementToBeDisplayed(AddReviewPage.oneStar.element)
        
        //Verify one star text
        XCTAssert(AddReviewPage.oneStar.element.exists, "One star text is not displayed")
        
        //Verify 2, 3, 4, 5 stars text changing
        for index in 1 ..< 5 {
            AddReviewPageQuery.reviewSliderQuery.element.element(boundBy: index).tap()
            switch index {
            case 1:
                waitForElementToBeDisplayed(AddReviewPage.twoStars.element)
                XCTAssert(AddReviewPage.twoStars.element.exists, "Two star text is not displayed")
            case 2:
                waitForElementToBeDisplayed(AddReviewPage.threeStars.element)
                XCTAssert(AddReviewPage.threeStars.element.exists, "Three star text is not displayed")
            case 3:
                waitForElementToBeDisplayed(AddReviewPage.fourStars.element)
                XCTAssert(AddReviewPage.fourStars.element.exists, "Four star text is not displayed")
            case 4:
                waitForElementToBeDisplayed(AddReviewPage.fiveStars.element)
                XCTAssert(AddReviewPage.fiveStars.element.exists, "Five star text is not displayed")
            default:
                XCTFail("Unexpected star rating")
            }
        }
    }
    
    //*******************************************************
    // Description: Check saving empty review via SAVE button
    //*******************************************************
    func testSaveEmptyReview() {
        //Wait for reviews page to be loaded, checking the company name
        waitForElementToBeDisplayed(ReviewsPage.restaurantNameText.element)
        
        //Go to add review page and wait for it to load
        ReviewsPageQuery.reviewSliderQuery.element.element(boundBy: 1).tap()
        waitForElementToBeDisplayed(AddReviewPage.twoStars.element)
        
        //Tap on Save button and verify the alert content
        NavBarButtons.saveButton.element.tap()
        waitForElementToBeDisplayed(AlertMessage.titleText.element)
        XCTAssert(AlertMessage.contentText.element.exists, "Alert text content is not displayed")
        XCTAssert(AlertMessage.okayButton.element.exists, "Alert okay button is not displayed")
        XCTAssert(AlertMessage.titleText.element.exists, "Alert text content is not displayed")
        
        //Confirm the alert and wait for reviews page to load
        AlertMessage.okayButton.element.tap()
        waitForElementToBeDisplayed(ReviewsPage.describeYourExperienceButton.element)
        
        //Verify if review was saved and UI elements are displayed according to previous steps
        XCTAssert(ReviewsPage.describeYourExperienceButton.element.exists, "Describe your experience button is not displayed for saving empty review")
        XCTAssert(!ReviewsPage.rateAndReviewText.element.exists, "Rate and review default text is displayed even if an empty saved review exists")
        XCTAssert(ReviewsPage.yourReviewText.element.exists, "Your review text is not displayed even if an empty saved review exists")
        XCTAssertEqual(AddedReviewFrame.reviwerNameText.element.label, "Anonymous", "Anonymous reviewer name is not displayed")
        XCTAssertEqual(AddedReviewFrame.addedReviewTimeText.element.label, "1m ago - hitta.se", "Added review time is not displayed")
        XCTAssert(AddedReviewFrame.ratedStars.element.exists, "Added review stars is not displayed")
    }
    
    //*******************************************************************************************
    // Description: Check saving review when user name is filled and experience is empty via SAVE                  button
    //*******************************************************************************************
    func testSaveNameFilledReview() {
        //Wait for reviews page to be loaded, checking the company name
        waitForElementToBeDisplayed(ReviewsPage.restaurantNameText.element)
        
        //Go to add review page and wait for it to load
        ReviewsPageQuery.reviewSliderQuery.element.element(boundBy: 2).tap()
        waitForElementToBeDisplayed(AddReviewPage.threeStars.element)
        
        //Fill in user name
        AddReviewPage.yourNameTextField.element.clearAndEnterText(text: "Horea")
        
        //Tap on Save button, confirm the alert and wait for reviews page to load
        NavBarButtons.saveButton.element.tap()
        waitForElementToBeDisplayed(AlertMessage.titleText.element)
        AlertMessage.okayButton.element.tap()
        waitForElementToBeDisplayed(ReviewsPage.describeYourExperienceButton.element)
        
        //Verify if review was saved and UI elements are displayed according to previous steps
        XCTAssert(ReviewsPage.describeYourExperienceButton.element.exists, "Describe your experience button is not displayed")
        XCTAssert(!ReviewsPage.rateAndReviewText.element.exists, "Rate and review default text is displayed even if a review exists")
        XCTAssert(ReviewsPage.yourReviewText.element.exists, "Your review text is not displayed even if a review exists")
        XCTAssertEqual(AddedReviewFrame.reviwerNameText.element.label, "Horea", "Reviewer name is not displayed")
        XCTAssertEqual(AddedReviewFrame.addedReviewTimeText.element.label, "1m ago - hitta.se", "Added review time is not displayed")
        XCTAssert(AddedReviewFrame.ratedStars.element.exists, "Added review stars is not displayed")
    }
    
    //*******************************************************************************************
    // Description: Check saving review when experience is filled and user name is empty via SAVE                  button
    //*******************************************************************************************
    func testSaveDescriptionFilledReview() {
        //Wait for reviews page to be loaded, checking the company name
        waitForElementToBeDisplayed(ReviewsPage.restaurantNameText.element)
        
        //Go to add review page and wait for it to load
        ReviewsPageQuery.reviewSliderQuery.element.element(boundBy: 3).tap()
        waitForElementToBeDisplayed(AddReviewPage.fourStars.element)
        
        //Fill in user experience
        AddReviewPage.experienceTextView.element.clearAndEnterText(text: "My description is here")
        
        //Tap on Save button, confirm the alert and wait for reviews page to load
        NavBarButtons.saveButton.element.tap()
        waitForElementToBeDisplayed(AlertMessage.titleText.element)
        AlertMessage.okayButton.element.tap()
        waitForElementToBeDisplayed(AddedReviewFrame.ratedStars.element)
        
        //Verify if review was saved and UI elements are displayed according to previous steps
        XCTAssert(!ReviewsPage.describeYourExperienceButton.element.exists, "Describe your experience button is displayed for review")
        XCTAssertEqual(AddedReviewFrame.reviewDescription.element.label, "My description is here", "Experience text is not displayed for review")
        XCTAssert(!ReviewsPage.rateAndReviewText.element.exists, "Rate and review default text is displayed even if a review exists")
        XCTAssert(ReviewsPage.yourReviewText.element.exists, "Your review text is not displayed even if a review exists")
        XCTAssertEqual(AddedReviewFrame.reviwerNameText.element.label, "Anonymous", "Reviewer name is not displayed")
        XCTAssertEqual(AddedReviewFrame.addedReviewTimeText.element.label, "1m ago - hitta.se", "Added review time is not displayed")
        XCTAssert(AddedReviewFrame.ratedStars.element.exists, "Added review stars is not displayed")
    }
    
    //*******************************************************************************************
    // Description: Check saving review when user name and experience are filled via SAVE                          button
    //*******************************************************************************************
    func testSaveFullFilledReview() {
        //Wait for reviews page to be loaded, checking the company name
        waitForElementToBeDisplayed(ReviewsPage.restaurantNameText.element)
        
        //Go to add review page and wait for it to load
        ReviewsPageQuery.reviewSliderQuery.element.element(boundBy: 4).tap()
        waitForElementToBeDisplayed(AddReviewPage.fiveStars.element)
        
        //Fill in user name and experience
        AddReviewPage.experienceTextView.element.clearAndEnterText(text: "My description is here")
        AddReviewPage.yourNameTextField.element.clearAndEnterText(text: "Horea")
        
        //Tap on Save button, confirm the alert and wait for reviews page to load
        NavBarButtons.saveButton.element.tap()
        waitForElementToBeDisplayed(AlertMessage.titleText.element)
        AlertMessage.okayButton.element.tap()
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
}
