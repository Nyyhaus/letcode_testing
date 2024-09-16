*** Settings ***
Documentation     Validating alert prompts.
Resource          resource.resource

*** Test Cases ***
Valid Alerts
  Go To Alerts Page
  Accepting Alert
  Dismiss the Alert & print the alert text
  Type your name & accept
  Test Sweet Alert

*** Keywords ***
Go To Alerts Page
  Go To           https://letcode.in/alert

Accepting Alert
  Click Button    accept    
  Alert Should Be Present   Hey! Welcome to LetCode 

Dismiss the Alert & print the alert text
  Click Button    confirm  
  ${alert text}   Handle Alert    action=DISMISS 
  Log To Console  \n${alert text}

Type your name & accept
  Click Button    prompt    
  Input Text Into Alert     Testi Testaaja

Test Sweet Alert
  Click Button    modern   

