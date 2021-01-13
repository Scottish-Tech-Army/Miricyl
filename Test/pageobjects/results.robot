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

    #Campaign Against Living Miserably (CALM) card is present
    element should be visible       xpath://*[@test-id='card-1024']
    #Campaign Against Living Miserably (CALM) Logo is prompt for question is present
    log  Logo is not present
    #Campaign Against Living Miserably (CALM) name is present
    element should be visible       xpath://*[@test-id='card-1024']//a[contains(text(), 'Campaign Against Living Miserably (CALM)')]
    element text should be          xpath://*[@test-id='card-1024']//a[contains(text(), 'Campaign Against Living Miserably (CALM)')]  Campaign Against Living Miserably (CALM)

    #TO-DO
    #Org Details title for Campaign Against Living Miserably (CALM) is present within Card
    #Campaign Against Living Miserably (CALM) Org Phone label is present
    #Campaign Against Living Miserably (CALM) Org Phone Data is correct
    #Campaign Against Living Miserably (CALM) Email label is present
    #Campaign Against Living Miserably (CALM) Email Data is correct
    #Campaign Against Living Miserably (CALM) Org Address label is presnet
    #Campaign Against Living Miserably (CALM) Org Address Data is correct

    #Feniks card is present
    element should be visible       xpath://*[@test-id='card-1049']
    #Feniks Logo is prompt for question is present
    log  Logo is not present
    #Feniks name is present
    element should be visible       xpath://*[@test-id='card-1049']//a[contains(text(), 'Feniks')]
    element text should be          xpath://*[@test-id='card-1049']//a[contains(text(), 'Feniks')]  Feniks

    #TO-DO
    #Org Details title for Feniks is present within Card
    #Feniks Org Phone label is present
    #Feniks Org Phone Data is correct
    #Feniks Email label is present
    #Feniks Email Data is correct
    #Feniks Org Address label is presnet
    #Feniks Org Address Data is correct

    #Future Pathways
    #Future Pathways card is present
    element should be visible       xpath://*[@test-id='card-1053']
    #Future Pathways Logo is prompt for question is present
    log  Logo is not present
    #Future Pathways name is present
    element should be visible       xpath://*[@test-id='card-1053']//a[contains(text(), 'Future Pathways')]
    element text should be          xpath://*[@test-id='card-1053']//a[contains(text(), 'Future Pathways')]  Future Pathways

    #TO-DO
    #Org Details title for Future Pathways is present within Card
    #Future Pathways Org Phone label is present
    #Future Pathways Org Phone Data is correct
    #Future Pathways Email label is present
    #Future Pathways Email Data is correct
    #Future Pathways Org Address label is presnet
    #Future Pathways Org Address Data is correct

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

    #In Care Survivor Service Scotland
    element should be visible       xpath://*[@test-id='card-1059']
    #Health in Mind Logo is prompt for question is present
    log  Logo is not present
    #Health in Mind name is present
    element should be visible       xpath://*[@test-id='card-1059']//a[contains(text(), 'In Care Survivor Service Scotland')]
    element text should be          xpath://*[@test-id='card-1059']//a[contains(text(), 'In Care Survivor Service Scotland')]  In Care Survivor Service Scotland

    #TO-DO
    #Org Details title for In Care Survivor Service Scotland is present within Card
    #In Care Survivor Service Scotland Org Phone label is present
    #In Care Survivor Service Scotland Org Phone Data is correct
    #In Care Survivor Service Scotland Email label is present
    #In Care Survivor Service Scotland Email Data is correct
    #In Care Survivor Service Scotland Org Address label is presnet
    #In Care Survivor Service Scotland Org Address Data is correct

    #Wellbeing Scotland card is present
    element should be visible       xpath://*[@test-id='card-1106']
    #Wellbeing Scotland Logo is prompt for question is present
    log  Logo is not present
    #Wellbeing Scotland name is present
    element should be visible       xpath://*[@test-id='card-1106']//a[contains(text(), 'Wellbeing Scotland')]
    element text should be          xpath://*[@test-id='card-1106']//a[contains(text(), 'Wellbeing Scotland')]  Wellbeing Scotland

    #TO-DO
    #Org Details title for Wellbeing Scotland is present within Card
    #Wellbeing Scotland Org Phone label is present
    #Wellbeing Scotland Org Phone Data is correct
    #Wellbeing Scotland Email label is present
    #Wellbeing Scotland Email Data is correct
    #Wellbeing Scotland Org Address label is presnet
    #Wellbeing Scotland Org Address Data is correct

    #Who Cares? Scotland
    #Who Cares? Scotland card is present
    element should be visible       xpath://*[@test-id='card-1108']
    #Who Cares? Scotland Logo is prompt for question is present
    log  Logo is not present
    #Who Cares? Scotland name is present
    element should be visible       xpath://*[@test-id='card-1108']//a[contains(text(), 'Who Cares? Scotland')]
    element text should be          xpath://*[@test-id='card-1108']//a[contains(text(), 'Who Cares? Scotland')]  Who Cares? Scotland

    #TO-DO
    #Org Details title for Who Cares? Scotland is present within Card
    #Who Cares? Scotland Org Phone label is present
    #Who Cares? Scotland Org Phone Data is correct
    #Who Cares? Scotland Email label is present
    #Who Cares? Scotland Email Data is correct
    #Who Cares? Scotland Org Address label is presnet
    #Who Cares? Scotland Org Address Data is correct


