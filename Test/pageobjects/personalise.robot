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
    Personalise question is present
    Prompt for the question in personalise page

Personalise question is present
    [Documentation]  Check if the personalise question is present
    element should be visible  id:question-title
    element text should be  id:question-title  Personalise your results


Prompt for the question in personalise page
    [Documentation]  Checks the prompt under the personlise question
    Index.Prompt for the question is present

Personalisation options are present
    [Documentation]  Checks if all the personalisation options are present
    sleep  1s
    element should be visible  id:Child(Under-18)
    element text should be   id:Child(Under-18)  Child(Under 18)

    element should be visible  id:18+
    element text should be   id:18+  18+

    element should be visible  id:A-student
    element text should be   id:A-student  A student

    element should be visible  id:A-parent
    element text should be   id:A-parent  A parent

    element should be visible  id:LGBTQ+
    element text should be   id:LGBTQ+  LGBTQ+

    element should be visible  id:Unemployed
    element text should be   id:Unemployed  Unemployed

    element should be visible  id:A-carer
    element text should be   id:A-carer  A carer

    element should be visible  id:BAME
    element text should be   id:BAME  BAME

Select all personalisation options
    [Documentation]  Selects all options from the persoanlisation question
    Select 'Child(Under-18)'
    Select '18+'
    Select 'A student'
    Select 'A parent'
    Select 'LGBTQ+'
    Select 'Unemployed'
    Select 'A carer'
    Select 'BAME'

Select 'Child(Under-18)'
    click element  id:Child(Under-18)
    sleep  1s

Select '18+'
    click element  id:18+
    sleep  1s

Select 'A student'
    click element  id:A-student
    sleep  1s

Select 'A parent'
    click element  id:A-parent
    sleep  1s

Select 'LGBTQ+'
    click element  id:LGBTQ+
    sleep  1s

Select 'Unemployed'
    click element  id:Unemployed
    sleep  1s

Select 'A carer'
    click element  id:A-carer
    sleep  1s

Select 'BAME'
    click element  id:BAME
    sleep  1s

Click on the next button
    Index.Click on the next button

Click on the back button
    ServiceTypes.Click on the back button

#Footer section
Ensure feedback text and link is present in the personalise page
    Feedback text is present on the 'Personalise' page
    Ensure feedback link is present on the 'Personalise' page

Feedback text is present on the 'Personalise' page
    [Documentation]  Checks the text on feedback
    element should be visible  css:#root > div > div.question-three-container.question-container > div.footer-wrapper > p.footer-feedback-text
    element text should be  css:#root > div > div.question-three-container.question-container > div.footer-wrapper > p.footer-feedback-text  Whilst we cannot provide support if you have any comments please email us feedback

Ensure feedback link is present on the 'Personalise' page
    element should be visible  css:#root > div > div.question-three-container.question-container > div.footer-wrapper > p.footer-feedback-text > a
    element text should be  css:#root > div > div.question-three-container.question-container > div.footer-wrapper > p.footer-feedback-text > a  feedback

Ensure Miricyl Address and Privacy Policy is present in the personalise
    Charity info is present on the 'Personalise' page
    Privay policy link is present on the 'Personalise' page

Charity info is present on the 'Personalise' page
    element should be visible  css:#root > div > div.question-three-container.question-container > div.footer-wrapper > p.footer-address-text
    element text should be  css:#root > div > div.question-three-container.question-container > div.footer-wrapper > p.footer-address-text  Miricyl SCIO Charity Number SC047522 Address 2 Eglinton Crescent, Edinburgh, EH12 5DH · Privacy Policy - Miricyl

Privay policy link is present on the 'Personalise' page
    element should be visible  css:#root > div > div.question-three-container.question-container > div.footer-wrapper > p.footer-address-text > a
    element text should be  css:#root > div > div.question-three-container.question-container > div.footer-wrapper > p.footer-address-text > a  Privacy Policy - Miricyl
