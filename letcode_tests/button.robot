*** Settings ***
Documentation       Validating different buttons.

Resource            resource.resource
# Test Setup    Open Browser To Letcode Workspace Page
# Test Teardown    Close Browser


*** Test Cases ***
Valid Inputs
    Go To Button Page
    Click Home Button And Go Back
    Find Button Coordinates
    Get Button Color
    Get Button Size
    Confirm Button Is Disabled
    Click And Hold Button


*** Keywords ***
Go To Button Page
    Go To    ${BUTTON URL}
    Button Page Should Be Open

Button Page Should Be Open
    Title Should Be    Interact with Button fields

Click Home Button And Go Back
    Click Button    home
    Go Back

Find Button Coordinates
    ${button horizontal}    Get Horizontal Position    position
    ${button vertical}    Get Vertical Position    position
    Log To Console    ${button horizontal} ${button vertical}

Get Button Color
    Click Button    color
    ${elem}    Get Webelement    css=.button.is-primary
    ${btn color}    Call Method    ${elem}    value_of_css_property    background-color
    Log To Console    ${btn color}

Get Button Size
    ${btn size}    Get Element Size    property
    Log To Console    ${btn size}

Confirm Button Is Disabled
    Element Should Be Disabled    css:.is-info

Click And Hold Button
    Mouse Down    css:div.field:nth-child(6) > div:nth-child(2) > button:nth-child(1)
    Sleep    2
    Mouse Up    css:div.field:nth-child(6) > div:nth-child(2) > button:nth-child(1)