Use case 3 returns 6 National services
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

    #Feniks card is present
    element should be visible       xpath://*[@test-id='card-1049']
    #Feniks Logo is prompt for question is present
    log  Logo is not present
    #Feniks name is present
    element should be visible       xpath://*[@test-id='card-1049']//a[contains(text(), 'Feniks')]
    element text should be          xpath://*[@test-id='card-1049']//a[contains(text(), 'Feniks')]  Feniks

    #TO-DO
    #Org Details title for Feniks is present within Card
    #Feniks Org Phone label is present
    #Feniks Org Phone Data is correct
    #Feniks Email label is present
    #Feniks Email Data is correct
    #Feniks Org Address label is presnet
    #Feniks Org Address Data is correct

    #Future Pathways card is present
    element should be visible       xpath://*[@test-id='card-1053']
    #Future Pathways Logo is prompt for question is present
    log  Logo is not present
    #Future Pathways name is present
    element should be visible       xpath://*[@test-id='card-1053']//a[contains(text(), 'Future Pathways')]
    element text should be          xpath://*[@test-id='card-1053']//a[contains(text(), 'Future Pathways')]  Future Pathways

    #TO-DO
    #Org Details title for Future Pathways is present within Card
    #Future Pathways Org Phone label is present
    #Future Pathways Org Phone Data is correct
    #Future Pathways Email label is present
    #Future Pathways Email Data is correct
    #Future Pathways Org Address label is presnet
    #Future Pathways Org Address Data is correct

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

    #Wellbeing Scotland card is present
    element should be visible       xpath://*[@test-id='card-1106']
    #Wellbeing Scotland Logo is prompt for question is present
    log  Logo is not present
    #Wellbeing Scotland name is present
    element should be visible       xpath://*[@test-id='card-1106']//a[contains(text(), 'Wellbeing Scotland')]
    element text should be          xpath://*[@test-id='card-1106']//a[contains(text(), 'Wellbeing Scotland')]  Wellbeing Scotland

    #TO-DO
    #Org Details title for Wellbeing Scotland is present within Card
    #Wellbeing Scotland Org Phone label is present
    #Wellbeing Scotland Org Phone Data is correct
    #Wellbeing Scotland Email label is present
    #Wellbeing Scotland Email Data is correct
    #Wellbeing Scotland Org Address label is presnet
    #Wellbeing Scotland Org Address Data is correct


    #Who Cares? Scotland card is present
    element should be visible       xpath://*[@test-id='card-1108']
    #Who Cares? Scotland Logo is prompt for question is present
    log  Logo is not present
    #Who Cares? Scotland name is present
    element should be visible       xpath://*[@test-id='card-1108']//a[contains(text(), 'Who Cares? Scotland')]
    element text should be          xpath://*[@test-id='card-1108']//a[contains(text(), 'Who Cares? Scotland')]  Who Cares? Scotland

    #TO-DO
    #Org Details title for Who Cares? Scotland is present within Card
    #Who Cares? Scotland Org Phone label is present
    #Who Cares? Scotland Org Phone Data is correct
    #Who Cares? Scotland Email label is present
    #Who Cares? Scotland Email Data is correct
    #Who Cares? Scotland Org Address label is presnet
    #Who Cares? Scotland Org Address Data is correct

