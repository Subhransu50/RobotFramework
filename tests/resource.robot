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
    #Open Browser    ${browser_name}  executable_path=C:/Users/panda/Downloads/chromedriver_win32/chromedriver.exe   remote_url=http://oauth-pandasekharsubhransu2020-7c486:f732e0ef-e613-472b-ba22-5c10723153c8@ondemand.saucelabs.com:80/wd/hub  desired_capabilities=name:Win 10 + Chrome 70,platform:Windows 10,browserName:chrome,version:70.0
    Create Webdriver    ${browser_name}  executable_path=C:/Users/panda/Downloads/chromedriver_win32/chromedriver.exe
    #Create Webdriver    ${browser_name}  executable_path=resources/${browser_name}driver.exe
    Go To   ${url}
    maximize browser window
Close Browser Session
    Close Browser
Wait Until Element is Visible On the WebPage
    [arguments]     ${WebElementInterface}
    Wait Until Element Is Visible       ${WebElementInterface}
