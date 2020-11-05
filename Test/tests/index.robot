*** Settings ***
Resource  ../pageobjects/index.robot
Resource  ../resources/common.robot

Test Setup  begin test
Test Teardown  end test


*** Test Cases ***
Miricyl Landing Page Checks
    [Documentation]  This checks the miricyl landing page.
    [Tags]  Smoke  functional  end-2-end  current
    Index.Go to the MIRICYL home page
    Index.Title is React App

Header is visibile and has logo and help button
    [Documentation]  Checks if header on the homepage is visible and the text is "Search mental health resources & services that can help you feel better" and is
    [Tags]  Smoke  functional  end-2-end  current
    Index.Go to the MIRICYL home page
    Index.Header of the home page is as expected

Home page has the question and the help text
    [Documentation]  Checks if the question is present on the homepage and its help text
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    Index.Home Page has the question and the prompt

Check if the next button works
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    Index.Click on the next button

Check if back button works
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    Index.Click on the next button
    BuiltIn.Sleep  5s
    Index.Click on the back button

Check if all the services are listed on the homepage
    [Documentation]  Checks is all the services are visible and texts are as defined
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    BuiltIn.Sleep  5s
    Index.Ensure key services are listed on the home page
    Index.Select 'Abuse or bullying' service
    Index.Select 'Addiction' service


*** Keywords ***