Use case 4 returns 6 National services
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

    #Feniks card is present
    element should be visible       xpath://*[@test-id='card-1049']
    #Feniks Logo is prompt for question is present
    log  Logo is not present
    #Feniks name is present
    element should be visible       xpath://*[@test-id='card-1049']//a[contains(text(), 'Feniks')]
    element text should be          xpath://*[@test-id='card-1049']//a[contains(text(), 'Feniks')]  Feniks

    #TO-DO
    #Org Details title for Feniks is present within Card
    #Feniks Org Phone label is present
    #Feniks Org Phone Data is correct
    #Feniks Email label is present
    #Feniks Email Data is correct
    #Feniks Org Address label is presnet
    #Feniks Org Address Data is correct

    #Future Pathways card is present
    element should be visible       xpath://*[@test-id='card-1053']
    #Future Pathways Logo is prompt for question is present
    log  Logo is not present
    #Future Pathways name is present
    element should be visible       xpath://*[@test-id='card-1053']//a[contains(text(), 'Future Pathways')]
    element text should be          xpath://*[@test-id='card-1053']//a[contains(text(), 'Future Pathways')]  Future Pathways

    #TO-DO
    #Org Details title for Future Pathways is present within Card
    #Future Pathways Org Phone label is present
    #Future Pathways Org Phone Data is correct
    #Future Pathways Email label is present
    #Future Pathways Email Data is correct
    #Future Pathways Org Address label is presnet
    #Future Pathways Org Address Data is correct

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

    #Wellbeing Scotland card is present
    element should be visible       xpath://*[@test-id='card-1106']
    #Wellbeing Scotland Logo is prompt for question is present
    log  Logo is not present
    #Wellbeing Scotland name is present
    element should be visible       xpath://*[@test-id='card-1106']//a[contains(text(), 'Wellbeing Scotland')]
    element text should be          xpath://*[@test-id='card-1106']//a[contains(text(), 'Wellbeing Scotland')]  Wellbeing Scotland

    #TO-DO
    #Org Details title for Wellbeing Scotland is present within Card
    #Wellbeing Scotland Org Phone label is present
    #Wellbeing Scotland Org Phone Data is correct
    #Wellbeing Scotland Email label is present
    #Wellbeing Scotland Email Data is correct
    #Wellbeing Scotland Org Address label is presnet
    #Wellbeing Scotland Org Address Data is correct


    #Who Cares? Scotland card is present
    element should be visible       xpath://*[@test-id='card-1108']
    #Who Cares? Scotland Logo is prompt for question is present
    log  Logo is not present
    #Who Cares? Scotland name is present
    element should be visible       xpath://*[@test-id='card-1108']//a[contains(text(), 'Who Cares? Scotland')]
    element text should be          xpath://*[@test-id='card-1108']//a[contains(text(), 'Who Cares? Scotland')]  Who Cares? Scotland

    #TO-DO
    #Org Details title for Who Cares? Scotland is present within Card
    #Who Cares? Scotland Org Phone label is present
    #Who Cares? Scotland Org Phone Data is correct
    #Who Cares? Scotland Email label is present
    #Who Cares? Scotland Email Data is correct
    #Who Cares? Scotland Org Address label is presnet
    #Who Cares? Scotland Org Address Data is correct

Use case 5 returns 2 National services
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

    #Campaign Against Living Miserably (CALM) card is present
    element should be visible       xpath://*[@test-id='card-1024']
    #Campaign Against Living Miserably (CALM) Logo is prompt for question is present
    log  Logo is not present
    #Campaign Against Living Miserably (CALM) name is present
    element should be visible       xpath://*[@test-id='card-1024']//a[contains(text(), 'Campaign Against Living Miserably (CALM)')]
    element text should be          xpath://*[@test-id='card-1024']//a[contains(text(), 'Campaign Against Living Miserably (CALM)')]  Campaign Against Living Miserably (CALM)

    #TO-DO
    #Org Details title for Campaign Against Living Miserably (CALM) is present within Card
    #Campaign Against Living Miserably (CALM) Org Phone label is present
    #Campaign Against Living Miserably (CALM) Org Phone Data is correct
    #Campaign Against Living Miserably (CALM) Email label is present
    #Campaign Against Living Miserably (CALM) Email Data is correct
    #Campaign Against Living Miserably (CALM) Org Address label is presnet
    #Campaign Against Living Miserably (CALM) Org Address Data is correct

