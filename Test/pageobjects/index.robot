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

Title is Miricyl
    [Documentation]  Title is React App
    title should be  Miricyl




########################################################################################################################
#############################################Index/Needs Page##################################################################
########################################################################################################################


Go to the MIRICYL home page
    [Documentation]  User is taken to the landing page
    go to  ${DEVURL}
    


Header of the home page is as expected
    [Documentation]  Checks if the header is "Search mental health resources & services that can help you feel better"
    Logo is present
    Help button is present

Logo is present
    [Documentation]  Checks the Boost logo
    element should be visible  css:#root > div.navbar-container > div > div > a > h1
    element text should be  css:#root > div.navbar-container > div > div > a > h1  Miricyl

Help button is present
    [Documentation]  Checks if the Help button is present
    element should be visible  id:help-button
    element text should be  id:help-button  Help Now!

Headline on the page
    [Documentation]  Checks the headline text "Search mental health resources.."
    element should be visible  id:main-header
    element text should be  id:main-header  Search mental health resources & services that can help you feel better


Purpose text on the page
    [Documentation]  Checks the text "Boost is here for you if you need trusted guidance on accessing.."
    element should be visible  id:subheader
    element text should be   id:subheader  Miricyl is here for you if you need trusted guidance on accessing resources and services that can positively impact your mental health. We will guide you in finding the treatment and help you need.


Home Page has the question and the prompt
    [Documentation]  Checks if the home has the question 'What can we help you with?' and the prompt 'select all that apply'
    element should be visible  xpath://*[@id="root"]/div[2]/div/div/div[2]/div[1]/p[1]
    element text should be  xpath://*[@id="root"]/div[2]/div/div/div[2]/div[1]/p[1]  What can we help you with?
    Prompt for the question is present

Prompt for the question is present
    [Documentation]  Checks the prompt under the needs question
    element should be visible  xpath://*[@id="root"]/div[2]/div/div/div[2]/div[1]/p[2]
    element text should be  xpath://*[@id="root"]/div[2]/div/div/div[2]/div[1]/p[2]  select all that apply

Ensure all the 'Needs' are listed on the home page
    [Documentation]  Checks if all the available 'Needs' are listed on the homepage
    Addiction
    Anxiety, Anger or Stress
    Body image or Eating disorders
    Childhood abuse or Bullying
    Debt or Looking for Employment
    Domestic abuse or Sexual violence
    Low, Depressed or Lonely
    Parenting
    Relationship or Bereavement
    Sleeping problems
    Suicide or Self-harm
    Victim or Involved in Crime

Addiction
    element should be visible  id:Addiction
    element text should be  id:Addiction  Addiction

Anxiety, Anger or Stress
    element should be visible  id:Anxiety,-Anger-or-Stress
    element text should be  id:Anxiety,-Anger-or-Stress  Anxiety, Anger or Stress

Body image or Eating disorders
    element should be visible  id:Body-image-or-Eating-disorders
    element text should be  id:Body-image-or-Eating-disorders  Body image or Eating disorders

Childhood abuse or Bullying
    element should be visible  id:Childhood-abuse-or-Bullying
    element text should be  id:Childhood-abuse-or-Bullying  Childhood abuse or Bullying

Debt or Looking for Employment
    element should be visible  id:Debt-or-Looking-for-Employment
    element text should be  id:Debt-or-Looking-for-Employment  Debt or Looking for Employment

Domestic abuse or Sexual violence
    element should be visible  id:Domestic-abuse-or-Sexual-violence
    element text should be  id:Domestic-abuse-or-Sexual-violence  Domestic abuse or Sexual violence

Low, Depressed or Lonely
    element should be visible  id:Low,-Depressed-or-Lonely
    element text should be  id:Low,-Depressed-or-Lonely  Low, Depressed or Lonely

Parenting
    element should be visible  id:Parenting
    element text should be  id:Parenting  Parenting

Relationship or Bereavement
    element should be visible  id:Relationship-or-Bereavement
    element text should be  id:Relationship-or-Bereavement  Relationship or Bereavement

Sleeping problems
    element should be visible  id:Sleeping-problems
    element text should be  id:Sleeping-problems  Sleeping problems

Suicide or Self-harm
    element should be visible  id:Suicide-or-Self-harm
    element text should be  id:Suicide-or-Self-harm  Suicide or Self-harm

Victim or Involved in Crime
    element should be visible  id:Victim-or-Involved-in-Crime
    element text should be  id:Victim-or-Involved-in-Crime  Victim or Involved in Crime

