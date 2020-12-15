*** Settings ***
Resource  ../pageobjects/index.robot
Resource  ../pageobjects/servicetypes.robot
Resource  ../pageobjects/personalise.robot
Resource  ../pageobjects/postcode.robot
Resource  ../pageobjects/results.robot
Resource  ../resources/common.robot
Resource  ../resources/common.robot

Test Setup  begin test
Test Teardown  end test


*** Test Cases ***

Use case 1: User makes no selection returns which returns 48 National services
    [Documentation]  As detailed in confluence... update later
    [Tags]  current
    Index.Go to the MIRICYL home page
    Index.Click on the next button
    ServiceTypes.Click on the Next button
    Personalise.Click on the next button
    Postcode.Click on the Next button
    sleep  1s
    Results.Use case 1 returns 48 National services

Use case 2: Selecting 'Childhood abuse or Bullying' with no other options selected retuns 9 national services
    [Documentation]  As detailed in confluence... update later
    [Tags]
    Index.Go to the MIRICYL home page
    sleep  1s
    Index.Select 'Childhood abuse or Bullying'
    Index.Click on the next button
    ServiceTypes.Click on the Next button
    Personalise.Click on the next button
    Postcode.Click on the Next button
    sleep  1s
    Results.Use case 2 returns 9 National services

Use case 3: Selecting 'Childhood abuse or Bullying' and face-2-face service retuns 6 national services
    [Documentation]  As detailed in confluence... update later, doesn't look right per the use case
    [Tags]
    Index.Go to the MIRICYL home page
    sleep  1s
    Index.Select 'Childhood abuse or Bullying'
    Index.Click on the next button
    ServiceTypes.Select service type: Face-2-face
    ServiceTypes.Click on the Next button
    Personalise.Click on the next button
    Postcode.Click on the Next button
    sleep  1s
    Results.Use case 3 returns 6 National services

Use case 4: Selecting 'Childhood abuse or Bullying', face-2-face service and LGBTQ+ retuns 6 national services
    [Documentation]  As detailed in confluence... update later, no right per the use case and actual
    [Tags]
    Index.Go to the MIRICYL home page
    sleep  1s
    Index.Select 'Childhood abuse or Bullying'
    Index.Click on the next button
    ServiceTypes.Select service type: Face-2-face
    ServiceTypes.Click on the Next button
    Personalise.Select 'lgbtq+'
    Personalise.Click on the next button
    Postcode.Click on the Next button
    sleep  1s
    Results.Use case 4 returns 6 National services

Use case 5: Selecting 'Childhood abuse or Bullying', Debt or Looking for Employment retuns 6 national services
    [Documentation]  returns 3 records, 2 unique orgs with 3 services, there is only 2?
    [Tags]
    Index.Go to the MIRICYL home page
    sleep  1s
    Index.Select 'Childhood abuse or Bullying'
    Index.Select 'Debt or Looking for Employment'
    Index.Click on the next button
    ServiceTypes.Click on the Next button
    Personalise.Click on the next button
    Postcode.Click on the Next button
    sleep  1s
    Results.Use case 5 returns 2 National services

Use case 6: Selecting 'Childhood abuse or Bullying', Debt or Looking for Employment & face-2-face service retuns 1 national services
    [Documentation]  returns 1 records, 1 unique orgs with 1 service
    [Tags]
    Index.Go to the MIRICYL home page
    sleep  1s
    Index.Select 'Childhood abuse or Bullying'
    Index.Select 'Debt or Looking for Employment'
    Index.Click on the next button
    ServiceTypes.Select service type: Face-2-face
    ServiceTypes.Click on the Next button
    Personalise.Click on the next button
    Postcode.Click on the Next button
    sleep  1s
    Results.Use case 6 returns 1 National service

Use case 7: Selecting 'Childhood abuse or Bullying', Debt or Looking for Employment & Postcode EH6 retuns 4 services
    [Documentation]  returns 4 records..
    [Tags]
    Index.Go to the MIRICYL home page
    sleep  1s
    Index.Select 'Childhood abuse or Bullying'
    Index.Select 'Debt or Looking for Employment'
    Index.Click on the next button
    ServiceTypes.Click on the Next button
    Personalise.Click on the next button
    Postcode.Enter postcode  EH6
    Postcode.Click on the Next button
    sleep  1s
    Results.Use case 7 returns 4 local services

Use case 8: Selecting 'Childhood abuse or Bullying', Debt or Looking for Employment, face-2-face service type & Postcode EH6 retuns 4 services
    [Documentation]  returns 3 records..but shows 4
    [Tags]
    Index.Go to the MIRICYL home page
    sleep  1s
    Index.Select 'Childhood abuse or Bullying'
    Index.Select 'Debt or Looking for Employment'
    Index.Click on the next button
    ServiceTypes.Select service type: Face-2-face
    ServiceTypes.Click on the Next button
    Personalise.Click on the next button
    Postcode.Enter postcode  EH6
    Postcode.Click on the Next button
    sleep  1s
    Results.Use case 8 returns 4 local services

Use case 9: Seraching for services within EH2 gives you 10 results
    [Documentation]  This should have been 9 per the reqs
    [Tags]
    Index.Go to the MIRICYL home page
    sleep  1s
    Index.Click on the next button
    ServiceTypes.Click on the Next button
    Personalise.Click on the next button
    Postcode.Enter postcode  EH2
    Postcode.Click on the Next button
    sleep  1s
    Results.Use case 9 returns 10 local services

Use case 10: Seraching for services within EH3 gives you 10 results
    [Documentation]  This should have been 10 per the reqs but only got 7
    [Tags]
    Index.Go to the MIRICYL home page
    sleep  1s
    Index.Click on the next button
    ServiceTypes.Click on the Next button
    Personalise.Click on the next button
    Postcode.Enter postcode  EH3
    Postcode.Click on the Next button
    sleep  1s
    Results.Use case 10 returns 10 local services

Use case 11: Selecting 'Low, Depressed or Lonely' for EH3 location gives 4 results
    [Documentation]  This should have been 4 per the reqs but gives 5
    [Tags]
    Index.Go to the MIRICYL home page
    sleep  1s
    Index.Select 'Low, Depressed or Lonely'
    Index.Click on the next button
    ServiceTypes.Click on the Next button
    Personalise.Click on the next button
    Postcode.Enter postcode  EH3
    Postcode.Click on the Next button
    sleep  1s
    Results.Use case 12 returns 4 local services

Use case 12: Selecting 'Low, Depressed or Lonely' for EH3 location gives 4 results
    [Documentation]  This gives 4 but 1 is incorrect 'DWP'
    [Tags]
    Index.Go to the MIRICYL home page
    sleep  1s
    Index.Select 'Low, Depressed or Lonely'
    Index.Click on the next button
    ServiceTypes.Select service type: Information
    ServiceTypes.Click on the Next button
    Personalise.Click on the next button
    Postcode.Enter postcode  EH3
    Postcode.Click on the Next button
    sleep  1s
    Results.Use case 12 returns 4 local services

