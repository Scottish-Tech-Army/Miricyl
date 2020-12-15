*** Settings ***
Documentation  Demo robot test scripts: Objects and actions on the serviceTypes page

Library  SeleniumLibrary
Resource  ../resources/common.robot
Resource  ../resources/testdata.robot
Resource  ../pageobjects/index.robot



########################################################################################################################
#############################################Service Types Page##################################################################
########################################################################################################################

*** Keywords ***

Headline on the service type page
    [Documentation]  Checks the headline text "Search mental health resources.." on the service type page
    element should be visible  css:#root > div.question-two-container > div > div.title-description-container > h1
    element text should be  css:#root > div.question-two-container > div > div.title-description-container > h1  Search mental health resources & services that can help you feel better

Purpose text on the service type page
    [Documentation]  Checks the text "Boost is here for you if you need trusted guidance on accessing.." on th service type page
    element should be visible  css:#root > div.question-two-container > div > div.title-description-container > h2
    element text should be   css:#root > div.question-two-container > div > div.title-description-container > h2  Boost is here for you if you need trusted guidance on accessing resources and services that can positively impact your mental health. We will guide you in finding the treatment and help you need.

Service Types question and the prompt is present
    [Documentation]  Checks if the service type question is present
    element should be visible  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > p.question-text
    element text should be  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > p.question-text  What types of support are you looking for?
    Prompt for the question in service types page

Prompt for the question in service types page
    [Documentation]  Checks the prompt under the needs question
    element should be visible  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > p.question-subtext
    element text should be  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > p.question-subtext  select all that apply

Service Types are listed on the page
    [Documentation]  Checks if all the service types are listed on the page
    element should be visible  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(3)
    element text should be  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(3)  Information

    element should be visible  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(4)
    element text should be  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(4)  Directory of local services

    element should be visible  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(5)
    element text should be  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(5)  Face to face

    element should be visible  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(6)
    element text should be  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(6)  Free services

    element should be visible  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(7)
    element text should be  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(7)  In a group

    element should be visible  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(8)
    element text should be  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(8)  Email or forum

    element should be visible  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(9)
    element text should be  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(9)  Telephone or zoom

    element should be visible  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(10)
    element text should be  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(10)  Chat or text

Select 'No' service type


Select 'all' service types
    [Documentation]  Selects all service types
    Select service type: Information
    Select service type: Talk to someone
    Select service type: Face-2-face
    Select service type: Financial help
    Select service type: Support groups
    Select service type: Self Help
    Select service type: Community care
    Select service type: Online support

Select service type: Information
    [Documentation]  selects information
    click element  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(3)
    sleep  1s

Select service type: Talk to someone
    [Documentation]  selects talk to someone service
    click element  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(4)
    sleep  1s

Select service type: Face-2-face
    [Documentation]  selects Face-2-face service
    click element  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(5)
    sleep  1s

Select service type: Financial help
    [Documentation]  selects Financial help service
    click element  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(6)
    sleep  1s

Select service type: Support groups
    [Documentation]  selects Support groups service
    click element  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(7)
    sleep  1s

Select service type: Self Help
    [Documentation]  selects Self help service
    click element  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(8)
    sleep  1s

Select service type: Community care
    [Documentation]  selects Community care service
    click element  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(9)
    sleep  1s

Select service type: Online support
    [Documentation]  selects Online support service
    click element  css:#root > div.question-two-container > div > div:nth-child(2) > div.select-container > button:nth-child(10)
    sleep  1s



Click on the back button
    [Documentation]  Clicks on the back button
    click element  css:#root > div.question-two-container > div > div:nth-child(2) > div.bottom-navigation > svg
    sleep  1s

Click on the Next button
    [Documentation]  CLicks on the next button on the Next buttom on the service type page
    element should be visible  css:#root > div.question-two-container > div > div:nth-child(2) > div.bottom-navigation > button
    element text should be  css:#root > div.question-two-container > div > div:nth-child(2) > div.bottom-navigation > button  Next
    click element  css:#root > div.question-two-container > div > div:nth-child(2) > div.bottom-navigation > button
    sleep  1s
