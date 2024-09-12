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


