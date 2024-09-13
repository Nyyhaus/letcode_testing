*** Settings *** 
Documentation     A resource file with reusable variables.
Library           SeleniumLibrary

*** Variables ***
${URL}            https://letcode.in
${WORKSPACE URL}  ${URL}/test
${INPUT URL}      ${URL}/edit 
${BUTTON URL}     ${URL}/buttons
${BROWSER}        firefox 
${DELAY}          0

*** Keywords ***
Open Browser To Letcode Workspace Page
  Open Browser    ${WORKSPACE URL}    ${BROWSER}
  Maximize Browser Window
  Set Selenium Speed    ${DELAY}
  Workspace Page Should Be Open

Workspace Page Should Be Open
  Title Should Be   LetCode - Testing Hub 
