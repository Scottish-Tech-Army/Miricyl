*** Settings ***
Documentation  Demo robot test scripts: Objects and actions on the personalise page

Library  SeleniumLibrary
Resource  ../resources/common.robot
Resource  ../resources/testdata.robot
Resource  ../pageobjects/index.robot
Resource  ../pageobjects/servicetypes.robot


*** Keywords ***

Headline on the personalise page
    [Documentation]  Checks the headline text "Search mental health resources.." on the service type page
    Index.Headline on the page

Purpose text on the personalise page
    [Documentation]  Checks the text "Boost is here for you if you need trusted guidance on accessing.." on th service type page
    Index.Purpose text on the page

Personalise question and the prompt is present
    [Documentation]  Checks if personalise question is present
    element should be visible  xpath://*[@id="root"]/div[2]/div/div/div[2]/div[1]/p[1]
    element text should be  xpath://*[@id="root"]/div[2]/div/div/div[2]/div[1]/p[1]  Personalise your results
    Prompt for the question in personalise page

Prompt for the question in personalise page
    [Documentation]  Checks the prompt under the personlise question
    Index.Prompt for the question is present

Personalisation options are present
    [Documentation]  Checks if all the personalisation options are present
    sleep  1s
    element should be visible  id:Under 18
    element text should be   id:Under 18  Under 18

    element should be visible  id:A student
    element text should be   id:A student  A student

    element should be visible  id:A parent
    element text should be   id:A parent  A parent

    element should be visible  id:LGBTQ+
    element text should be   id:LGBTQ+  LGBTQ+


    element should be visible  id:Unemployed
    element text should be   id:Unemployed  Unemployed

    element should be visible  id:A carer
    element text should be   id:A carer  A carer

    element should be visible  id:BAME
    element text should be   id:BAME  BAME

Select all personalisation options
    [Documentation]  Selects all options from the persoanlisation question
    Select 'Under 18'
    Select 'A student'
    Select 'A parent'
    Select 'LGBTQ+'
    Select 'Unemployed'
    Select 'A carer'
    Select 'BAME'

Select 'Under 18'
    click element  id:Under 18
    sleep  1s

Select 'A student'
    click element  id:A student
    sleep  1s

Select 'A parent'
    click element  id:A parent
    sleep  1s

Select 'LGBTQ+'
    click element  id:LGBTQ+
    sleep  1s

Select 'Unemployed'
    click element  id:Unemployed
    sleep  1s

Select 'A carer'
    click element  id:A carer
    sleep  1s

Select 'BAME'
    click element  id:BAME
    sleep  1s

Click on the next button
    Index.Click on the next button

Click on the back button
    ServiceTypes.Click on the back button
