*** Settings ***

Resource        ./index.robot
Resource        ./serviceTypes.robot
Resource        ./common.robot

Test Setup  begin test
Test Teardown  end test


*** Test Cases ***


Service Types page has the logo and help button on the header
    [Documentation]  Checks if header on the Service Types page is visible and the text is "Search mental health resources & services that can help you feel better" and is
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    Index.Click on the next button
    Index.Header of the home page is as expected

Service Types page has the headline text and 'purpose' text
    [Documentation]  Checks the headline text on the Service Types page
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    Index.Click on the next button
    ServiceTypes.Headline on the service type page
    ServiceTypes.Purpose text on the service type page


Service Types page has the question and the help text
    [Documentation]  Checks if the question is present on the Service Types page and its help text
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    Index.Click on the next button
    ServiceTypes.Service Types question and the prompt is present

All the 'Service Types' are listed on the service page
    [Documentation]  Checks if all the services are listed on the page. Also checks if the back and the next button on this page works
    [Tags]  Smoke  functional  end-2-end
    Index.Go to the MIRICYL home page
    Index.Click on the next button
    ServiceTypes.Service Types are listed on the page
    ServiceTypes.Click on the back button
    Index.Click on the next button
    ServiceTypes.Click on the Next button

Users are able to select all the service types
    [Documentation]  Users can select all service types
    [Tags]  Smoke  functional  end-2-end  current
    Index.Go to the MIRICYL home page
    Index.Click on the next button
    ServiceTypes.Select 'all' service types
    ServiceTypes.Click on the Next button


