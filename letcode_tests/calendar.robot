*** Settings ***
Documentation     Test calendar functions.
Resource          resource.resource
Test Setup        Open Browser To Letcode Workspace Page
Test Teardown     Close Browser
Library           DateTime

*** Test Cases ***
Test Calendar 
  Go To Calendar Page
  Select Today Date
  Select Week Later Date
  Select Month Later Date
  Select previous 20 & next 10 days

*** Keywords ***
Go To Calendar Page
  Go To     https://letcode.in/calendar

Select Today Date
  Click Button     //button[text()="Today"] 

Select Week Later Date
  ${yyyy}    ${mm}    ${dd}   Get Time    year,month,day
  ${week_later}     Evaluate    ${dd}+7
  Click Button     //button[text()=${week_later}]

Select Month Later Date
  ${next_month}     Get Current Date    increment=30 days    result_format=%b
  Click Element     //div[@class="datepicker-nav-month"]
  Click Element     //div[text()="${next_month}"]

Select previous 20 & next 10 days
  ${prev_20_day}      Get Current Date    increment=-20 days    result_format=%d
  ${prev_20_month}    Get Current Date    increment=-20 days    result_format=%b
  ${next_10_day}      Get Current Date    increment=10 days     result_format=%d
  ${next_10_month}    Get Current Date    increment=10 days     result_format=%b
  Click Element       css:.is-datetimepicker-range
  Click Element       //div[@class='datepicker is-active']//div[@class='datepicker-nav']//div[@class='datepicker-nav-month-year']//div[@class='datepicker-nav-month']
  Click Element       //div[@class='datepicker-months is-active']//div[@class='datepicker-month'][contains(text(),'${prev_20_month}')]
  Click Element       //div[@class='datepicker-dates is-active']//div[@class='datepicker-days']//div[@class='datepicker-date is-current-month']//button[@type='button'][contains(text(),'${prev_20_day}')]
  Click Element       //div[@class='datetimepicker is-primary is-datetimepicker-default is-active']//div[@class='datetimepicker-footer']//button[@type='button'][contains(text(),'Close')]

  Click Element       css:input.datetimepicker-dummy-input:nth-child(2)
  Click Element       //div[@class='datepicker is-active']//div[@class='datepicker-nav']//div[@class='datepicker-nav-month-year']//div[@class='datepicker-nav-month']
  Click Element       //div[@class='datepicker-months is-active']//div[@class='datepicker-month'][contains(text(),'${next_10_month}')]
  Click Element       //div[@class='datepicker-dates is-active']//div[@class='datepicker-days']//div[@class='datepicker-date is-current-month']//button[@type='button'][contains(text(),'${next_10_day}')]
