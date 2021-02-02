*** Settings ***
Library         SeleniumLibrary
Library         String
#Library         FakerLibrary
Resource        common.robot


Library  SeleniumLibrary
Library  String
Library  DateTime

#Test Setup  begin test
#Test Teardown  end test


*** Variables ***
${LOWER}            qwertyuiopasdfghjklzxcvbnm
${UPPER}            QWERTYUIOPASDFGHJKLZXCVBNM
${LETTERS}          ${LOWER}${UPPER}
${NUMBERS}          123456789
${ALPHANUMERIC}     ${LETTERS}${NUMBERS}


${DEVURL} =  https://dev.miricyl.org/
${TSTURL} =
${LIVE} =

