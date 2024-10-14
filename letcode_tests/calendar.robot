*** Settings ***
Documentation     Test calendar functions.
Resource          resource.resource
#Test Setup        Open Browser To Letcode Workspace Page
#Test Teardown     Close Browser

*** Test Cases ***
Test Calendar 
  Go To Calendar Page
  Select Today Date
  Select Week Later Date

*** Keywords ***
Go To Calendar Page
  Go To     https://letcode.in/calendar

Select Today Date
  Click Button     //button[text()="Today"] 

Select Week Later Date
  ${yyyy}    ${mm}    ${dd}   Get Time    year,month,day
  ${week_later}     Evaluate    ${dd}+7
  Click Button     //button[text()=${week_later}]
