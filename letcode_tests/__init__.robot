*** Settings ***
Documentation     Suite initialization for letcode tests.
Suite Setup       Open Browser To Letcode Workspace Page
Suite Teardown    Close Browser
Resource          resource.resource

*** Keywords ***
Open Browser To Letcode Workspace Page
  Open Browser    ${WORKSPACE URL}    ${BROWSER}
  Maximize Browser Window
  Set Selenium Speed    ${DELAY}
  Workspace Page Should Be Open

Workspace Page Should Be Open
  Title Should Be   LetCode - Testing Hub 
