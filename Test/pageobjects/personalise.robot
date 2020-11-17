*** Settings ***
Documentation  Demo robot test scripts: Objects and actions on the personalise page

Library  SeleniumLibrary
Resource  ../resources/common.robot
Resource  ../resources/testdata.robot


*** Keywords ***

Headline on the personalise page
    [Documentation]  Checks the headline text "Search mental health resources.." on the service type page
    element should be visible  css:#root > div.question-three-container > div > div.title-description-container > h1
    element text should be  css:#root > div.question-three-container > div > div.title-description-container > h1  Search mental health resources & services that can help you feel better

Purpose text on the personalise page
    [Documentation]  Checks the text "Boost is here for you if you need trusted guidance on accessing.." on th service type page
    element should be visible  css:#root > div.question-three-container > div > div.title-description-container > h2
    element text should be   css:#root > div.question-three-container > div > div.title-description-container > h2  Boost is here for you if you need trusted guidance on accessing resources and services that can positively impact your mental health. We will guide you in finding the treatment and help you need.

Personalise question and the prompt is present
    [Documentation]  Checks if personalise question is present
    element should be visible  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > p.question-text
    element text should be  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > p.question-text  Personalise your results
    Prompt for the question in personalise page

Prompt for the question in personalise page
    [Documentation]  Checks the prompt under the personlise question
    element should be visible  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > p.question-subtext
    element text should be  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > p.question-subtext  select all that apply

Personalisation options are present
    [Documentation]  Checks if all the personalisation options are present
    sleep  1s
    element should be visible  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(3)
    element text should be   css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(3)  Under 18

    element should be visible  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(4)
    element text should be  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(4)  A student

    element should be visible  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(5)
    element text should be  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(5)  A parent

    element should be visible  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(6)
    element text should be  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(6)  LGBTQ+

    element should be visible  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(7)
    element text should be  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(7)  Unemployed

    element should be visible  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(8)
    element text should be  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(8)  A carer

    element should be visible  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(9)
    element text should be  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(9)  BAME


#    element should be visible
#    element text should be

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
    click element  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(3)
    sleep  1s

Select 'A student'
    click element  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(4)
    sleep  1s

Select 'A parent'
    click element  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(5)
    sleep  1s

Select 'LGBTQ+'
    click element  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(6)
    sleep  1s

Select 'Unemployed'
    click element  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(7)
    sleep  1s

Select 'A carer'
    click element  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(8)
    sleep  1s

Select 'BAME'
    click element  css:#root > div.question-three-container > div > div:nth-child(2) > div.select-container > button:nth-child(9)
    sleep  1s

Click on the next button
    click element  css:#root > div.question-three-container > div > div:nth-child(2) > div.bottom-navigation > button
    sleep  1s

Click on the back button
    click element  css:#root > div.question-three-container > div > div:nth-child(2) > div.bottom-navigation > svg
    sleep  1s
