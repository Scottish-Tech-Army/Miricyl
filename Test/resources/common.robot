*** Settings ***
Library  SeleniumLibrary
Library  String

*** Variables ***
${browser}      headlesschrome
*** Keywords ***
Begin test
    open browser  about:blank  ${browser}
    maximize browser window
    #TODO add more


End test
    [Documentation]  Logout
    sleep  3s
    close browser

