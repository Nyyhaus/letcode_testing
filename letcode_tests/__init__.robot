*** Settings ***
Documentation       Suite initialization for letcode tests.

Resource            resource.resource

Suite Setup         Open Browser To Letcode Workspace Page
Suite Teardown      Close Browser


*** Keywords ***
Open Browser To Letcode Workspace Page
    Open Browser    ${WORKSPACE URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
