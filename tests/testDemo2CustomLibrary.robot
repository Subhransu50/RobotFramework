*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     Collections
Library     ../customLibraries/Shop.py
Test Setup      Open the browser with the Mortgage payment url
Test Teardown   Close Browser Session
Resource        resource.robot

*** Variables ***
${Error_Message_Login}   css:.alert.alert-danger.col-md-12
${Home_Icon}      xpath://a[@class='nav-link' and text()='Home']
@{listofProducts}       Blackberry      Nokia Edge

*** Test Cases ***
Validate Successful Login
     #Open the browser with the Mortgage payment url
     Fill the login Form    ${user_name}    ${password}
     wait until Element Is Visibles   ${Error_Message_Login}
     verify error message is correct

Validate Cards display in the Shopping Page
    Fill the login Form     ${valid_user_name}  ${valid_password}
    wait until Element Is Visibles     ${Home_Icon}
    Verify CardTitles in the shop page
    #Select the Card     BlackBerry
    add items to cart and checkout      {listofProducts}


*** Keywords ***

Fill the login Form
    [arguments]         ${user_name}        ${password}
    Input Text          xpath://input[@id='username']   ${user_name}
    input password      id:password                     ${password}
    Click Button        css:input[id='signInBtn']
wait until Element Is Visibles
    [arguments]         ${Element}
    Wait Until Element Is Visible   ${Element}
verify error message is correct
    ${result}=  Get Text    ${Error_Message_Login}
    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be  ${Error_Message_Login}  Incorrect username/password.
    #Close Browser
Verify CardTitles in the shop page
    @{expectedList} =       Create List     iphone X    Samsung Note 8  Nokia Edge  Blackberry
    ${elements} =       Get WebElements     xpath://h4[@class='card-title']
    @{actualList} =      Create List
    FOR    ${element}    IN      @{elements}
        Log     ${element.text}
        Append To List    ${actualList}       ${element.text}
    END
    Lists Should Be Equal   ${expectedList}     ${actualList}
Select the Card
    [arguments]     ${cardName}
    ${elements} =   Get WebElements     xpath://h4[@class='card-title']
    ${index}=   Set Variable    0
    FOR    ${element}    IN      @{elements}
        Exit For Loop If    '${cardName}' == '${element.text}'
        ${index}=   Evaluate   ${index}+1

    END
    Click Button    xpath:(//div[@class='card-footer']//button)[${index}]





