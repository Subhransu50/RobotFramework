*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     Collections
Library     ../customLibraries/Shop.py
Test Setup      Open the browser with the Mortgage payment url
Test Teardown   Close Browser Session
Resource        resource.robot
Resource        ../PageObjects/LandingPage.robot
Resource        ../PageObjects/ShopPage.robot
Resource        ../PageObjects/CheckOutPage.robot
Resource        ../PageObjects/ConfirmationPage.robot
*** Variables ***
@{listofProducts}       Samsung Note 8      Nokia Edge      Blackberry
${country_name}         India

*** Test Cases ***
Validate Successful Login
        [Tags]      Sanity
     #Open the browser with the Mortgage payment url
     LandingPage.Fill the login Form    ${user_name}    ${password}
     LandingPage.wait until Element Is Visibles   ${Error_Message_Login}
     LandingPage.verify error message is correct

Validate Cards display in the Shopping Page
    LandingPage.Fill the login Form     ${valid_user_name}  ${valid_password}
    ShopPage.wait until Element Is Visibles     ${Home_Icon}
    ShopPage.Verify CardTitles in the shop page
    #Select the Card     BlackBerry
    add items to cart and checkout      ${listofProducts}
    Sleep   5
    CheckOutPage.Verify items in the Checkot Page and proceed    ${listofProducts}
    ConfirmationPage.Enter the Coutry and select the terms and condition     ${country_name}
    #ConfirmationPage.wait until Element Is Visibles     ${country_name}
    ConfirmationPage.Purchase the Product and Confirm the Purchase



*** Keywords ***







