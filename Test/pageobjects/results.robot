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
    #Advocard card is present
    element should be visible       xpath://*[@test-id='card-1005']
    #Advocard Logo is prompt for question is present
    log  Logo is not present
    #Advocard name is present
    element should be visible       xpath://*[@test-id='card-1005']//a[contains(text(), 'Advocard')]
    element text should be          xpath://*[@test-id='card-1005']//a[contains(text(), 'Advocard')]  Advocard

    #TO-DO
    #Org Details title for Advocard is present within Card
    #Advocard Org Phone label is present
    #Advocard Org Phone Data is correct
    #Advocard Email label is present
    #Advocard Email Data is correct
    #Advocard Org Address label is presnet
    #Advocard Org Address Data is correct

    #Partners in Advocacy card is present
    element should be visible       xpath://*[@test-id='card-1069']
    #Partners in Advocacy Logo is prompt for question is present
    log  Logo is not present
    #Partners in Advocacy name is present
    element should be visible       xpath://*[@test-id='card-1069']//a[contains(text(), 'Partners in Advocacy')]
    element text should be          xpath://*[@test-id='card-1069']//a[contains(text(), 'Partners in Advocacy')]  Partners in Advocacy

    #TO-DO
    #Org Details title for Partners in Advocacy is present within Card
    #Partners in Advocacy Org Phone label is present
    #Partners in Advocacy Org Phone Data is correct
    #Partners in Advocacy Email label is present
    #Partners in Advocacy Email Data is correct
    #Partners in Advocacy Org Address label is presnet
    #Partners in Advocacy Org Address Data is correct

    #The Prince’s Trust card is present
    element should be visible       xpath://*[@test-id='card-1093']
    #The Prince’s Trust Logo is prompt for question is present
    log  Logo is not present
    #The Prince’s Trust name is present
    element should be visible       xpath://*[@test-id='card-1093']//a[contains(text(), 'The Prince’s Trust')]
    element text should be          xpath://*[@test-id='card-1093']//a[contains(text(), 'The Prince’s Trust')]  The Prince’s Trust

    #TO-DO
    #Org Details title for The Prince’s Trust is present within Card
    #The Prince’s Trust Org Phone label is present
    #The Prince’s Trust Org Phone Data is correct
    #The Prince’s Trust Email label is present
    #The Prince’s Trust Email Data is correct
    #The Prince’s Trust Org Address label is presnet
    #The Prince’s Trust Org Address Data is correct

    #Volunteer Edinburgh card is present
    element should be visible       xpath://*[@test-id='card-1104']
    #Volunteer Edinburgh Logo is prompt for question is present
    log  Logo is not present
    #Volunteer Edinburgh name is present
    element should be visible       xpath://*[@test-id='card-1104']//a[contains(text(), 'Volunteer Edinburgh')]
    element text should be          xpath://*[@test-id='card-1104']//a[contains(text(), 'Volunteer Edinburgh')]  Volunteer Edinburgh

    #TO-DO
    #Org Details title for Volunteer Edinburgh is present within Card
    #Volunteer Edinburgh Org Phone label is present
    #Volunteer Edinburgh Org Phone Data is correct
    #Volunteer Edinburgh Email label is present
    #Volunteer Edinburgh Email Data is correct
    #Volunteer Edinburgh Org Address label is presnet
    #Volunteer Edinburgh Org Address Data is correct

