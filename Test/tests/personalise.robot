*** Settings ***
Resource  ../pageobjects/index.robot
Resource  ../pageobjects/servicetypes.robot
Resource  ../pageobjects/personalise.robot

Resource  ../resources/common.robot

Test Setup  begin test
Test Teardown  end test


*** Test Cases ***

Personlise page has the logo and help button on the header

    [Documentation]  Checks if header on the Service Types page is visible and the text is "Search mental health resources & services that can help you feel better" and is
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    Index.Click on the next button
    ServiceTypes.Click on the Next button
    Index.Header of the home page is as expected

Personlise page has the headline text and 'purpose' text
    [Documentation]  Checks the headline text on the Service Types page
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    Index.Click on the next button
    ServiceTypes.Click on the Next button
    Personalise.Headline on the personalise page
    Personalise.Purpose text on the personalise page

Personalise page has the question and the help text
    [Documentation]  Checks if the personalise question and the help text are present
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    Index.Click on the next button
    ServiceTypes.Click on the Next button
    Personalise.Personalise question and the prompt is present

Personlise options are listed on the personalise page
    [Documentation]  Checks if all the personalisation options are present
    [Tags]  Smoke  functional   end-2-end
    Index.Go to the MIRICYL home page
    Index.Click on the next button
    ServiceTypes.Click on the Next button
    Personalise.Personalisation options are present


Users are able to select all personalisation
    [Documentation]  User is able to select all personalisation options
    [Tags]  Smoke  functional   end-2-end  current
    Index.Go to the MIRICYL home page
    Index.Click on the next button
    ServiceTypes.Click on the Next button
    Personalise.Click on the back button
    ServiceTypes.Click on the next button
    Personalise.Select all personalisation options
    Personalise.Click on the next button


