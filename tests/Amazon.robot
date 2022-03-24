*** Settings ***
Documentation  A simple Amazon.com suite
Library  SeleniumLibrary

*** Variables ***
# These variables can be overriden on the command line
${BROWSER} =  chrome
${START_URL} =  https://www.amazon.com
${remote_url}=  https://oauth-pandasekharsubhransu2020-7c486:f732e0ef-e613-472b-ba22-5c10723153c8@ondemand.eu-central-1.saucelabs.com:443/wd/hub
${Access_key}=  f732e0ef-e613-472b-ba22-5c10723153c8
${restOfUrl}=   ondemand.eu-central-1.saucelabs.com:443/wd/hub
${desired_capabilities}=    name:abcd,platformName:Windows 10,browserName:firefox,browserVersion:latest

# Use this terminal command to RUN
# robot -d results tests/amazon.robot

*** Test Cases ***
Simple Web GUI Test
    [Documentation]  A simple Amazon.com test
    [Tags]  Smoke
    #Open Browser  ${START_URL}  ${BROWSER}  remote_url=https://oauth-pandasekharsubhransu2020-7c486:f732e0ef-e613-472b-ba22-5c10723153c8@ondemand.eu-central-1.saucelabs.com:443/wd/hub     desired_capabilities=name:Win 10 + Chrome 70,platformName:Windows 10,browserName:chrome,browserVersion:latest
    Open Browser  ${START_URL}  ${BROWSER}      remote_url=${remote_url}    desired_capabilities=${desired_capabilities}
    Wait Until Page Contains  Hello, Sign in
    Input Text  css:#twotabsearchtextbox  Ferrari
    Click Button  css:#nav-search-submit-button
    Close Browser

*** Keywords ***