Use case 6 returns 1 National service
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

    #Campaign Against Living Miserably (CALM) card is present
    element should be visible       xpath://*[@test-id='card-1024']
    #Campaign Against Living Miserably (CALM) Logo is prompt for question is present
    log  Logo is not present
    #Campaign Against Living Miserably (CALM) name is present
    element should be visible       xpath://*[@test-id='card-1024']//a[contains(text(), 'Campaign Against Living Miserably (CALM)')]
    element text should be          xpath://*[@test-id='card-1024']//a[contains(text(), 'Campaign Against Living Miserably (CALM)')]  Campaign Against Living Miserably (CALM)

    #TO-DO
    #Org Details title for Campaign Against Living Miserably (CALM) is present within Card
    #Campaign Against Living Miserably (CALM) Org Phone label is present
    #Campaign Against Living Miserably (CALM) Org Phone Data is correct
    #Campaign Against Living Miserably (CALM) Email label is present
    #Campaign Against Living Miserably (CALM) Email Data is correct
    #Campaign Against Living Miserably (CALM) Org Address label is presnet
    #Campaign Against Living Miserably (CALM) Org Address Data is correct



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
    #@Scott Street Care card is present
    element should be visible       xpath://*[@test-id='card-1001']
    #@Scott Street Logo is prompt for question is present
    log  Logo is not present
    #@Scott Street name is present
    element should be visible       xpath://*[@test-id='card-1001']//a[contains(text(), '@Scott Street')]
    element text should be          xpath://*[@test-id='card-1001']//a[contains(text(), '@Scott Street')]  @Scott Street

    #TO-DO
    #Org Details title for @Scott Street is present within Card
    #@Scott Street Org Phone label is present
    #@Scott Street Org Phone Data is correct
    #@Scott Street Org Email label is present
    #@Scott Street Org Email Data is correct
    #@Scott Street Org Address label is presnet
    #@Scott Street Org Address Data is correct

Action for Children
    #Action for Children Care card is present
    element should be visible       xpath://*[@test-id='card-1003']
    #Action for Children Logo is prompt for question is present
    log  Logo is not present
    #Action for Children name is present
    element should be visible       xpath://*[@test-id='card-1003']//a[contains(text(), 'Action for Children')]
    element text should be          xpath://*[@test-id='card-1003']//a[contains(text(), 'Action for Children')]  Action for Children

    #TO-DO
    #Org Details title for Action for Children is present within Card
    #Action for Children Org Phone label is present
    #Action for Children Org Phone Data is correct
    #Action for Children Org Email label is present
    #Action for Children Org Email Data is correct
    #Action for Children Org Address label is presnet
    #Action for Children Org Address Data is correct

Addaction
    #Addaction card is present
    element should be visible       xpath://*[@test-id='card-1004']
    #Addaction Logo is prompt for question is present
    log  Logo is not present
    #Addaction name is present
    element should be visible       xpath://*[@test-id='card-1004']//a[contains(text(), 'Addaction')]
    element text should be          xpath://*[@test-id='card-1004']//a[contains(text(), 'Addaction')]  Addaction

    #TO-DO
    #Org Details title for Addaction is present within Card
    #Addaction Org Phone label is present
    #Addaction Org Phone Data is correct
    #Addaction Org Email label is present
    #Addaction Org Email Data is correct
    #Addaction Org Address label is presnet
    #Addaction Address Data is correct

Advocard
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

Akordia
    #Akordia card is present
    element should be visible       xpath://*[@test-id='card-1006']
    #Akordia Logo is prompt for question is present
    log  Logo is not present
    #Akordia name is present
    element should be visible       xpath://*[@test-id='card-1006']//a[contains(text(), 'Akordia')]
    element text should be          xpath://*[@test-id='card-1006']//a[contains(text(), 'Akordia')]  Advocard

    #TO-DO
    #Org Details title for Akordia is present within Card
    #Akordia Org Phone label is present
    #Akordia Org Phone Data is correct
    #Akordia Email label is present
    #Akordia Email Data is correct
    #Akordia Org Address label is presnet
    #Akordia Org Address Data is correct

