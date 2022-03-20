*** Settings ***
Documentation    All the page objects and keywords of landing page
Library     SeleniumLibrary
*** Variables ***
${Home_Icon}      xpath://a[@class='nav-link' and text()='Home']




*** Keywords ***
wait until Element Is Visibles
    [arguments]         ${Element}
    Wait Until Element is Visible On the WebPage   ${Element}
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