ZA-Future Need
    element should be visible  id:ZA-Future Need
    element text should be  id:ZA-Future Need  ZA-Future Need


Click on the next button
    [Documentation]  Clicks on the next button on the page
    element text should be  id:next-button  Next
    click element  id:next-button
    sleep  3s

Click on the back button
    [Documentation]  Clicks on the back back button
    click element  id:back-button
    sleep  3s

Select All 'Needs'
    [Documentation]  This will select all the needs available on the homepage
    Select 'Addiction'
    Select 'Anxiety, Anger or Stress'
    Select 'Body image or Eating disorders'
    Select 'Childhood abuse or Bullying'
    Select 'Debt or Looking for Employment'
    Select 'Domestic abuse or Sexual violence'
    Select 'Low, Depressed or Lonely'
    Select 'Parenting'
    Select 'Relationship or Bereavement'
    Select 'Sleeping problems'
    Select 'Suicide or Self-harm'
    Select 'Victim or Involved in Crime'

Select 'Addiction'
    [Documentation]  Selects 'Addiction'
    click element  id:Addiction
    sleep  1s

Select 'Anxiety, Anger or Stress'
    [Documentation]  Selects 'Anxiety, Anger or Stress'
    click element  id:Anxiety,-Anger-or-Stress

Select 'Body image or Eating disorders'
    [Documentation]  Selects 'Body image or Eating disorders'
    click element  id:Body-image-or-Eating-disorders

Select 'Childhood abuse or Bullying'
    [Documentation]  Selects 'Childhood abuse or Bullying'
    click element  id:Childhood-abuse-or-Bullying

Select 'Debt or Looking for Employment'
    [Documentation]  Selects 'Debt or Looking for Employment'
    click element  id:Debt-or-Looking-for-Employment

Select 'Domestic abuse or Sexual violence'
    [Documentation]  Selects 'Domestic abuse or Sexual violence'
    click element  id:Domestic-abuse-or-Sexual-violence

Select 'Low, Depressed or Lonely'
    [Documentation]  Selects 'Low, Depressed or Lonely'
    click element  id:Low,-Depressed-or-Lonely

Select 'Parenting'
    [Documentation]  Selects 'Parenting'
    click element  id:Parenting

Select 'Relationship or Bereavement'
    [Documentation]  Selects 'Relationship or Bereavement'
    click element  id:Relationship-or-Bereavement

Select 'Sleeping problems'
    [Documentation]  Selects 'Sleeping problems'
    click element  id:Sleeping-problems

Select 'Suicide or Self-harm'
    [Documentation]  Selects 'Suicide or Self-harm'
    click element  id:Suicide-or-Self-harm

Select 'Victim or Involved in Crime'
    [Documentation]  Selects 'Victim or Involved in Crime'
    click element  id:Victim-or-Involved-in-Crime

Select 'ZA-Future Need'
    [Documentation]  Selects 'ZA-Future Need'
    click element  id:ZA-Future Need


######Footer Section###############


Ensure feedback text and link in present

    Feedback text is present
    Ensure feedback link is present

Feedback text is present
    [Documentation]  Checks the text on feedback
    element should be visible  css:#root > div:nth-child(2) > div > div.footer-wrapper > p.footer-feedback-text
    element text should be  css:#root > div:nth-child(2) > div > div.footer-wrapper > p.footer-feedback-text  Whilst we cannot provide support if you have any comments please email us feedback

Ensure feedback link is present
    element should be visible  css:#root > div:nth-child(2) > div > div.footer-wrapper > p.footer-feedback-text > a
    element text should be  css:#root > div:nth-child(2) > div > div.footer-wrapper > p.footer-feedback-text > a  feedback

Ensure Miricyl Address and Privacy Policy is present
    Charity info is present
    Privay policy link is present

Charity info is present
    element should be visible  css:#root > div:nth-child(2) > div > div.footer-wrapper > p.footer-address-text
    element text should be  css:#root > div:nth-child(2) > div > div.footer-wrapper > p.footer-address-text  Miricyl SCIO Charity Number SC047522 Address 2 Eglinton Crescent, Edinburgh, EH12 5DH · Privacy Policy - Miricyl

Privay policy link is present
    element should be visible  css:#root > div:nth-child(2) > div > div.footer-wrapper > p.footer-address-text > a
    element text should be  css:#root > div:nth-child(2) > div > div.footer-wrapper > p.footer-address-text > a  Privacy Policy - Miricyl

