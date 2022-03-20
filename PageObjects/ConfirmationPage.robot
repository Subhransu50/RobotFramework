*** Settings ***
Documentation    All the page objects and keywords of landing page
Library     SeleniumLibrary
*** Variables ***
${Home_Icon}      xpath://a[@class='nav-link' and text()='Home']
${country_name}     xpath://a[text()='India']




*** Keywords ***
Enter the Coutry and select the terms and condition
    [arguments]     ${country_name}
    input text      id:country      ${country_name}
    Sleep           3
    Wait Until Element is Visible On the WebPage   xpath://a[text()='${country_name}']
    click element       xpath://a[text()='${country_name}']
    click element       css:.checkbox.checkbox-primary label
    #click element       xpath://input[@type='submit']

ConfirmationPage.Purchase the Product and Confirm the Purchase
     click element       xpath://input[@type='submit']
     Page Should Contain    Success!