Alcohol and Drug Support South West Scotland (ADS)
    #Alcohol and Drug Support South West Scotland (ADS) card is present
    element should be visible       xpath://*[@test-id='card-1007']
    #Alcohol and Drug Support South West Scotland (ADS) Logo is prompt for question is present
    log  Logo is not present
    #Alcohol and Drug Support South West Scotland (ADS) name is present
    element should be visible       xpath://*[@test-id='card-1007']//a[contains(text(), 'Alcohol and Drug Support South West Scotland (ADS)')]
    element text should be          xpath://*[@test-id='card-1007']//a[contains(text(), 'Alcohol and Drug Support South West Scotland (ADS)')]  Alcohol and Drug Support South West Scotland (ADS)

    #TO-DO
    #Org Details title for Alcohol and Drug Support South West Scotland (ADS) is present within Card
    #Alcohol and Drug Support South West Scotland (ADS) Org Phone label is present
    #Alcohol and Drug Support South West Scotland (ADS) Org Phone Data is correct
    #Alcohol and Drug Support South West Scotland (ADS) Email label is present
    #Alcohol and Drug Support South West Scotland (ADS) Email Data is correct
    #Alcohol and Drug Support South West Scotland (ADS) Org Address label is presnet
    #Alcohol and Drug Support South West Scotland (ADS) Org Address Data is correct

Alcoholics Anonymous
    #Alcoholics Anonymous card is present
    element should be visible       xpath://*[@test-id='card-1008']
    #Alcoholics Anonymous Logo is prompt for question is present
    log  Logo is not present
    #Alcoholics Anonymous name is present
    element should be visible       xpath://*[@test-id='card-1008']//a[contains(text(), 'Alcoholics Anonymous')]
    element text should be          xpath://*[@test-id='card-1008']//a[contains(text(), 'Alcoholics Anonymous')]  Alcoholics Anonymous

    #TO-DO
    #Org Details title for Alcoholics Anonymous is present within Card
    #Alcoholics Anonymous Org Phone label is present
    #Alcoholics Anonymous Org Phone Data is correct
    #Alcoholics Anonymous Email label is present
    #Alcoholics Anonymous Email Data is correct
    #Alcoholics Anonymous Org Address label is presnet
    #Alcoholics Anonymous Org Address Data is correct


All in Edinburgh (Enable Scotland)
    #All in Edinburgh (Enable Scotland) card is present
    element should be visible       xpath://*[@test-id='card-1009']
    #All in Edinburgh (Enable Scotland) Logo is prompt for question is present
    log  Logo is not present
    #All in Edinburgh (Enable Scotland) name is present
    element should be visible       xpath://*[@test-id='card-1009']//a[contains(text(), 'All in Edinburgh (Enable Scotland)')]
    element text should be          xpath://*[@test-id='card-1009']//a[contains(text(), 'All in Edinburgh (Enable Scotland)')]  All in Edinburgh (Enable Scotland)

    #TO-DO
    #Org Details title for All in Edinburgh (Enable Scotland) is present within Card
    #All in Edinburgh (Enable Scotland) Org Phone label is present
    #All in Edinburgh (Enable Scotland) Org Phone Data is correct
    #All in Edinburgh (Enable Scotland) Email label is present
    #All in Edinburgh (Enable Scotland) Email Data is correct
    #All in Edinburgh (Enable Scotland) Org Address label is presnet
    #All in Edinburgh (Enable Scotland) Org Address Data is correct


Alzheimer Scotland
    #Alzheimer Scotland card is present
    element should be visible       xpath://*[@test-id='card-1011']
    #Alzheimer Scotland Logo is prompt for question is present
    log  Logo is not present
    #Alzheimer Scotland name is present
    element should be visible       xpath://*[@test-id='card-1011']//a[contains(text(), 'Alzheimer Scotland')]
    element text should be          xpath://*[@test-id='card-1011']//a[contains(text(), 'Alzheimer Scotland')]  Alzheimer Scotland

    #TO-DO
    #Org Details title for Alzheimer Scotland is present within Card
    #Alzheimer Scotland Org Phone label is present
    #Alzheimer Scotland Org Phone Data is correct
    #Alzheimer Scotland Email label is present
    #Alzheimer Scotland Email Data is correct
    #Alzheimer Scotland Org Address label is presnet
    #Alzheimer Scotland Org Address Data is correct


