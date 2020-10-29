*** Settings ***
Documentation  Demo robot test scripts: Objects and actions on the homepage

Library  SeleniumLibrary
Resource  ../resources/common.robot
Resource  ../resources/testData.robot



*** Variables ***
#Here you define variables used in your test as needed. Some examples as below


*** Keywords ***

#User is able to go to the landing page
    [Documentation]  Takes the user to the landing page
    Go to the MIRICYL home page

Title is React App
    [Documentation]  Title is React App
    title should be  React App




########################################################################################################################
#############################################Landing Page##################################################################
########################################################################################################################


Go to the MIRICYL home page
    [Documentation]  User is taken to the landing page
    go to  ${DEVURL}


Header of the home page is as expected
    [Documentation]  Checks if the header is "Search mental health resources & services that can help you feel better"
#    element should be visible  css:#root > div > h1
#    element text should be  css:#root > div > h1  Search mental health resources & services that can help you feel better
    Logo is present
    Help button is present

Logo is present
    [Documentation]  Checks the Boost logo
    page should contain image  logo

Help button is present
    [Documentation]  Checks if the Help button is present
    element should be visible  css:body:nth-child(2) div:nth-child(2) div.navbar-container > button.help-button
    element text should be  css:body:nth-child(2) div:nth-child(2) div.navbar-container > button.help-button  Help!


Home Page has the question and the prompt
    [Documentation]  Checks if the home has the question 'What can we help you with?' and the prompt 'select all that apply'
    element should be visible  css:#root > div > div > p.question-one-text
    element text should be  css:#root > div > div > p.question-one-text  What can we help you with?
    element text should be  css:#root > div > div > p.question-one-subtext  select all that apply

Ensure key services are listed on the home page
    [Documentation]  Checks if all the available services are listed on the homepage

    #Checks if Abuse and Bullying is visible
    element should be visible  css:#root > div > div > button:nth-child(3)
    element text should be  css:#root > div > div > button:nth-child(3)  Abuse or bullying

    element should be visible  css:#root > div > div > button:nth-child(4)
    element text should be  css:#root > div > div > button:nth-child(4)  Addiction

    element should be visible  css:#root > div > div > button:nth-child(5)
    element text should be  css:#root > div > div > button:nth-child(5)  Anxiety, anger or stress

    element should be visible  css:#root > div > div > button:nth-child(6)
    element text should be  css:#root > div > div > button:nth-child(6)  Body image or eating disorders

    element should be visible  css:#root > div > div > button:nth-child(7)
    element text should be  css:#root > div > div > button:nth-child(7)  Crime

    element should be visible  css:#root > div > div > button:nth-child(8)
    element text should be  css:#root > div > div > button:nth-child(8)  Debt or unemployment

    element should be visible  css:#root > div > div > button:nth-child(9)
    element text should be  css:#root > div > div > button:nth-child(9)  Domestic Abuse

    element should be visible  css:#root > div > div > button:nth-child(10)
    element text should be  css:#root > div > div > button:nth-child(10)  Feeling low or depressed

    element should be visible  css:#root > div > div > button:nth-child(11)
    element text should be  css:#root > div > div > button:nth-child(11)  LGBTQ+ or gender identity

    element should be visible  css:#root > div > div > button:nth-child(12)
    element text should be  css:#root > div > div > button:nth-child(12)  Pregnancy and Parenting

    element should be visible  css:#root > div > div > button:nth-child(13)
    element text should be  css:#root > div > div > button:nth-child(13)  Sleeping problems

    element should be visible  css:#root > div > div > button:nth-child(14)
    element text should be  css:#root > div > div > button:nth-child(14)  Suicide or Self-harm

Click on the next button
    [Documentation]  Clicks on the next button on the page
    element text should be  css:#root > div > div > button.next-button  Next
    click element  css:#root > div > div > button.next-button
    sleep  3s

Click on the back button
    [Documentation]  Clicks on the back back button
    click element   css:#root > div > div > div > svg

Select 'Abuse or bullying' service
    [Documentation]  Clicks on the 'Abuse or bullying' service
    click element  css:#root > div > div > button:nth-child(3)
    sleep  1s

Select 'Addiction' service
    [Documentation]  Clicks on the 'Addiction' service
    click element  css:#root > div > div > button:nth-child(4)
    sleep  1s

#Select 'Anxiety, anger or stress' service
#
#
#Select 'Body image or eating disorders' service
#
#
#
#Select 'Crime' service
#
#Select 'Debt or unemployment' service
#
#Select 'Domestic Abuse' service
#
#Select 'Feeling low or depressed' service
#
#
#Select 'LGBTQ+ or gender identity' service
#
#Select 'Pregnancy and Parenting' service
#
#Select 'Sleeping problems' service
#
#Select 'Suicide or Self-harm' service
#
