*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Test Teardown   Close Browser
#Resource
*** Variables ***
${Error_Message_Login}   css:.alert.alert-danger.col-md-12

*** Test Cases ***
Validate Successful Login
     Open the browser with the Mortgage payment url
     Fill the login Form
     wait until it checks and display error message
     verify error message is correct

*** Keywords ***
Open the browser with the Mortgage payment url
    Create Webdriver    Chrome  executable_path=C:/Users/panda/Downloads/chromedriver_win32/chromedriver.exe
    Go To   https://rahulshettyacademy.com/loginpagePractise/
    maximize browser window
Fill the login Form
    Input Text          xpath://input[@id='username']   Subhransu
    input password      id:password                     panda
    Click Button        css:input[id='signInBtn']
wait until it checks and display error message
    Wait Until Element Is Visible   ${Error_Message_Login}
verify error message is correct
    ${result}=  Get Text    ${Error_Message_Login}
    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be  ${Error_Message_Login}  Incorrect username/password.
    #Close Browser

