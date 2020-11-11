*** Settings ***
Documentation  Demo robot test scripts: Objects and actions on the personalise page

Library  SeleniumLibrary
Resource  ../resources/common.robot
Resource  ../resources/testData.robot


*** Keywords ***

Headline on the personalise page
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
