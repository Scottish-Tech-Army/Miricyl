*** Settings ***
Resource  ../pageobjects/index.robot
Resource  ../pageobjects/servicetypes.robot
Resource  ../pageobjects/personalise.robot
Resource  ../pageobjects/postcode.robot
Resource  ../resources/common.robot
Resource  ../resources/common.robot

*** Keywords ***


Use case 1 returns 48 National services
    @scott street
    Action for Children
    Addaction
    Advocard
    Akordia
    Alcohol and drug support south west scotland (ads)
    Alcoholics Anonymous
    All in edinburgh (enable scotland)
    Alzheimer Scotland
    Amina-the Muslim Women’s Resource Centre
    Apex Scotland
    Arts Therapies (NHS Lothian)
    ASH Scotland (Action on Smoking and Health)
    Autism Initiatives UK
    Beat National
    Birthlink
    Breathing Space
    Campaign Against Living Miserably (CALM)
    CAPS Independent Advocacy
    Cyrenians
    Dads Rock
    Enable Scotland
    Fast Forward
    Feniks
    Foundation for Positive Mental Health
    Future Pathways
    Health in Mind
    Held in Our Hearts
    HIV Scotland
    In Care Survivor Service Scotland
    IWORK4ME
    Juno Perinatal Mental Health Support
    LGBT Youth Scotland
    Networking Key Services (NKS) Ltd.
    People Know How
    Pregnancy Counselling & Care (Scotland)
    Samaritans
    Scottish Cot Death Trust
    Scottish Recovery Network
    Shared Care Scotland
    Street Soccer Scotland
    TalkTime Scotland
    The Prince’s Trust
    Venture Scotland
    Victim Support Scotland
    Waverley Care
    Wellbeing Scotland
    Who Cares? Scotland

Use case 2 returns 9 National services
    #Advocard
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Advocard

    #Birthlink
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Birthlink

    #Campaign against living miserably (calm)
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Campaign Against Living Miserably (CALM)

    #Feniks
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Feniks

    #Future Pathways
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(5) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(5) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Future Pathways

    #Health in Mind
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(6) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(6) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Health in Mind

    #In Care Survivor Service Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(7) > div.results-title-container > div.results-list-title-service > p.results-list-title
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(7) > div.results-title-container > div.results-list-title-service > p.results-list-title  In Care Survivor Service Scotland

    #Wellbeing Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(8) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(8) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Wellbeing Scotland

    #Who Cares? Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(9) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(9) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Who Cares? Scotland

Use case 3 returns 6 National services
    #Advocard
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Advocard

    #Feniks
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Feniks

    #Future Pathways
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Future Pathways

    #Health in mind
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Health in Mind

    #Wellbeing Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(5) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(5) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Wellbeing Scotland

    #Who Cares? Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(6) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(6) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Who Cares? Scotland

Use case 4 returns 6 National services
    #Advocard
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Advocard

    #Feniks
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Feniks

    #Future Pathways
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Future Pathways

    #Health in Mind
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Health in Mind

    #Wellbeing Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(5) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(5) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Wellbeing Scotland

    #Who Cares? Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(5) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(6) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Who Cares? Scotland

Use case 5 returns 2 National services
    #Advocard
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Advocard

    #Campaign against living miserably (calm)
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Campaign Against Living Miserably (CALM)

Use case 6 returns 1 National service
    #Advocard
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Advocard

Use case 7 returns 4 local services
    #Advocard
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Advocard

    Partners in Advocacy
#    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
#    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Partners in Advocacy

    #The Prince’s Trust
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  The Prince’s Trust

    Volunteer Edinburgh
#    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
#    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Volunteer Edinburgh

Use case 8 returns 4 local services
    #Advocard
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Advocard

    Partners in Advocacy
    #The Prince’s Trust
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  The Prince’s Trust

    Volunteer Edinburgh
#    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
#    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Volunteer Edinburgh

Use case 9 returns 10 local services
    #ASH Scotland (Action on Smoking and Health)
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  ASH Scotland (Action on Smoking and Health)

    #Autism Initiatives UK
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Autism Initiatives UK

    Befriending Network
    #This could break
    #Birthlink
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Birthlink

    Crossreach C-3
    Crossreach C-1
    Edinburgh and Lothian Council on Alcohol
    #Health in Mind
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(8) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(8) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Health in Mind

    Positive Help
    The Sorted Project

Use case 10 returns 10 local services
    #Apex Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Apex Scotland

    Department of Work and Pensions (DWP)
    Edinburgh Rehab Centre
    #Networking Key Services (NKS) Ltd.
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Networking Key Services (NKS) Ltd.

    NHS Lothian
    #Waverley Care
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(6) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(6) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Waverley Care

    Wheatley Care

Use case 11 returns 5 local services
    #Department of Work and Pensions (DWP)
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Department of Work and Pensions (DWP)

    #Networking key services (nks) ltd.
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Networking Key Services (NKS) Ltd.

    #NHS Lothian
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  NHS Lothian

    #Waverley Care
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Waverley Care

    #Wheatley Care
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(5) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(5) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Wheatley Care

