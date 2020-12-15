*** Settings ***
Resource  ../pageobjects/index.robot
Resource  ../pageobjects/servicetypes.robot
Resource  ../pageobjects/personalise.robot
Resource  ../pageobjects/postcode.robot
Resource  ../resources/common.robot
Resource  ../resources/common.robot

Test Setup  begin test
Test Teardown  end test


*** Test Cases ***


Postcode page has the logo and help button on the header
    [Documentation]  Checks if header on the postcode page is visible and the text is "Search mental health resources & services that can help you feel better" and is
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    Index.Click on the next button
    ServiceTypes.Click on the Next button
    Personalise.Click on the next button
    Index.Header of the home page is as expected

Postcode page has the headline text and 'purpose' text
    [Documentation]  Checks the headline text on the postcode page
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    Index.Click on the next button
    ServiceTypes.Click on the Next button
    Personalise.Click on the next button
    Postcode.Headline on the location page
    Postcode.Purpose text on the location page
