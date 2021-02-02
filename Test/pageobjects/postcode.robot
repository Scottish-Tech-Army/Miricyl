*** Settings ***
Documentation  Demo robot test scripts: Objects and actions on the postacode page

Library  SeleniumLibrary
Resource  ../resources/common.robot
Resource  ../resources/testdata.robot

########################################################################################################################
#############################################Location Page##################################################################
########################################################################################################################

*** Keywords ***

Headline on the location page
    [Documentation]  Checks the headline text "Search mental health resources.." on the service type page
    element should be visible  css:#root > div.question-four-container > div > div.title-description-container > h1
    element text should be  css:#root > div.question-four-container > div > div.title-description-container > h1  Search mental health resources & services that can help you feel better

Purpose text on the location page
    [Documentation]  Checks the text "Boost is here for you if you need trusted guidance on accessing.." on th service type page
    element should be visible  css:#root > div.question-four-container > div > div.title-description-container > h2
    element text should be   css:#root > div.question-four-container > div > div.title-description-container > h2  Boost is here for you if you need trusted guidance on accessing resources and services that can positively impact your mental health. We will guide you in finding the treatment and help you need.

Prompt for entering the postcode is present
    [Documentation]  Checks if the postcode question is present
    element should be visible  css:#root > div.question-four-container > div > div:nth-child(2) > div.select-container-q4 > p
    element text should be  css:#root > div.question-four-container > div > div:nth-child(2) > div.select-container-q4 > p  Enter the first part of your postcode to find services and support in your area
    Prompt for the question in service types page

Enter postcode
    [Documentation]  Enters postcode, takes an argument
    [Arguments]  ${postcode}
    input text  css:#root > div.question-four-container > div > div:nth-child(2) > div.select-container-q4 > input  ${postcode}

Click on the Next button
    [Documentation]  Clicks on the next button on the location page
    click element  css:#root > div.question-four-container > div > div:nth-child(2) > div.bottom-navigation > button
    sleep  2s

Click on the Back button
    click element  css:#root > div.question-four-container > div > div:nth-child(2) > div.bottom-navigation > svg
    sleep  1s
