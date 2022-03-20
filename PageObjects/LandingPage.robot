*** Settings ***
Documentation    All the page objects and keywords of landing page
Library     SeleniumLibrary
*** Variables ***
${Error_Message_Login}   css:.alert.alert-danger.col-md-12



*** Keywords ***
Fill the login Form
    [arguments]         ${user_name}        ${password}
    Input Text          xpath://input[@id='username']   ${user_name}
    input password      id:password                     ${password}
    Click Button        css:input[id='signInBtn']
wait until Element Is Visibles
    [arguments]         ${Element}
    Wait Until Element is Visible On the WebPage   ${Element}
verify error message is correct
    ${result}=  Get Text    ${Error_Message_Login}
    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be  ${Error_Message_Login}  Incorrect username/password.
    #Close Browser