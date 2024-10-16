*** Settings ***
Documentation       Validating dropdown menus.

Resource            resource.resource


*** Test Cases ***
Valid Dropdowns
    Go To Dropdown Page
    Select Apple Using Visible Text
    Select Super Heroes
    Pick the last programming language and print all the options
    Select India using value & print the selected value


*** Keywords ***
Go To Dropdown Page
    Go To    https://letcode.in/dropdowns

Select Apple Using Visible Text
    Select From List By Label    fruits    Apple

Select Super Heroes
    Select From List By Value    superheros    am    aq

Pick the last programming language and print all the options
    @{languages}    Get List Items    lang
    ${len languages}    Get Length    ${languages}
    Select From List By Index    lang    ${len languages - 1}
    Log To Console    \n
    FOR    ${language}    IN    @{languages}
        Log To Console    ${language}
    END

Select India using value & print the selected value
    Select From List By Value    country    India
    ${country}    Get Selected List Value    country
    Log To Console    ${country}
