*** Settings ***
Resource  /home/vsts/work/r1/a/extracted/Test/pageObjects/index.robot
Resource  /home/vsts/work/r1/a/extracted/Test/resources/common.robot

Test Setup  begin test
Test Teardown  end test

########################################################################################################################
#############################################Home Page Tests##################################################################
########################################################################################################################

*** Test Cases ***
Miricyl Landing Page Checks
    [Documentation]  This checks the miricyl landing page.
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    Index.Title is React App

Home page has the logo and help button on the header
    [Documentation]  Checks if header on the homepage is visible and the text is "Search mental health resources & services that can help you feel better" and is
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    Index.Header of the home page is as expected

Home page has the headline text and 'purpose' text
    [Documentation]  Checks the headline text on the page
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    Index.Headline on the homepage
    Index.Purpose text on the homepage


Home page has the question and the help text
    [Documentation]  Checks if the question is present on the homepage and its help text
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    Index.Home Page has the question and the prompt

User is able see all the 'Needs' listed on the homepage
    [Documentation]  Checks if all the 'Need' are visible and texts are as defined
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    sleep  3s
    Index.Ensure all the 'Needs' are listed on the home page
    Index.Click on the next button

User is able to select all the 'Need' and proceed to 'Service types'
    [Documentation]  Checks if all the 'Need' could be clicked on and go to the next page
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    sleep  3s
    Index.Select All 'Needs'
    Index.Click on the next button


User can proceed to 'Service types' without selecting a 'Need'
    [Documentation]  User should be allowed to proceed to 'Service types' even without selecting a 'Need'
    [Tags]  Smoke  functional  end-2-end  current
    Index.Go to the MIRICYL home page
    sleep  3s
    Index.Click on the next button

#User can select one 'Need' and proceed to 'Service types'
#
#User can select one or more 'Need' and proceed to 'Service types'