Use case 8 returns 4 local services

    #Advocard card is present
    element should be visible       xpath://*[@test-id='card-1005']
    #Advocard Logo is prompt for question is present
    log  Logo is not present
    #Advocard name is present
    element should be visible       xpath://*[@test-id='card-1005']//a[contains(text(), 'Advocard')]
    element text should be          xpath://*[@test-id='card-1005']//a[contains(text(), 'Advocard')]  Advocard

    #TO-DO
    #Org Details title for Advocard is present within Card
    #Advocard Org Phone label is present
    #Advocard Org Phone Data is correct
    #Advocard Email label is present
    #Advocard Email Data is correct
    #Advocard Org Address label is presnet
    #Advocard Org Address Data is correct

    #Partners in Advocacy card is present
    element should be visible       xpath://*[@test-id='card-1069']
    #Partners in Advocacy Logo is prompt for question is present
    log  Logo is not present
    #Partners in Advocacy name is present
    element should be visible       xpath://*[@test-id='card-1069']//a[contains(text(), 'Partners in Advocacy')]
    element text should be          xpath://*[@test-id='card-1069']//a[contains(text(), 'Partners in Advocacy')]  Partners in Advocacy

    #TO-DO
    #Org Details title for Partners in Advocacy is present within Card
    #Partners in Advocacy Org Phone label is present
    #Partners in Advocacy Org Phone Data is correct
    #Partners in Advocacy Email label is present
    #Partners in Advocacy Email Data is correct
    #Partners in Advocacy Org Address label is presnet
    #Partners in Advocacy Org Address Data is correct

    #The Prince’s Trust card is present
    element should be visible       xpath://*[@test-id='card-1093']
    #The Prince’s Trust Logo is prompt for question is present
    log  Logo is not present
    #The Prince’s Trust name is present
    element should be visible       xpath://*[@test-id='card-1093']//a[contains(text(), 'The Prince’s Trust')]
    element text should be          xpath://*[@test-id='card-1093']//a[contains(text(), 'The Prince’s Trust')]  The Prince’s Trust

    #TO-DO
    #Org Details title for The Prince’s Trust is present within Card
    #The Prince’s Trust Org Phone label is present
    #The Prince’s Trust Org Phone Data is correct
    #The Prince’s Trust Email label is present
    #The Prince’s Trust Email Data is correct
    #The Prince’s Trust Org Address label is presnet
    #The Prince’s Trust Org Address Data is correct

    #Volunteer Edinburgh card is present
    #element should be visible       xpath://*[@test-id='card-1104']
    #Volunteer Edinburgh Logo is prompt for question is present
    #log  Logo is not present
    #Volunteer Edinburgh name is present
    #element should be visible       xpath://*[@test-id='card-1104']//a[contains(text(), 'Volunteer Edinburgh')]
    #element text should be          xpath://*[@test-id='card-1104']//a[contains(text(), 'Volunteer Edinburgh')]  Volunteer Edinburgh

    #TO-DO
    #Org Details title for Volunteer Edinburgh is present within Card
    #Volunteer Edinburgh Org Phone label is present
    #Volunteer Edinburgh Org Phone Data is correct
    #Volunteer Edinburgh Email label is present
    #Volunteer Edinburgh Email Data is correct
    #Volunteer Edinburgh Org Address label is presnet
    #Volunteer Edinburgh Org Address Data is correct