Amina-the Muslim Women’s Resource Centre
    #Amina-the Muslim Women’s Resource Centre card is present
    element should be visible       xpath://*[@test-id='card-1011']
    #Amina-the Muslim Women’s Resource Centre Logo is prompt for question is present
    log  Logo is not present
    #Amina-the Muslim Women’s Resource Centre name is present
    element should be visible       xpath://*[@test-id='card-1011']//a[contains(text(), 'Amina-the Muslim Women’s Resource Centre')]
    element text should be          xpath://*[@test-id='card-1011']//a[contains(text(), 'Amina-the Muslim Women’s Resource Centre')]  Amina-the Muslim Women’s Resource Centre

    #TO-DO
    #Org Details title for Amina-the Muslim Women’s Resource Centre is present within Card
    #Amina-the Muslim Women’s Resource Centre Org Phone label is present
    #Amina-the Muslim Women’s Resource Centre Org Phone Data is correct
    #Amina-the Muslim Women’s Resource Centre Email label is present
    #Amina-the Muslim Women’s Resource Centre Email Data is correct
    #Amina-the Muslim Women’s Resource Centre Org Address label is presnet
    #Amina-the Muslim Women’s Resource Centre Org Address Data is correct


Apex Scotland
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


Arts Therapies (NHS Lothian)
    #Arts Therapies (NHS Lothian) card is present
    element should be visible       xpath://*[@test-id='card-1017']
    #Arts Therapies (NHS Lothian) Logo is prompt for question is present
    log  Logo is not present
    #Arts Therapies (NHS Lothian) name is present
    element should be visible       xpath://*[@test-id='card-1017']//a[contains(text(), 'Arts Therapies (NHS Lothian)')]
    element text should be          xpath://*[@test-id='card-1017']//a[contains(text(), 'Arts Therapies (NHS Lothian)')]  Arts Therapies (NHS Lothian)

    #TO-DO
    #Org Details title for Arts Therapies (NHS Lothian) is present within Card
    #Arts Therapies (NHS Lothian) Org Phone label is present
    #Arts Therapies (NHS Lothian) Org Phone Data is correct
    #Arts Therapies (NHS Lothian) Org Email label is present
    #Arts Therapies (NHS Lothian) Org Email Data is correct
    #Arts Therapies (NHS Lothian) Org Address label is presnet
    #Arts Therapies (NHS Lothian) Org Address Data is correct



ASH Scotland (Action on Smoking and Health)
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

Autism Initiatives UK
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

Beat National
    #Beat National card is present
    element should be visible       xpath://*[@test-id='card-1019']
    #Beat National Logo is prompt for question is present
    log  Logo is not present
    #Beat National name is present
    element should be visible       xpath://*[@test-id='card-1019']//a[contains(text(), 'Beat')]
    element text should be          xpath://*[@test-id='card-1019']//a[contains(text(), 'Beat')]  Beat

    #TO-DO
    #Org Details title for Beat National is present within Card
    #Beat National Org Phone label is present
    #Beat National Org Phone Data is correct
    #Beat National Email label is present
    #Beat National Email Data is correct
    #Beat National Org Address label is presnet
    #Beat National Org Address Data is correct

Birthlink
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


Breathing Space
    #Breathing Space card is present
    element should be visible       xpath://*[@test-id='card-1023']
    #Breathing Space Logo is prompt for question is present
    log  Logo is not present
    #Breathing Space name is present
    element should be visible       xpath://*[@test-id='card-1023']//a[contains(text(), 'Breathing Space')]
    element text should be          xpath://*[@test-id='card-1023']//a[contains(text(), 'Breathing Space')]  Breathing Space

    #TO-DO
    #Org Details title for Breathing Space is present within Card
    #Breathing Space Org Phone label is present
    #Breathing Space Org Phone Data is correct
    #Breathing Space Email label is present
    #Breathing Space Email Data is correct
    #Breathing Space Org Address label is presnet
    #Breathing Space Org Address Data is correct

Campaign Against Living Miserably (CALM)
    #Campaign Against Living Miserably (CALM) card is present
    element should be visible       xpath://*[@test-id='card-1024']
    #Campaign Against Living Miserably (CALM) Logo is prompt for question is present
    log  Logo is not present
    #Campaign Against Living Miserably (CALM) name is present
    element should be visible       xpath://*[@test-id='card-1024']//a[contains(text(), 'Campaign Against Living Miserably (CALM)')]
    element text should be          xpath://*[@test-id='card-1024']//a[contains(text(), 'Campaign Against Living Miserably (CALM)')]  Campaign Against Living Miserably (CALM)

    #TO-DO
    #Org Details title for Campaign Against Living Miserably (CALM) is present within Card
    #Campaign Against Living Miserably (CALM) Org Phone label is present
    #Campaign Against Living Miserably (CALM) Org Phone Data is correct
    #Campaign Against Living Miserably (CALM) Email label is present
    #Campaign Against Living Miserably (CALM) Email Data is correct
    #Campaign Against Living Miserably (CALM) Org Address label is presnet
    #Campaign Against Living Miserably (CALM) Org Address Data is correct

