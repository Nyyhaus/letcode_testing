*** Settings ***
Documentation       Test calendar functions.

Resource            resource.resource
Library             DateTime

#Test Setup          Open Browser To Letcode Workspace Page
#Test Teardown       Close Browser


*** Test Cases ***
Test Calendar
    Go To Calendar Page
    Select Today Date
    Select Week Later Date
    Select Month Later Date
    Select Previous 20 Days As Start Date
    Select Next 10 Days As End Date

Test Time Range Selection
    Go To Calendar Page
    Select Start Date As Today
    Select End Date After 3 Days
    Select time after 2 hrs
    #Verify Time Range


*** Keywords ***
Go To Calendar Page
    Go To    https://letcode.in/calendar

Select Today Date
    Click Button    //button[text()="Today"]

Select Week Later Date
    ${yyyy}    ${mm}    ${dd}    Get Time    year,month,day
    ${week_later}    Evaluate    ${dd}+7
    Click Button    //button[text()=${week_later}]

Select Month Later Date
    ${next_month}    Get Current Date    increment=30 days    result_format=%b
    Click Element    //div[@class="datepicker-nav-month"]
    Click Element    //div[text()="${next_month}"]

Select Previous 20 Days As Start Date
    ${prev_20_day}    Get Current Date    increment=-20 days    result_format=%d
    ${prev_20_month}    Get Current Date    increment=-20 days    result_format=%b
    Click Element    css:.is-datetimepicker-range
    Click Element
    ...    //div[@class='datepicker is-active']//div[@class='datepicker-nav']//div[@class='datepicker-nav-month-year']//div[@class='datepicker-nav-month']
    Click Element
    ...    //div[@class='datepicker-months is-active']//div[@class='datepicker-month'][contains(text(),'${prev_20_month}')]
    Click Element
    ...    //div[@class='datepicker-dates is-active']//div[@class='datepicker-days']//div[@class='datepicker-date is-current-month']//button[@type='button'][contains(text(),'${prev_20_day}')]
    Sleep    2

Select Next 10 Days As End Date
    ${next_10_day}    Get Current Date    increment=10 days    result_format=%d
    ${next_10_month}    Get Current Date    increment=10 days    result_format=%b
    Click Element
    ...    //div[@class='datepicker is-active']//div[@class='datepicker-nav']//div[@class='datepicker-nav-month-year']//div[@class='datepicker-nav-month']
    Click Element
    ...    //div[@class='datepicker-months is-active']//div[@class='datepicker-month'][contains(text(),'${next_10_month}')]
    Click Element
    ...    //div[@class='datepicker-dates is-active']//div[@class='datepicker-days']//div[@class='datepicker-date is-current-month']//button[@type='button'][contains(text(),'${next_10_day}')]
    Sleep    2

Select Start Date As Today
    Click Element    css:.is-datetimepicker-range
    Click Element
    ...    //div[@class='datetimepicker is-primary is-datetimepicker-default is-active']//div[@class='datetimepicker-footer']//button[@type='button'][contains(text(),'Today')]

Select End Date After 3 Days
    ${next_3_days}    Get Current Date    increment=3 days    result_format=%d
    Click Element
    ...    //div[@class='datepicker-dates is-active']//div[@class='datepicker-days']//div[@class='datepicker-date is-current-month']//button[@type='button'][contains(text(),'${next_3_days}')]

Select time after 2 hrs
    Click Element    //div[@class='timepicker-hours']//span[@class='timepicker-next'][contains(text(),'+')]
    Click Element    //div[@class='timepicker-hours']//span[@class='timepicker-next'][contains(text(),'+')]

# TODO
Verify Time Range
    Page Should Contain    You have selected from 16-Oct-2024 to ${next_3_days}-Oct-2024
