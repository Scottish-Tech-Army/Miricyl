*** Settings ***
Documentation  Demo robot test scripts: Objects and actions on the homepage/Needs

Library  SeleniumLibrary
Resource  ../resources/common.robot
Resource  ../resources/testdata.robot



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
    go to  ${DEVSITE}


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
    element should be visible  css:#root > div.navbar-container > div > button
    element text should be  css:#root > div.navbar-container > div > button  Help!

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
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(3)  Addiction

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(4)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(4)  Anxiety, Anger or Stress

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(5)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(5)  Body image or Eating disorders

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(6)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(6)  Childhood abuse or Bullying

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(7)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(7)  Debt or Looking for Employment

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(8)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(8)  Domestic abuse or Sexual violence

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(9)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(9)  Low, Depressed or Lonely

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(10)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(10)  Parenting

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(11)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(11)  Relationship or Bereavement

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(12)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(12)  Sleeping problems

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(13)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(13)  Suicide or Self-harm

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(14)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(14)  Victim or Involved in Crime

    element should be visible  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(15)
    element text should be  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(15)  ZA-Future Need

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
    Select 'Childhood abuse or Bullying'
    Select 'addiction'
    Select 'Anxiety, Anger or Stress'
    Select 'Body image or eating disorders'
    Select 'Crime'
    Select 'Debt or Looking for Employment'
    Select 'Domestic Abuse'
    Select 'Low, Depressed or Lonely'
    Select 'LGBTQ+ or gender identity'
    Select 'Pregnancy and Parenting'
    Select 'Sleeping problems'
    Select 'Suicide or Self-harm'


Select 'Childhood abuse or Bullying'
    [Documentation]  Clicks on the 'Childhood abuse or Bullying' need
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(6)
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

Select 'Debt or Looking for Employment'
    [Documentation]  Clicks on the 'Debt or Unemployment' need
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(7)
    sleep  1s

Select 'Domestic Abuse'
    [Documentation]  Clicks on the 'Debt or 'Domestic Abuse' need
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(9)
    sleep  1s

Select 'Low, Depressed or Lonely'
    [Documentation]  Clicks on the 'Low, Depressed or Lonely' need
    click element  css:#root > div.question-one-container > div > div:nth-child(2) > div.select-container > button:nth-child(9)
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