CAPS Independent Advocacy
    #CAPS Independent Advocacy card is present
    element should be visible       xpath://*[@test-id='card-1026']
    #CAPS Independent Advocacy) Logo is prompt for question is present
    log  Logo is not present
    #CAPS Independent Advocacy name is present
    element should be visible       xpath://*[@test-id='card-1026']//a[contains(text(), 'CAPS Independent Advocacy')]
    element text should be          xpath://*[@test-id='card-1026']//a[contains(text(), 'CAPS Independent Advocacy')]  CAPS Independent Advocacy

    #TO-DO
    #Org Details title for CAPS Independent Advocacy is present within Card
    #CAPS Independent Advocacy Org Phone label is present
    #CAPS Independent Advocacy Org Phone Data is correct
    #CAPS Independent Advocacy Email label is present
    #CAPS Independent Advocacy Email Data is correct
    #CAPS Independent Advocacy Org Address label is presnet
    #CAPS Independent Advocacy Org Address Data is correct

Cyrenians
    #Cyrenians card is present
    element should be visible       xpath://*[@test-id='card-1033']
    #Cyrenians Logo is prompt for question is present
    log  Logo is not present
    #Cyrenians name is present
    element should be visible       xpath://*[@test-id='card-1033']//a[contains(text(), 'Cyrenians')]
    element text should be          xpath://*[@test-id='card-1033']//a[contains(text(), 'Cyrenians')]  Cyrenians

    #TO-DO
    #Org Details title for Cyrenians is present within Card
    #Cyrenians Org Phone label is present
    #Cyrenians Org Phone Data is correct
    #Cyrenians Email label is present
    #Cyrenians Email Data is correct
    #Cyrenians Org Address label is presnet
    #Cyrenians Org Address Data is correct


Dads Rock
    #Dads Rock card is present
    element should be visible       xpath://*[@test-id='card-1034']
    #Dads Rock Logo is prompt for question is present
    log  Logo is not present
    #Dads Rock name is present
    element should be visible       xpath://*[@test-id='card-1034']//a[contains(text(), 'Dads Rock')]
    element text should be          xpath://*[@test-id='card-1034']//a[contains(text(), 'Dads Rock')]  Dads Rock

    #TO-DO
    #Org Details title for Dads Rock is present within Card
    #Dads Rock Org Phone label is present
    #Dads Rock Org Phone Data is correct
    #Dads Rock Email label is present
    #Dads Rock Email Data is correct
    #Dads Rock Org Address label is presnet
    #Dads Rock Org Address Data is correct


Enable Scotland
    #Enable Scotland card is present
    element should be visible       xpath://*[@test-id='card-1045']
    #Enable Scotland Logo is prompt for question is present
    log  Logo is not present
    #Enable Scotland name is present
    element should be visible       xpath://*[@test-id='card-1045']//a[contains(text(), 'Enable Scotland')]
    element text should be          xpath://*[@test-id='card-1045']//a[contains(text(), 'Enable Scotland')]  Enable Scotland

    #TO-DO
    #Org Details title for Enable Scotland is present within Card
    #Enable Scotland Org Phone label is present
    #Enable Scotland Org Phone Data is correct
    #Enable Scotland Email label is present
    #Enable Scotland Email Data is correct
    #Enable Scotland Org Address label is presnet
    #Enable Scotland Org Address Data is correct

Fast Forward
    #Fast Forward card is present
    element should be visible       xpath://*[@test-id='card-1048']
    #Fast Forward Logo is prompt for question is present
    log  Logo is not present
    #Fast Forward name is present
    element should be visible       xpath://*[@test-id='card-1048']//a[contains(text(), 'Fast Forward')]
    element text should be          xpath://*[@test-id='card-1048']//a[contains(text(), 'Fast Forward')]  Fast Forward

    #TO-DO
    #Org Details title for Fast Forward is present within Card
    #Fast Forward Org Phone label is present
    #Fast Forward Org Phone Data is correct
    #Fast Forward Email label is present
    #Fast Forward Email Data is correct
    #Fast Forward Org Address label is presnet
    #Fast Forward Org Address Data is correct