Use case 12 returns 4 local services
    #Department of Work and Pensions (DWP)
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Department of Work and Pensions (DWP)

    #Networking Key Services (NKS) Ltd.
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Networking Key Services (NKS) Ltd.

    #NHS Lothian
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  NHS Lothian

    #Waverley Care
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Waverley Care





@Scott Street
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(1) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  @Scott Street

Action for Children
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Action for Children

Addaction
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Addaction

Advocard
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Advocard

Akordia
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(5) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(5) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Akordia

Alcohol and Drug Support South West Scotland (ADS)
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(6) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(6) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Alcohol and Drug Support South West Scotland (ADS)

Alcoholics Anonymous
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(7) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(7) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Alcoholics Anonymous

All in Edinburgh (Enable Scotland)
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(8) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(8) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  All in Edinburgh (Enable Scotland)

Alzheimer Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(9) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(9) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Alzheimer Scotland


Amina-the Muslim Women’s Resource Centre
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(10) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(10) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Amina-the Muslim Women’s Resource Centre

Apex Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(11) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(11) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Apex Scotland

Arts Therapies (NHS Lothian)
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(12) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(12) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Arts Therapies (NHS Lothian)


ASH Scotland (Action on Smoking and Health)
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(13) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(13) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  ASH Scotland (Action on Smoking and Health)

Autism Initiatives UK
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(14) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(14) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Autism Initiatives UK

Beat National
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(15) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(15) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Beat

Birthlink
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(16) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(16) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Birthlink

Breathing Space
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(17) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(17) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Breathing Space

Campaign Against Living Miserably (CALM)
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(18) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(18) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Campaign Against Living Miserably (CALM)

CAPS Independent Advocacy
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(19) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(19) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  CAPS Independent Advocacy

Cyrenians
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(20) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(20) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Cyrenians

Dads Rock
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(21) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(21) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Dads Rock

Enable Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(22) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(22) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Enable Scotland

Fast Forward
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(23) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(23) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Fast Forward

Feniks
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(24) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(24) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Feniks

Foundation for Positive Mental Health
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(25) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(25) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Foundation for Positive Mental Health

Future Pathways
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(26) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(26) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Future Pathways

Health in Mind
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(27) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(27) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Health in Mind

Held in Our Hearts
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(28) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(28) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Held in Our Hearts

HIV Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(29) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(29) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  HIV Scotland

In Care Survivor Service Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(30) > div.results-title-container > div.results-list-title-service > p.results-list-title
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(30) > div.results-title-container > div.results-list-title-service > p.results-list-title  In Care Survivor Service Scotland

IWORK4ME
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(31) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(31) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  IWORK4ME

Juno Perinatal Mental Health Support
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(32) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(32) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Juno Perinatal Mental Health Support

LGBT Youth Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(33) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(33) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  LGBT Youth Scotland

Networking Key Services (NKS) Ltd.
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(34) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(34) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Networking Key Services (NKS) Ltd.

People Know How
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(35) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(35) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  People Know How

Pregnancy Counselling & Care (Scotland)
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(36) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(36) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Pregnancy Counselling & Care (Scotland)

Samaritans
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(37) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(37) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Samaritans

Scottish Cot Death Trust
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(38) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(38) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Scottish Cot Death Trust

Scottish Recovery Network
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(39) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(39) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Scottish Recovery Network

Shared Care Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(40) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(40) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Shared Care Scotland

Street Soccer Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(41) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(41) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Street Soccer Scotland

TalkTime Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(42) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(42) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  TalkTime Scotland

The Prince’s Trust
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(43) > div.results-title-container > div > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(43) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  The Prince’s Trust



Venture Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(44) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(44) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Venture Scotland

Victim Support Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(45) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(45) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Victim Support Scotland

Waverley Care
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(46) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(46) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Waverley Care

Wellbeing Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(47) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(47) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Wellbeing Scotland

Who Cares? Scotland
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(48) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(48) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Who Cares? Scotland

Partners in Advocacy
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Partners in Advocacy

Volunteer Edinburgh
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(4) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Volunteer Edinburgh

Befriending Network
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Befriending Network


Crossreach C-3
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(5) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(5) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Crossreach

Crossreach C-1
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(6) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(6) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  CrossReach

Edinburgh and Lothian Council on Alcohol
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(7) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(7) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Edinburgh and Lothian Council on Alcohol

Positive Help
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(9) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(9) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Positive Help

The Sorted Project
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(10) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(10) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  The Sorted Project

Department of Work and Pensions (DWP)
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(2) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Department of Work and Pensions (DWP)

Edinburgh Rehab Centre
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(3) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Edinburgh Rehab Centre

NHS Lothian
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(5) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(5) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  NHS Lothian

#Waverley Care
#    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(6) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
#    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(6) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Waverley Care

Wheatley Care
    element should be visible  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(7) > div.results-title-container > div.results-list-title-service > p.results-list-title > a
    element text should be  css:#root > div.results-page-container > div > div.results-page-display > div:nth-child(7) > div.results-title-container > div.results-list-title-service > p.results-list-title > a  Wheatley Care

#    element should be visible
#    element text should be
