*** Settings ***
Documentation  Demo robot test scripts: Objects and actions on the serviceTypes page

Library  SeleniumLibrary
Resource  ../resources/common.robot
Resource  ../resources/testdata.robot
Resource  ../pageobjects/index.robot



*** Keywords ***


*** Keywords ***

Headline on the service type page
    [Documentation]  Checks the headline text "Search mental health resources.." on the service type page
    element should be visible  xpath://*[@id="root"]/div[2]/div/div/div[1]/h1
    element text should be  css:#root > div.question-two-container > div > div.title-description-container > h1  Search mental health resources & services that can help you feel better

Purpose text on the service type page
    [Documentation]  Checks the text "Boost is here for you if you need trusted guidance on accessing.." on th service type page
    element should be visible  css:#root > div.question-two-container > div > div.title-description-container > h2
    element text should be   css:#root > div.question-two-container > div > div.title-description-container > h2  Boost is here for you if you need trusted guidance on accessing resources and services that can positively impact your mental health. We will guide you in finding the treatment and help you need.

Service Types question and the prompt is present
    [Documentation]  Checks if the service type question is present
    element should be visible  xpath://*[@id="root"]/div[2]/div/div/div[2]/div[1]/p[1]
    element text should be  xpath://*[@id="root"]/div[2]/div/div/div[2]/div[1]/p[1]  What types of support are you looking for?
    Prompt for the question in service types page

Prompt for the question in service types page
    [Documentation]  Checks the prompt under the needs question
    Prompt for the question is present


Service Types are listed on the page
    element should be visible  id:Information
    element text should be  id:Information  Information

    element should be visible  id:Directory of local services
    element text should be  id:Directory of local services  Directory of local services

    element should be visible  id:Face to face
    element text should be  id:Face to face  Face to face
    element text should be  id:Free services  Free services

    element should be visible  id:In a group
    element text should be  id:In a group  In a group

    element should be visible  id:Email or forum
    element text should be  id:Email or forum  Email or forum

    element should be visible  id:Telephone or zoom
    element text should be  id:Telephone or zoom  Telephone or zoom

    element should be visible  id:Chat or text
    element text should be  id:Chat or text  Chat or text

    element should be visible  id:Information
    element text should be  id:Information  Information



Select 'No' service type


Select 'all' service types
    [Documentation]  Selects all service types
    Select service type: Information
    Select service type: Directory of local services
    Select service type: Face to face
    Select service type: Free services
    Select service type: In a group
    Select service type: Email or forum
    Select service type: Telephone or zoom
    Select service type: Chat or text

Select service type: Information
    [Documentation]  selects information
    click element  id:Information
    sleep  1s

Select service type: Directory of local services
    [Documentation]  selects Directory of local services
    click element  id:Directory of local services
    sleep  1s

Select service type: Face to face
    [Documentation]  selects Face to face service
    click element  id:Face to face
    sleep  1s

Select service type: Free services
    [Documentation]  selects Free services
    click element  id:Free services
    sleep  1s

Select service type: In a group
    [Documentation]  selects In a group service
    click element  id:In a group
    sleep  1s

Select service type: Email or forum
    [Documentation]  selects Email or forum
    click element  id:Email or forum
    sleep  1s

Select service type: Telephone or zoom
    [Documentation]  selects Telephone or zoom
    click element  id:Telephone or zoom
    sleep  1s

Select service type: Chat or text
    [Documentation]  selects Chat or text
    click element  id:Chat or text
    sleep  1s

Click on the back button
    [Documentation]  Clicks on the back button
    click element  css:#root > div:nth-child(2) > div > div > div:nth-child(2) > div.bottom-navigation > svg
    sleep  1s

Click on the Next button
    [Documentation]  CLicks on the next button on the Next buttom on the service type page
    Index.Click on the next button