Feniks
    #Feniks card is present
    element should be visible       xpath://*[@test-id='card-1049']
    #Feniks Logo is prompt for question is present
    log  Logo is not present
    #Feniks name is present
    element should be visible       xpath://*[@test-id='card-1049']//a[contains(text(), 'Feniks')]
    element text should be          xpath://*[@test-id='card-1049']//a[contains(text(), 'Feniks')]  Feniks

    #TO-DO
    #Org Details title for Feniks is present within Card
    #Feniks Org Phone label is present
    #Feniks Org Phone Data is correct
    #Feniks Email label is present
    #Feniks Email Data is correct
    #Feniks Org Address label is presnet
    #Feniks Org Address Data is correct


Foundation for Positive Mental Health
    #Foundation for Positive Mental Health card is present
    element should be visible       xpath://*[@test-id='card-1051']
    #Foundation for Positive Mental Health Logo is prompt for question is present
    log  Logo is not present
    #Foundation for Positive Mental Health name is present
    element should be visible       xpath://*[@test-id='card-1051']//a[contains(text(), 'Foundation for Positive Mental Health')]
    element text should be          xpath://*[@test-id='card-1051']//a[contains(text(), 'Foundation for Positive Mental Health')]  Foundation for Positive Mental Health

    #TO-DO
    #Org Details title for Foundation for Positive Mental Health is present within Card
    #Foundation for Positive Mental Health Org Phone label is present
    #Foundation for Positive Mental Health Org Phone Data is correct
    #Foundation for Positive Mental Health Email label is present
    #Foundation for Positive Mental Health Email Data is correct
    #Foundation for Positive Mental Health Org Address label is presnet
    #Foundation for Positive Mental Health Org Address Data is correct

Future Pathways
    #Future Pathways card is present
    element should be visible       xpath://*[@test-id='card-1053']
    #Future Pathways Logo is prompt for question is present
    log  Logo is not present
    #Future Pathways name is present
    element should be visible       xpath://*[@test-id='card-1053']//a[contains(text(), 'Future Pathways')]
    element text should be          xpath://*[@test-id='card-1053']//a[contains(text(), 'Future Pathways')]  Future Pathways

    #TO-DO
    #Org Details title for Future Pathways is present within Card
    #Future Pathways Org Phone label is present
    #Future Pathways Org Phone Data is correct
    #Future Pathways Email label is present
    #Future Pathways Email Data is correct
    #Future Pathways Org Address label is presnet
    #Future Pathways Org Address Data is correct

Health in Mind
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

Held in Our Hearts
    #Held in Our Hearts card is present
    element should be visible       xpath://*[@test-id='card-1056']
    #Held in Our Hearts Logo is prompt for question is present
    log  Logo is not present
    #Held in Our Hearts name is present
    element should be visible       xpath://*[@test-id='card-1056']//a[contains(text(), 'Held in Our Hearts')]
    element text should be          xpath://*[@test-id='card-1056']//a[contains(text(), 'Held in Our Hearts')]  Held in Our Hearts

    #TO-DO
    #Org Details title for Held in Our Hearts is present within Card
    #Held in Our Hearts Org Phone label is present
    #Held in Our Hearts Org Phone Data is correct
    #Held in Our Hearts Email label is present
    #Held in Our Hearts Email Data is correct
    #Held in Our Hearts Org Address label is presnet
    #Held in Our Hearts Org Address Data is correct


HIV Scotland
    #HIV Scotland card is present
    element should be visible       xpath://*[@test-id='card-1056']
    #HIV Scotland Logo is prompt for question is present
    log  Logo is not present
    #HIV Scotland name is present
    element should be visible       xpath://*[@test-id='card-1056']//a[contains(text(), 'HIV Scotland')]
    element text should be          xpath://*[@test-id='card-1056']//a[contains(text(), 'HIV Scotland')]  HIV Scotland

    #TO-DO
    #Org Details title for HIV Scotland is present within Card
    #HIV Scotland Org Phone label is present
    #HIV Scotland Org Phone Data is correct
    #HIV Scotland Email label is present
    #HIV Scotland Email Data is correct
    #HIV Scotland Org Address label is presnet
    #HIV Scotland Org Address Data is correct

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
