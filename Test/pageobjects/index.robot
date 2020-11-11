*** Settings ***
Documentation  Demo robot test scripts: Objects and actions on the homepage/Needs

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
#############################################Service Types Page##################################################################
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

Headline on the homepage
    [Documentation]  Checks the headline text "Search mental health resources.."
    element should be visible  css:#root > div.question-one-container > div > div.title-description-container > h1
    element text should be  css:#root > div.question-one-container > div > div.title-description-container > h1  Search mental health resources & services that can help you feel better
    #root > div.question-two-container > div > div.title-description-container > h1

Purpose text on the homepage
    [Documentation]  Checks the text "Boost is here for you if you need trusted guidance on accessing.."
    element should be visible  css:#root > div.question-one-container > div > div.title-description-container > h2
    element text should be   css:#root > div.question-one-container > div > div.title-description-container > h2  Boost is here for you if you need trusted guidance on accessing resources and services that can positively impact your mental health. We will guide you in finding the treatment and help you need.


Home Page has the question and the prompt
    [Documentation]  Checks if the home has the question 'What can we help you with?' and the prompt 'select all that apply'
    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > p.question-text
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > p.question-text  What can we help you with?
    Prompt for the question is present

Prompt for the question is present
    [Documentation]  Checks the prompt under the needs question
    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > p.question-subtext
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > p.question-subtext  select all that apply

Ensure all the 'Needs' are listed on the home page
    [Documentation]  Checks if all the available 'Needs' are listed on the homepage

    #Checks if Abuse and Bullying is visible
    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(3)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(3)  Abuse or Bullying

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(4)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(4)  Addiction

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(5)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(5)  Anxiety, Anger or Stress

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(6)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(6)  Body image or Eating disorders

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(7)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(7)  Crime

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(8)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(8)  Debt or Unemployment

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(9)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(9)  Domestic Abuse

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(10)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(10)  Feeling low or Depressed

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(11)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(11)  LGBTQ+ or Gender identity

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(12)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(12)  Pregnancy and Parenting

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(13)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(13)  Sleeping problems

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(14)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(14)  Suicide or Self-harm

Click on the next button
    [Documentation]  Clicks on the next button on the page
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.bottom-navigation > button  Next
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.bottom-navigation > button
    sleep  3s

Click on the back button
    [Documentation]  Clicks on the back back button
    click element  xpath://body/div[@id='root']/div[2]/div[1]/div[2]/div[2]/*[1]
    sleep  3s

Select All 'Needs'
    [Documentation]  This will select all the needs available on the homepage
    Select 'Abuse or Bullying'
    Select 'addiction'
    Select 'Anxiety, Anger or Stress'
    Select 'Body image or eating disorders'
    Select 'Crime'
    Select 'Debt or Unemployment'
    Select 'Domestic Abuse'
    Select 'Feeling low or Depressed'
    Select 'LGBTQ+ or gender identity'
    Select 'Pregnancy and Parenting'
    Select 'Sleeping problems'
    Select 'Suicide or Self-harm'


Select 'Abuse or Bullying'
    [Documentation]  Clicks on the 'Abuse or bullying' need
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(3)
    sleep  1s

Select 'Addiction'
    [Documentation]  Clicks on the 'Addiction' need
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(4)
    sleep  1s

Select 'Anxiety, Anger or Stress'
    [Documentation]  Clicks on the 'Anxiety, Anger or Stress' need
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(5)
    sleep  1s

Select 'Body image or eating disorders'
    [Documentation]  Clicks on the 'Body image or eating disorders' need
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(6)
    sleep  1s

Select 'Crime'
    [Documentation]  Clicks on the 'Crime' need
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(7)
    sleep  1s

Select 'Debt or Unemployment'
    [Documentation]  Clicks on the 'Debt or Unemployment' need
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(8)
    sleep  1s

Select 'Domestic Abuse'
    [Documentation]  Clicks on the 'Debt or 'Domestic Abuse' need
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(9)
    sleep  1s

Select 'Feeling low or Depressed'
    [Documentation]  Clicks on the 'Feeling low or Depressed' need
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(10)
    sleep  1s

Select 'LGBTQ+ or gender identity'
    [Documentation]  Clicks on the 'LGBTQ+ or gender identity' need
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(11)
    sleep  1s

Select 'Pregnancy and Parenting'
    [Documentation]  Clicks on the 'Pregnancy and Parenting' need
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(12)
    sleep  1s
Select 'Sleeping problems'
    [Documentation]  Clicks on the 'Sleeping problems' need
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(13)
    sleep  1s

Select 'Suicide or Self-harm'
    [Documentation]  Clicks on the 'Suicide or Self-harm' need
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(14)
    sleep  1s