Use case 9 returns 10 local services
    #ASH Scotland (Action on Smoking and Health) card is present
    element should be visible       xpath://*[@test-id='card-1018']
    #ASH Scotland (Action on Smoking and Health) Logo is prompt for question is present
    log  Logo is not present
    #ASH Scotland (Action on Smoking and Health) name is present
    element should be visible       xpath://*[@test-id='card-1018']//a[contains(text(), 'ASH Scotland (Action on Smoking and Health)')]
    element text should be          xpath://*[@test-id='card-1018']//a[contains(text(), 'ASH Scotland (Action on Smoking and Health)')]  ASH Scotland (Action on Smoking and Health)

    #TO-DO
    #Org Details title for Apex Scotland is present within Card
    #ASH Scotland (Action on Smoking and Health) Org Phone label is present
    #ASH Scotland (Action on Smoking and Health) Org Phone Data is correct
    #ASH Scotland (Action on Smoking and Health) Email label is present
    #ASH Scotland (Action on Smoking and Health) Email Data is correct
    #ASH Scotland (Action on Smoking and Health) Org Address label is presnet
    #ASH Scotland (Action on Smoking and Health) Org Address Data is correct

    #Autism Initiatives UK card is present
    element should be visible       xpath://*[@test-id='card-1019']
    #Autism Initiatives UK Logo is prompt for question is present
    log  Logo is not present
    #Autism Initiatives UK name is present
    element should be visible       xpath://*[@test-id='card-1019']//a[contains(text(), 'Autism Initiatives UK')]
    element text should be          xpath://*[@test-id='card-1019']//a[contains(text(), 'Autism Initiatives UK')]  Autism Initiatives UK

    #TO-DO
    #Org Details title for Autism Initiatives UK is present within Card
    #Autism Initiatives UK Org Phone label is present
    #Autism Initiatives UK Org Phone Data is correct
    #Autism Initiatives UK Email label is present
    #Autism Initiatives UK Email Data is correct
    #Autism Initiatives UK Org Address label is presnet
    #Autism Initiatives UK Org Address Data is correct

    #Befriending Network card is present
    element should be visible       xpath://*[@test-id='card-1019']
    #Befriending Network Logo is prompt for question is present
    log  Logo is not present
    #Befriending Network name is present
    element should be visible       xpath://*[@test-id='card-1019']//a[contains(text(), 'Befriending Network')]
    element text should be          xpath://*[@test-id='card-1019']//a[contains(text(), 'Befriending Network')]  Befriending Network

    #TO-DO
    #Org Details title for Befriending Network is present within Card
    #Befriending Network Org Phone label is present
    #Befriending Network Org Phone Data is correct
    #Befriending Network Email label is present
    #Befriending Network Email Data is correct
    #Befriending Network Org Address label is presnet
    #Befriending Network Org Address Data is correct

    #Birthlink card is present
    element should be visible       xpath://*[@test-id='card-1022']
    #Birthlink Logo is prompt for question is present
    log  Logo is not present
    #Birthlink name is present
    element should be visible       xpath://*[@test-id='card-1022']//a[contains(text(), 'Birthlink')]
    element text should be          xpath://*[@test-id='card-1022']//a[contains(text(), 'Birthlink')]  Birthlink

    #TO-DO
    #Org Details title for Birthlink is present within Card
    #Birthlink Org Phone label is present
    #Birthlink Org Phone Data is correct
    #Birthlink Email label is present
    #Birthlink Email Data is correct
    #Birthlink Org Address label is presnet
    #Birthlink Org Address Data is correct

    #Crossreach Org 1032 card is present
    element should be visible       xpath://*[@test-id='card-1032']
    #Crossreach Org 1032 Logo is prompt for question is present
    log  Logo is not present
    #Crossreach Org 1032 name is present
    element should be visible       xpath://*[@test-id='card-1032']//a[contains(text(), 'Crossreach')]
    element text should be          xpath://*[@test-id='card-1032']//a[contains(text(), 'Crossreach')]  Crossreach

    #TO-DO
    #Org Details title for Crossreach Org 1032 is present within Card
    #Crossreach Org 1032 Org Phone label is present
    #Crossreach Org 1032 Org Phone Data is correct
    #Crossreach Org 1032 Email label is present
    #Crossreach Org 1032 Email Data is correct
    #Crossreach Org 1032 Org Address label is presnet
    #Crossreach Org 1032 Org Address Data is correct

    #Crossreach Org 1031 card is present
    element should be visible       xpath://*[@test-id='card-1031']
    #Crossreach Org 1031 Logo is prompt for question is present
    log  Logo is not present
    #Crossreach Org 1031 name is present
    element should be visible       xpath://*[@test-id='card-1031']//a[contains(text(), 'Crossreach')]
    element text should be          xpath://*[@test-id='card-1031']//a[contains(text(), 'Crossreach')]  Crossreach

    #TO-DO
    #Org Details title for Crossreach Org 1031 is present within Card
    #Crossreach Org 1031 Org Phone label is present
    #Crossreach Org 1031 Org Phone Data is correct
    #Crossreach Org 1031 Email label is present
    #Crossreach Org 1031 Email Data is correct
    #Crossreach Org 1031 Org Address label is presnet
    #Crossreach Org 1031 Org Address Data is correct

    #Edinburgh and Lothian Council on Alcohol card is present
    element should be visible       xpath://*[@test-id='card-1037']
    #Edinburgh and Lothian Council on Alcohol Logo is prompt for question is present
    log  Logo is not present
    #Edinburgh and Lothian Council on Alcohol name is present
    element should be visible       xpath://*[@test-id='card-1037']//a[contains(text(), 'Edinburgh and Lothian Council on Alcohol')]
    element text should be          xpath://*[@test-id='card-1037']//a[contains(text(), 'Edinburgh and Lothian Council on Alcohol')]  Edinburgh and Lothian Council on Alcohol

    #TO-DO
    #Org Details title for Edinburgh and Lothian Council on Alcohol is present within Card
    #Edinburgh and Lothian Council on Alcohol Org Phone label is present
    #Edinburgh and Lothian Council on Alcohol Org Phone Data is correct
    #Edinburgh and Lothian Council on Alcohol Email label is present
    #Edinburgh and Lothian Council on Alcohol Email Data is correct
    #Edinburgh and Lothian Council on Alcohol Org Address label is presnet
    #Edinburgh and Lothian Council on Alcohol Org Address Data is correct

    #Health in Mind card is present
    element should be visible       xpath://*[@test-id='card-1055']
    #Health in Mind Logo is prompt for question is present
    log  Logo is not present
    #Health in Mind name is present
    element should be visible       xpath://*[@test-id='card-1055']//a[contains(text(), 'Health in Mind')]
    element text should be          xpath://*[@test-id='card-1055']//a[contains(text(), 'Health in Mind')]  Health in Mind

    #TO-DO
    #Org Details title for Health in Mind is present within Card
    #Health in Mind Org Phone label is present
    #Health in Mind Org Phone Data is correct
    #Health in Mind Email label is present
    #Health in Mind Email Data is correct
    #Health in Mind Org Address label is presnet
    #Health in Mind Org Address Data is correct

    #Positive Help card is present
    element should be visible       xpath://*[@test-id='card-1074']
    #Positive Help is prompt for question is present
    log  Logo is not present
    #Positive Help name is present
    element should be visible       xpath://*[@test-id='card-1074']//a[contains(text(), 'Positive Help')]
    element text should be          xpath://*[@test-id='card-1074']//a[contains(text(), 'Positive Help')]  Positive Help

    #TO-DO
    #Org Details title for Positive Help is present within Card
    #Positive Help Org Phone label is present
    #Positive Help Org Phone Data is correct
    #Positive Help Email label is present
    #Positive Help Email Data is correct
    #Positive Help Org Address label is presnet
    #Positive Help Org Address Data is correct

    #The Sorted Project card is present
    element should be visible       xpath://*[@test-id='card-1095']
    #The Sorted Project is prompt for question is present
    log  Logo is not present
    #The Sorted Project name is present
    element should be visible       xpath://*[@test-id='card-1095']//a[contains(text(), 'The Sorted Project')]
    element text should be          xpath://*[@test-id='card-1095']//a[contains(text(), 'The Sorted Project')]  The Sorted Project

    #TO-DO
    #Org Details title for The Sorted Project is present within Card
    #The Sorted Project Org Phone label is present
    #The Sorted Project Org Phone Data is correct
    #The Sorted Project Email label is present
    #The Sorted Project Email Data is correct
    #The Sorted Project Org Address label is presnet
    #The Sorted Project Org Address Data is correct


