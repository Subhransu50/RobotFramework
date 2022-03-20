*** Settings ***
Documentation    All the page objects and keywords of landing page
Library     SeleniumLibrary
*** Variables ***
${Home_Icon}      xpath://a[@class='nav-link' and text()='Home']




*** Keywords ***
Verify items in the Checkot Page and proceed
    [arguments]     ${expectedList}
    ${elements}=      Get WebElements      xpath://h4[@class='media-heading']//a
    @{actualList} =      Create List
    FOR    ${element}    IN      @{elements}
        Log     ${element.text}
        Append To List    ${actualList}       ${element.text}
    END
    Lists Should Be Equal       ${expectedList}    ${actualList}
    click element       xpath://button[@class='btn btn-success']