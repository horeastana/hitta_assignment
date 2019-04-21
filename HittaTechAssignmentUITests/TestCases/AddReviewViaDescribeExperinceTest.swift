//
//  AddReviewViaDescribeExperinceTest.swift
//  HittaTechAssignmentUITests
//
//  Created by Horea Stana on 21/04/2019.
//  Copyright © 2019 Raluca Toadere. All rights reserved.
//

import XCTest

class EditReviewViaDescribeExperienceTest: BaseFunctions {
    
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
    // Description: Check edit reviewer experience,
    //              for an initial empty review, via SAVE button
    //**********************************************************
    func testEditEmptyReviewExperience() {
        //Wait for reviews page to be loaded, checking the company name
        waitForElementToBeDisplayed(ReviewsPage.restaurantNameText.element)
        
        //Go to add review page and wait for it to load
        ReviewsPageQuery.reviewSliderQuery.element.element(boundBy: 1).tap()
        waitForElementToBeDisplayed(AddReviewPage.twoStars.element)
        
        //Tap on Save button, confirm the alert and wait for reviews page to load
        NavBarButtons.saveButton.element.tap()
        waitForElementToBeDisplayed(AlertMessage.titleText.element)
        AlertMessage.okayButton.element.tap()
        waitForElementToBeDisplayed(ReviewsPage.describeYourExperienceButton.element)
        
        //Tap on Describe your experience button and wait for add review page to load
        ReviewsPage.describeYourExperienceButton.element.tap()
        waitForElementToBeDisplayed(AddReviewPage.twoStars.element)
        
        //Verify if "Anonymous" is displayed in user name field
        XCTAssertEqual(AddReviewPage.yourNameTextField.element.value as? String, "Anonymous", "Reviewer name is not displayed according to add review")
        
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
    
    //*******************************************************************
    // Description: Check edit reviewer experience and user name,
    //              for an initial empty review, via EXIT and SAVE button
    //*******************************************************************
    func testEditReviewViaExitAndSave() {
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
        
        //Tap on Describe your experience button and wait for add review page to load
        ReviewsPage.describeYourExperienceButton.element.tap()
        waitForElementToBeDisplayed(AddReviewPage.fiveStars.element)
        
        //Fill in user name
        AddReviewPage.yourNameTextField.element.clearAndEnterText(text: "Horea")
        
        //Tap on Close->Exit and save your review button and wait for reviews page to load
        NavBarButtons.closeButton.element.tap()
        waitForElementToBeDisplayed(SheetsQueryButtons.exitAndSaveButton.element)
        SheetsQueryButtons.exitAndSaveButton.element.tap()
        waitForElementToBeDisplayed(AddedReviewFrame.ratedStars.element)
        
        //Verify if Describe your experience button is displayed
        XCTAssert(ReviewsPage.describeYourExperienceButton.element.exists, "Describe your experience button is not displayed for review")
        
        //Verify if user name is displayed in saved review
        XCTAssertEqual(AddedReviewFrame.reviwerNameText.element.label, "Horea", "Reviewer name is not displayed")
        
        //Tap on Describe your experience button and wait for add review page to load
        ReviewsPage.describeYourExperienceButton.element.tap()
        waitForElementToBeDisplayed(AddReviewPage.fiveStars.element)
        
        //Verify if filled user name is displayed in edit review mode
        XCTAssertEqual(AddReviewPage.yourNameTextField.element.value as? String, "Horea", "Reviewer name is not displayed")
        
        //Fill in user experience
        AddReviewPage.experienceTextView.element.clearAndEnterText(text: "My description is here")
        
        //Tap on Close->Exit and save your review button and wait for reviews page to load
        NavBarButtons.closeButton.element.tap()
        waitForElementToBeDisplayed(SheetsQueryButtons.exitAndSaveButton.element)
        SheetsQueryButtons.exitAndSaveButton.element.tap()
        waitForElementToBeDisplayed(AddedReviewFrame.ratedStars.element)
        
        //Verify if review was saved and UI elements are displayed according to previous steps
        XCTAssert(!ReviewsPage.describeYourExperienceButton.element.exists, "Describe your experience button is displayed for review")
        XCTAssertEqual(AddedReviewFrame.reviewDescription.element.label, "My description is here", "Experience text is not displayed for review")
        XCTAssert(!ReviewsPage.rateAndReviewText.element.exists, "Rate and review default text is displayed even if a review exists")
        XCTAssert(ReviewsPage.yourReviewText.element.exists, "Your review text is not displayed even if a review exists")
        XCTAssertEqual(AddedReviewFrame.reviwerNameText.element.label, "Horea", "Reviewer name is not displayed")
        XCTAssertEqual(AddedReviewFrame.addedReviewTimeText.element.label, "1m ago - hitta.se", "Added review time is not displayed")
        XCTAssert(AddedReviewFrame.ratedStars.element.exists, "Added review stars is not displayed")
    }
    
    //***********************************************************************
    // Description: Check edit reviewer experience and user name,
    //              for an initial empty review, via EXIT WITHOUT SAVE button
    //***********************************************************************
    func testEditReviewViaExitWithoutSave() {
        //Wait for reviews page to be loaded, checking the company name
        waitForElementToBeDisplayed(ReviewsPage.restaurantNameText.element)
        
        //Go to add review page and wait for it to load
        ReviewsPageQuery.reviewSliderQuery.element.element(boundBy: 4).tap()
        waitForElementToBeDisplayed(AddReviewPage.fiveStars.element)
        
        //Tap on Close->Exit without save button and wait for reviews page to load
        NavBarButtons.closeButton.element.tap()
        waitForElementToBeDisplayed(SheetsQueryButtons.exitWithoutSaveButton.element)
        SheetsQueryButtons.exitWithoutSaveButton.element.tap()
        waitForElementToBeDisplayed(AddedReviewFrame.ratedStars.element)
        
        //Tap on Describe your experience button in order to edit the review, and wait for add review page to load
        ReviewsPage.describeYourExperienceButton.element.tap()
        waitForElementToBeDisplayed(AddReviewPage.fiveStars.element)
        
        //Fill in user name
        AddReviewPage.yourNameTextField.element.clearAndEnterText(text: "Horea")
        
        //Tap on Close->Exit without save button and wait for reviews page to load
        NavBarButtons.closeButton.element.tap()
        waitForElementToBeDisplayed(SheetsQueryButtons.exitWithoutSaveButton.element)
        SheetsQueryButtons.exitWithoutSaveButton.element.tap()
        waitForElementToBeDisplayed(AddedReviewFrame.ratedStars.element)
        
        //Verify if Describe your experience is displayed on reviews page
        XCTAssert(ReviewsPage.describeYourExperienceButton.element.exists, "Describe your experience button is not displayed for review")
        
        //Verify if user name is displayed in saved review
        XCTAssertEqual(AddedReviewFrame.reviwerNameText.element.label, "Horea", "Reviewer name is not displayed according to add review")
        
        //Tap on Describe your experience button in order to edit the review, and wait for add review page to load
        ReviewsPage.describeYourExperienceButton.element.tap()
        waitForElementToBeDisplayed(AddReviewPage.fiveStars.element)
        
        //Verify if user name is displayed in edit review mode
        XCTAssertEqual(AddReviewPage.yourNameTextField.element.value as? String, "Horea", "Reviewer name is not displayed")
        
        //Fill in user experience
        AddReviewPage.experienceTextView.element.clearAndEnterText(text: "My description is here")
        
        //Tap on Close->Exit without save button and wait for reviews page to load
        NavBarButtons.closeButton.element.tap()
        waitForElementToBeDisplayed(SheetsQueryButtons.exitWithoutSaveButton.element)
        SheetsQueryButtons.exitWithoutSaveButton.element.tap()
        waitForElementToBeDisplayed(AddedReviewFrame.ratedStars.element)
        
        //Verify if review was saved and UI elements are displayed according to previous steps
        XCTAssert(!ReviewsPage.describeYourExperienceButton.element.exists, "Describe your experience button is displayed for review")
        XCTAssertEqual(AddedReviewFrame.reviewDescription.element.label, "My description is here", "Describe your experience text is not displayed for review")
        XCTAssert(!ReviewsPage.rateAndReviewText.element.exists, "Rate and review default text is displayed even if a review exists")
        XCTAssert(ReviewsPage.yourReviewText.element.exists, "Your review text is not displayed even if a review exists")
        XCTAssertEqual(AddedReviewFrame.reviwerNameText.element.label, "Horea", "Reviewer name is not displayed")
        XCTAssertEqual(AddedReviewFrame.addedReviewTimeText.element.label, "1m ago - hitta.se", "Added review time is not displayed")
        XCTAssert(AddedReviewFrame.ratedStars.element.exists, "Added review stars is not displayed")
    }
    
    //***********************************************************
    // Description: Check edit reviewer experience and user name,
    //              for an initial empty review, via SAVE button
    //***********************************************************
    func testEditReviewViaSaveButton() {
        //Wait for reviews page to be loaded, checking the company name
        waitForElementToBeDisplayed(ReviewsPage.restaurantNameText.element)
        
        //Go to add review page and wait for it to load
        ReviewsPageQuery.reviewSliderQuery.element.element(boundBy: 4).tap()
        waitForElementToBeDisplayed(AddReviewPage.fiveStars.element)
        
        //Tap on Save button, confirm alert and wait for reviews page to load
        NavBarButtons.saveButton.element.tap()
        waitForElementToBeDisplayed(AlertMessage.titleText.element)
        AlertMessage.okayButton.element.tap()
        waitForElementToBeDisplayed(AddedReviewFrame.ratedStars.element)
        
        //Tap on Describe your experience button in order to edit the review, and wait for add review page to load
        ReviewsPage.describeYourExperienceButton.element.tap()
        waitForElementToBeDisplayed(AddReviewPage.fiveStars.element)
        
        //Fill in user name
        AddReviewPage.yourNameTextField.element.clearAndEnterText(text: "Horea")
        
        //Tap on Save button, confirm alert and wait for reviews page to load
        NavBarButtons.saveButton.element.tap()
        waitForElementToBeDisplayed(AlertMessage.titleText.element)
        AlertMessage.okayButton.element.tap()
        waitForElementToBeDisplayed(AddedReviewFrame.ratedStars.element)
        
        //Verify if Describe your experience button is displayed
        XCTAssert(ReviewsPage.describeYourExperienceButton.element.exists, "Describe your experience button is not displayed for review")
        
        //Verify if user name is displayed in reviews page
        XCTAssertEqual(AddedReviewFrame.reviwerNameText.element.label, "Horea", "Reviewer name is not displayed")
        
        //Tap on Describe your experience button in order to edit the review, and wait for add review page to load
        ReviewsPage.describeYourExperienceButton.element.tap()
        waitForElementToBeDisplayed(AddReviewPage.fiveStars.element)
        
        //Verify if user name is displayed in edit review mode
        XCTAssertEqual(AddReviewPage.yourNameTextField.element.value as? String, "Horea", "Reviewer name is not displayed in add review page")
        
        //Fill in user experience
        AddReviewPage.experienceTextView.element.clearAndEnterText(text: "My description is here")
        
        //Tap on Save button, confirm alert and wait for reviews page to load
        NavBarButtons.saveButton.element.tap()
        waitForElementToBeDisplayed(AlertMessage.titleText.element)
        AlertMessage.okayButton.element.tap()
        waitForElementToBeDisplayed(AddedReviewFrame.ratedStars.element)
        
        //Verify if review was saved and UI elements are displayed according to previous steps
        XCTAssert(!ReviewsPage.describeYourExperienceButton.element.exists, "Describe your experience button is displayed for review")
        XCTAssertEqual(AddedReviewFrame.reviewDescription.element.label, "My description is here", "Describe your experience text is not displayed for review")
        XCTAssert(!ReviewsPage.rateAndReviewText.element.exists, "Rate and review default text is displayed even if a review exists")
        XCTAssert(ReviewsPage.yourReviewText.element.exists, "Your review text is not displayed even if a review exists")
        XCTAssertEqual(AddedReviewFrame.reviwerNameText.element.label, "Horea", "Reviewer name is not displayed")
        XCTAssertEqual(AddedReviewFrame.addedReviewTimeText.element.label, "1m ago - hitta.se", "Added review time is not displayed")
        XCTAssert(AddedReviewFrame.ratedStars.element.exists, "Added review stars is not displayed")
    }
}
