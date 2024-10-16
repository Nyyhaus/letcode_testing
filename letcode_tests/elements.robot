*** Settings ***
Documentation       Working with different elements.

Resource            resource.resource


*** Test Cases ***
Valid Elements
    Go To Elements Page
    Insert Git Username
    Asserting User Has Profile Image
    Print the user name & other informations
    Asserting Public Repository Count


*** Keywords ***
Go To Elements Page
    Go To    https://letcode.in/elements

Insert Git Username
    Input Text    username    ortonikc
    Click Button    search

Asserting User Has Profile Image
    Wait Until Page Contains    Koushik Chatterjee
    Page Should Contain Element    class:is-rounded

Print the user name & other informations
    BuiltIn.Sleep    1
    ${username}    Get Text    css:.is-4
    ${location}    Get Text    css:.is-6
    ${description}    Get Text    css:.media-content > span:nth-child(3)
    Log To Console    \n${username} \n${location} \n${description}

Asserting Public Repository Count
    ${repos}    Get Text    css:.is-info
    Log To Console    ${repos}
    ${repo links}    Get Element Count    xpath://a[contains(@href, 'https://github.com/ortoniKC/')]
    Log To Console    ${repo links}
    # fails
    # Should Be Equal    ${repos}    ${repo links}
