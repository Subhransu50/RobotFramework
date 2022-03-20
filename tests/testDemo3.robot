*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     Collections
Library     String
Test Setup      Open the browser with the Mortgage payment url
Test Teardown   Close Browser Session
Resource        resource.robot
*** Variables ***
${Error_Message_Login}   css:.alert.alert-danger.col-md-12
${Home_Icon}      xpath://a[@class='nav-link' and text()='Home']

*** Test Cases ***

Select the form and navigate to Child Window
    Fill the Login Details and select the User option
    [Tags]      Sanity
Validate Child window Functionality
    Click the link of Child window
    Verify the user is Switched to Child window
    Grab the Email id in the Child Window
    Switch to Parent window and enter the Email

*** Keywords ***
Fill the Login Details and select the User option
    Input Text          xpath://input[@id='username']   rahulshettyacademy
    input password      id:password                     learning
    Click Element       xpath:(//label[@class='customradio'])[2]//span[text()=' User']/following-sibling::input/following-sibling::span
    Wait Until Element Is Visible       css:.modal-body
    Click Element       css:button[id='okayBtn']
    Wait Until Element Is Not Visible       css:.modal-body
    Select From List By Value       //select[@class='form-control']     teach
    Select Checkbox     id:terms
    Checkbox Should Be Selected     id:terms
Click the link of Child window
    click element       css:.blinkingText:nth-child(1)
    Sleep               5
Verify the user is Switched to Child window
    Switch Window   NEW
    element text should be      xpath://h1[text()='Documents request']      DOCUMENTS REQUEST
Grab the Email id in the Child Window
    ${text}=         get text        css:.red a
    log     ${text}
    ${full_sentence}    get text    css:.red:nth-child(2)
    @{words}=    split string    ${full_sentence}    at
    ${text_split}=      Get From List       ${words}        1
    log     ${text_split}
    @{words_2}=    split string    ${text_split}
    ${email}=      Get From List        ${words_2}      0
    log     ${email}
    Set Global Variable     ${email}
Switch to Parent window and enter the Email
    switch window       MAIN
    Title Should Be     LoginPage Practise | Rahul Shetty Academy
    Input Text          xpath://input[@id='username']       ${email}