Use case 10 returns 10 local services
    #Apex Scotland card is present
    element should be visible       xpath://*[@test-id='card-1014']
    #Apex Scotland Logo is prompt for question is present
    log  Logo is not present
    #Apex Scotland name is present
    element should be visible       xpath://*[@test-id='card-1014']//a[contains(text(), 'Apex Scotland')]
    element text should be          xpath://*[@test-id='card-1014']//a[contains(text(), 'Apex Scotland')]  Apex Scotland

    #TO-DO
    #Org Details title for Apex Scotland is present within Card
    #Apex Scotland Org Phone label is present
    #Apex Scotland Org Phone Data is correct
    #Apex Scotland Org Email label is present
    #Apex Scotland Org Email Data is correct
    #Apex Scotland Org Address label is presnet
    #Apex Scotland Org Address Data is correct

    #Department of Work and Pensions (DWP) card is present
    element should be visible       xpath://*[@test-id='card-1035']
    #Department of Work and Pensions Logo is prompt for question is present
    log  Logo is not present
    #Department of Work and Pensions (DWP) name is present
    element should be visible       xpath://*[@test-id='card-1035']//a[contains(text(), 'Department of Work and Pensions (DWP)')]
    element text should be          xpath://*[@test-id='card-1035']//a[contains(text(), 'Department of Work and Pensions (DWP)')]  Department of Work and Pensions (DWP)

    #TO-DO
    #Org Details title for DWP is present within Card
    #DWP Org Phone label is present
    #DWP Org Phone Data is correct
    #DWP Org Email label is present
    #DWP Org Email Data is correct
    #DWP Org Address label is presnet
    #DWP Org Address Data is correct

    #Edinburgh Rehab Centre
    #Edinburgh Rehab Centre card is present
    element should be visible       xpath://*[@test-id='card-1043']
    #Networking Key Services (NKS) Ltd. Logo is prompt for question is present
    log  Logo is not present
    #Networking Key Services (NKS) Ltd. name is present
    element should be visible       xpath://*[@test-id='card-1043']//a[contains(text(), 'Edinburgh Rehab Centre')]
    element text should be          xpath://*[@test-id='card-1043']//a[contains(text(), 'Edinburgh Rehab Centre')]  Edinburgh Rehab Centre

    #TO-DO
    #Org Details title for Networking Key Services (NKS) Ltd. is present within Card
    #Networking Key Services (NKS) Ltd. Org Phone label is present
    #Networking Key Services (NKS) Ltd. Org Phone Data is correct
    #Networking Key Services (NKS) Ltd. Org Email label is present
    #Networking Key Services (NKS) Ltd. Org Email Data is correct
    #Networking Key Services (NKS) Ltd. Org Address label is presnet
    #Networking Key Services (NKS) Ltd. Org Address Data is correct

    #Networking Key Services (NKS) Ltd.
    #Networking Key Services (NKS) Ltd. card is present
    element should be visible       xpath://*[@test-id='card-1066']
    #Networking Key Services (NKS) Ltd. Logo is prompt for question is present
    log  Logo is not present
    #Networking Key Services (NKS) Ltd. name is present
    element should be visible       xpath://*[@test-id='card-1066']//a[contains(text(), 'Networking Key Services (NKS) Ltd.')]
    element text should be          xpath://*[@test-id='card-1066']//a[contains(text(), 'Networking Key Services (NKS) Ltd.')]  Networking Key Services (NKS) Ltd.

    #TO-DO
    #Org Details title for Networking Key Services (NKS) Ltd. is present within Card
    #Networking Key Services (NKS) Ltd. Org Phone label is present
    #Networking Key Services (NKS) Ltd. Org Phone Data is correct
    #Networking Key Services (NKS) Ltd. Org Email label is present
    #Networking Key Services (NKS) Ltd. Org Email Data is correct
    #Networking Key Services (NKS) Ltd. Org Address label is presnet
    #Networking Key Services (NKS) Ltd. Org Address Data is correct

    #NHS Lothian
    #NHS Lothian card is present
    element should be visible       xpath://*[@test-id='card-1067']
    #NHS Lothian Logo is prompt for question is present
    log  Logo is not present
    #NHS Lothian name is present
    element should be visible       xpath://*[@test-id='card-1067']//a[contains(text(), 'NHS Lothian')]
    element text should be          xpath://*[@test-id='card-1067']//a[contains(text(), 'NHS Lothian')]  NHS Lothian

    #TO-DO
    #Org Details title for NHS Lothian. is present within Card
    #NHS Lothian Org Phone label is present
    #NHS Lothian Org Phone Data is correct
    #NHS Lothian Org Email label is present
    #NHS Lothian Org Email Data is correct
    #NHS Lothian Org Address label is presnet
    #NHS Lothian Org Address Data is correct


    #Waverley Care
    #Waverley Care card is present
    element should be visible       xpath://*[@test-id='card-1105']
    #Waverley Care Logo is prompt for question is present
    log  Logo is not present
    #Waverley Care name is present
    element should be visible       xpath://*[@test-id='card-1105']//a[contains(text(), 'Waverley Care')]
    element text should be          xpath://*[@test-id='card-1105']//a[contains(text(), 'Waverley Care')]  Waverley Care

    #TO-DO
    #Org Details title for Waverley Care. is present within Card
    #Waverley Care Org Phone label is present
    #Waverley Care Org Phone Data is correct
    #Waverley Care Org Email label is present
    #Waverley Care Org Email Data is correct
    #Waverley Care Org Address label is presnet
    #Waverley Care Org Address Data is correct

    #Wheatley Care
    #Wheatley Care card is present
    element should be visible       xpath://*[@test-id='card-1107']
    #Wheatley Care Logo is prompt for question is present
    log  Logo is not present
    #Wheatley Care name is present
    element should be visible       xpath://*[@test-id='card-1107']//a[contains(text(), 'Wheatley Care')]
    element text should be          xpath://*[@test-id='card-1107']//a[contains(text(), 'Wheatley Care')]  Wheatley Care

    #TO-DO
    #Org Details title for Wheatley Care. is present within Card
    #Wheatley Care Org Phone label is present
    #Wheatley Care Org Phone Data is correct
    #Wheatley Care Org Email label is present
    #Wheatley Care Org Email Data is correct
    #Wheatley Care Org Address label is presnet
    #Wheatley Care Org Address Data is correct

