*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     DataDriver      file=resources/data.csv     encoding=utf_8      dialect=unix
Test Teardown   Close Browser
Test Template   Validate Successful Login
#Resource
*** Variables ***
${Error_Message_Login}   css:.alert.alert-danger.col-md-12

*** Test Cases ***
Login with user ${username} and password {password}     xyz     123


*** Keywords ***
Validate Successful Login
    [Arguments]     ${username}     ${password}
     Open the browser with the Mortgage payment url
     Fill the login Form        ${username}     ${password}
     wait until it checks and display error message
     verify error message is correct

#*** Keywords ***Removed this
Open the browser with the Mortgage payment url
    Create Webdriver    Chrome  executable_path=C:/Users/panda/Downloads/chromedriver_win32/chromedriver.exe
    Go To   https://rahulshettyacademy.com/loginpagePractise/
    maximize browser window
Fill the login Form
    [arguments]         ${user_name}      ${password}
    Input Text          xpath://input[@id='username']   ${user_name}
    input password      id:password                     ${password}
    Click Button        css:input[id='signInBtn']
wait until it checks and display error message
    Wait Until Element Is Visible   ${Error_Message_Login}
verify error message is correct
    ${result}=  Get Text    ${Error_Message_Login}
    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be  ${Error_Message_Login}  Incorrect username/password.
    #Close Browser

