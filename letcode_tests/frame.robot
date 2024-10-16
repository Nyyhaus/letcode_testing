*** Settings ***
Documentation       Validating alert prompts.

Resource            resource.resource


*** Test Cases ***
Valid Frames
    Go To Frames Page
    Select Frame And Enter Details


*** Keywords ***
Go To Frames Page
    Go To    https://letcode.in/frame

Select Frame And Enter Details
    Select Frame    xpath://iframe[@src='frameUI']
    Input Text    name:fname    Testi
    Input Text    name:lname    Prove
    Select Frame    xpath://IFRAME[@class="has-background-white"]
    Input Text    name:email    Email
    Unselect Frame
    Unselect Frame