Use case 11 returns 5 local services
    #Department of Work and Pensions (DWP) card is present
    #element should be visible       xpath://*[@test-id='card-1035']
    #Department of Work and Pensions Logo is prompt for question is present
    #log  Logo is not present
    #Department of Work and Pensions (DWP) name is present
    #element should be visible       xpath://*[@test-id='card-1035']//a[contains(text(), 'Department of Work and Pensions (DWP)')]
    #element text should be          xpath://*[@test-id='card-1035']//a[contains(text(), 'Department of Work and Pensions (DWP)')]  Department of Work and Pensions (DWP)

    #TO-DO
    #Org Details title for DWP is present within Card
    #DWP Org Phone label is present
    #DWP Org Phone Data is correct
    #DWP Org Email label is present
    #DWP Org Email Data is correct
    #DWP Org Address label is presnet
    #DWP Org Address Data is correct

    #Networking Key Services (NKS) Ltd.
    #Networking Key Services (NKS) Ltd. card is present
    element should be visible       xpath://*[@test-id='card-1066']
    #Networking Key Services (NKS) Ltd. Logo is prompt for question is present
    log  Logo is not present
    #Networking Key Services (NKS) Ltd. name is present
    element should be visible       xpath://*[@test-id='card-1066']//a[contains(text(), 'Networking Key Services (NKS) Ltd.')]
    element text should be          xpath://*[@test-id='card-1066']//a[contains(text(), 'Networking Key Services (NKS) Ltd.')]  Networking Key Services (NKS) Ltd.

    #TO-DO
    #Org Details title for Networking Key Services (NKS) Ltd. is present within Card
    #Networking Key Services (NKS) Ltd. Org Phone label is present
    #Networking Key Services (NKS) Ltd. Org Phone Data is correct
    #Networking Key Services (NKS) Ltd. Org Email label is present
    #Networking Key Services (NKS) Ltd. Org Email Data is correct
    #Networking Key Services (NKS) Ltd. Org Address label is presnet
    #Networking Key Services (NKS) Ltd. Org Address Data is correct

    #NHS Lothian
    #NHS Lothian card is present
    element should be visible       xpath://*[@test-id='card-1067']
    #NHS Lothian Logo is prompt for question is present
    log  Logo is not present
    #NHS Lothian name is present
    element should be visible       xpath://*[@test-id='card-1067']//a[contains(text(), 'NHS Lothian')]
    element text should be          xpath://*[@test-id='card-1067']//a[contains(text(), 'NHS Lothian')]  NHS Lothian

    #TO-DO
    #Org Details title for NHS Lothian. is present within Card
    #NHS Lothian Org Phone label is present
    #NHS Lothian Org Phone Data is correct
    #NHS Lothian Org Email label is present
    #NHS Lothian Org Email Data is correct
    #NHS Lothian Org Address label is presnet
    #NHS Lothian Org Address Data is correct


    #Waverley Care
    #Waverley Care card is present
    element should be visible       xpath://*[@test-id='card-1105']
    #Waverley Care Logo is prompt for question is present
    log  Logo is not present
    #Waverley Care name is present
    element should be visible       xpath://*[@test-id='card-1105']//a[contains(text(), 'Waverley Care')]
    element text should be          xpath://*[@test-id='card-1105']//a[contains(text(), 'Waverley Care')]  Waverley Care

    #TO-DO
    #Org Details title for Waverley Care. is present within Card
    #Waverley Care Org Phone label is present
    #Waverley Care Org Phone Data is correct
    #Waverley Care Org Email label is present
    #Waverley Care Org Email Data is correct
    #Waverley Care Org Address label is presnet
    #Waverley Care Org Address Data is correct

    #Wheatley Care
    #Wheatley Care card is present
    element should be visible       xpath://*[@test-id='card-1107']
    #Wheatley Care Logo is prompt for question is present
    log  Logo is not present
    #Wheatley Care name is present
    element should be visible       xpath://*[@test-id='card-1107']//a[contains(text(), 'Wheatley Care')]
    element text should be          xpath://*[@test-id='card-1107']//a[contains(text(), 'Wheatley Care')]  Wheatley Care

    #TO-DO
    #Org Details title for Wheatley Care. is present within Card
    #Wheatley Care Org Phone label is present
    #Wheatley Care Org Phone Data is correct
    #Wheatley Care Org Email label is present
    #Wheatley Care Org Email Data is correct
    #Wheatley Care Org Address label is presnet
    #Wheatley Care Org Address Data is correct

