*** Settings ***
Documentation       Test calendar functions.

Resource            resource.resource
Library             DateTime

Test Setup          Open Browser To Letcode Workspace Page
Test Teardown       Close Browser


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
    Select Time After 2 Hours
    Verify Time Range


*** Keywords ***
Go To Calendar Page
    Go To    https://letcode.in/calendar

Select Today Date
    Click Button    
    ...   //div[@class='datetimepicker is-danger is-active']//div[@class='datetimepicker-footer']//button[@type='button'][contains(text(),'Today')]

Select Week Later Date
    ${week_later}   Get Current date    increment=7 days   result_format=%d
    Click Button    
    ...   //div[@class='datepicker']//div[@class='datepicker-body']//div[@class='datepicker-dates is-active']//div[@class='datepicker-days']//div[@class='datepicker-date is-current-month']//button[@type='button'][contains(text(),'${week_later}')]

Select Month Later Date
    ${next_month}    Get Current Date    increment=30 days    result_format=%b
    Click Element    
    ...   //div[@class='datetimepicker is-danger is-active']//div[@class='datetimepicker-container']//div[@class='datepicker']//div[@class='datepicker-nav']//div[@class='datepicker-nav-month-year']//div[@class='datepicker-nav-month']
    Click Element    
    ...   //div[@class='datepicker-months is-active']//div[@class='datepicker-month'][contains(text(),'${next_month}')]

Select Previous 20 Days As Start Date
    ${prev_20_day}    Get Current Date    increment=-20 days    result_format=%d
    ${prev_20_month}    Get Current Date    increment=-20 days    result_format=%b
    ${this_month}    Get Current Date    result_format=%b

    ${prev_20_day}     Convert To Integer    ${prev_20_day}
    
    Click Element    css:.is-datetimepicker-range
    IF    $prev_20_month==$this_month 
        Click Element
    ...    //div[@class='datepicker is-active']//div[@class='datepicker-body']//div[@class='datepicker-dates is-active']//div[@class='datepicker-days']//div[@class='datepicker-date is-current-month']//button[@type='button'][text()='${prev_20_day}']
    ELSE 
        Click Element
        ...    //div[@class='datepicker is-active']//div[@class='datepicker-nav']//div[@class='datepicker-nav-month-year']//div[@class='datepicker-nav-month']
        Click Element
        ...    //div[@class='datepicker-months is-active']//div[@class='datepicker-month'][contains(text(),'${prev_20_month}')]
        Click Element
        ...    //div[@class='datepicker is-active']//div[@class='datepicker-body']//div[@class='datepicker-dates is-active']//div[@class='datepicker-days']//div[@class='datepicker-date is-current-month']//button[@type='button'][contains(text(),'${prev_20_day}')]

    END
    Sleep    2

Select Next 10 Days As End Date
    ${next_10_day}    Get Current Date    increment=10 days    result_format=%d
    ${next_10_month}    Get Current Date    increment=10 days    result_format=%b
    ${this_month}    Get Current Date    result_format=%b
    IF    $next_10_month==$this_month 
        Click Element
    ...    //div[@class='datepicker is-active']//div[@class='datepicker-body']//div[@class='datepicker-dates is-active']//div[@class='datepicker-days']//div[@class='datepicker-date is-current-month']//button[@type='button'][contains(text(),'${next_10_day}')]
    ELSE 
        Click Element
        ...    //div[@class='datepicker-months is-active']//div[@class='datepicker-month'][contains(text(),'${next_10_month}')]
        Click Element
        ...    //div[@class='datepicker is-active']//div[@class='datepicker-body']//div[@class='datepicker-dates is-active']//div[@class='datepicker-days']//div[@class='datepicker-date is-current-month']//button[@type='button'][contains(text(),'${next_10_day}')]

    END   

Select Start Date As Today
    Click Element    css:.is-datetimepicker-range
    Click Element
    ...    //div[@class='datetimepicker is-primary is-datetimepicker-default is-active']//div[@class='datetimepicker-footer']//button[@type='button'][contains(text(),'Today')]

Select End Date After 3 Days
    ${next_3_days}    Get Current Date    increment=3 days    result_format=%d
    Click Element
    ...    //div[@class='datepicker is-active']//div[@class='datepicker-body']//div[@class='datepicker-dates is-active']//div[@class='datepicker-days']//div[@class='datepicker-date is-current-month']//button[@type='button'][contains(text(),'${next_3_days}')]

Select Time After 2 Hours
    Click Element    //div[@class='timepicker-hours']//span[@class='timepicker-next'][contains(text(),'+')]
    Click Element    //div[@class='timepicker-hours']//span[@class='timepicker-next'][contains(text(),'+')]

Verify Time Range
    ${today date}         Get Current Date      result_format=%d-%b-%Y 
    ${next_3_days}        Get Current Date    increment=3 days    result_format=%d-%b-%Y
    Page Should Contain    You have selected from ${today date} to ${next_3_days}
