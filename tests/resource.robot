*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary

*** Variables ***
${user_name}     Subhransu
${password}      panda
${valid_user_name}  rahulshettyacademy
${valid_password}   learning
${url}           https://rahulshettyacademy.com/loginpagePractise/
${browser_name}     Chrome

*** Keywords ***
Open the browser with the Mortgage payment url
    Create Webdriver    ${browser_name}  executable_path=C:/Users/panda/Downloads/chromedriver_win32/chromedriver.exe
    #Create Webdriver    ${browser_name}  executable_path=resources/${browser_name}driver.exe
    Go To   ${url}
    maximize browser window
Close Browser Session
    Close Browser
Wait Until Element is Visible On the WebPage
    [arguments]     ${WebElementInterface}
    Wait Until Element Is Visible       ${WebElementInterface}