Use case 12 returns 4 local services
    #Department of Work and Pensions (DWP) card is present
    #element should be visible       xpath://*[@test-id='card-1035']
    #Department of Work and Pensions Logo is prompt for question is present
    #log  Logo is not present
    #Department of Work and Pensions (DWP) name is present
    #element should be visible       xpath://*[@test-id='card-1035']//a[contains(text(), 'Department of Work and Pensions (DWP)')]
    #element text should be          xpath://*[@test-id='card-1035']//a[contains(text(), 'Department of Work and Pensions (DWP)')]  Department of Work and Pensions (DWP)

    #TO-DO
    #Org Details title for DWP is present within Card
    #DWP Org Phone label is present
    #DWP Org Phone Data is correct
    #DWP Org Email label is present
    #DWP Org Email Data is correct
    #DWP Org Address label is presnet
    #DWP Org Address Data is correct

    #Networking Key Services (NKS) Ltd.
    #Networking Key Services (NKS) Ltd. card is present
    element should be visible       xpath://*[@test-id='card-1066']
    #Networking Key Services (NKS) Ltd. Logo is prompt for question is present
    log  Logo is not present
    #Networking Key Services (NKS) Ltd. name is present
    element should be visible       xpath://*[@test-id='card-1066']//a[contains(text(), 'Networking Key Services (NKS) Ltd.')]
    element text should be          xpath://*[@test-id='card-1066']//a[contains(text(), 'Networking Key Services (NKS) Ltd.')]  Networking Key Services (NKS) Ltd.

    #TO-DO
    #Org Details title for Networking Key Services (NKS) Ltd. is present within Card
    #Networking Key Services (NKS) Ltd. Org Phone label is present
    #Networking Key Services (NKS) Ltd. Org Phone Data is correct
    #Networking Key Services (NKS) Ltd. Org Email label is present
    #Networking Key Services (NKS) Ltd. Org Email Data is correct
    #Networking Key Services (NKS) Ltd. Org Address label is presnet
    #Networking Key Services (NKS) Ltd. Org Address Data is correct

    #NHS Lothian
    #NHS Lothian card is present
    element should be visible       xpath://*[@test-id='card-1067']
    #NHS Lothian Logo is prompt for question is present
    log  Logo is not present
    #NHS Lothian name is present
    element should be visible       xpath://*[@test-id='card-1067']//a[contains(text(), 'NHS Lothian')]
    element text should be          xpath://*[@test-id='card-1067']//a[contains(text(), 'NHS Lothian')]  NHS Lothian

    #TO-DO
    #Org Details title for NHS Lothian. is present within Card
    #NHS Lothian Org Phone label is present
    #NHS Lothian Org Phone Data is correct
    #NHS Lothian Org Email label is present
    #NHS Lothian Org Email Data is correct
    #NHS Lothian Org Address label is presnet
    #NHS Lothian Org Address Data is correct


    #Waverley Care
    #Waverley Care card is present
    element should be visible       xpath://*[@test-id='card-1105']
    #Waverley Care Logo is prompt for question is present
    log  Logo is not present
    #Waverley Care name is present
    element should be visible       xpath://*[@test-id='card-1105']//a[contains(text(), 'Waverley Care')]
    element text should be          xpath://*[@test-id='card-1105']//a[contains(text(), 'Waverley Care')]  Waverley Care

    #TO-DO
    #Org Details title for Waverley Care. is present within Card
    #Waverley Care Org Phone label is present
    #Waverley Care Org Phone Data is correct
    #Waverley Care Org Email label is present
    #Waverley Care Org Email Data is correct
    #Waverley Care Org Address label is presnet
    #Waverley Care Org Address Data is correct

    #Wheatley Care
    #Wheatley Care card is present
    element should be visible       xpath://*[@test-id='card-1107']
    #Wheatley Care Logo is prompt for question is present
    log  Logo is not present
    #Wheatley Care name is present
    element should be visible       xpath://*[@test-id='card-1107']//a[contains(text(), 'Wheatley Care')]
    element text should be          xpath://*[@test-id='card-1107']//a[contains(text(), 'Wheatley Care')]  Wheatley Care

    #TO-DO
    #Org Details title for Wheatley Care. is present within Card
    #Wheatley Care Org Phone label is present
    #Wheatley Care Org Phone Data is correct
    #Wheatley Care Org Email label is present
    #Wheatley Care Org Email Data is correct
    #Wheatley Care Org Address label is presnet
    #Wheatley Care Org Address Data is correct





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
