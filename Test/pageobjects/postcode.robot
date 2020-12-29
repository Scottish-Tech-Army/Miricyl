*** Settings ***
Documentation  Demo robot test scripts: Objects and actions on the postacode page

Library  SeleniumLibrary
Resource  ../pageobjects/index.robot
Resource  ../pageobjects/servicetypes.robot
Resource  ../resources/common.robot
Resource  ../resources/testdata.robot

########################################################################################################################
#############################################Location Page##################################################################
########################################################################################################################

*** Keywords ***

Headline on the location page
    [Documentation]  Checks the headline text "Search mental health resources.." on the service type page
    Index.Headline on the page

Purpose text on the location page
    [Documentation]  Checks the text "Boost is here for you if you need trusted guidance on accessing.." on th service type page
    Index.Purpose text on the page

Prompt for entering the postcode is present
    [Documentation]  Checks if the postcode question is present
    element should be visible  css:#root > div.question-four-container > div > div:nth-child(2) > div.select-container-q4 > p
    element text should be  css:#root > div.question-four-container > div > div:nth-child(2) > div.select-container-q4 > p  Enter the first part of your postcode to find services and support in your area
    Prompt for the question in service types page

Enter postcode
    [Documentation]  Enters postcode, takes an argument
    [Arguments]  ${postcode}
    input text  xpath://*[@test-id="text-input-field"]  ${postcode}

Click on the Next button
    [Documentation]  Clicks on the next button on the location page
    Index.Click on the next button

Click on the Back button
    click element  css:#root > div.question-four-container > div > div:nth-child(2) > div.bottom-navigation > svg
    sleep  1s
