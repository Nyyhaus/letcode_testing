*** Settings ***
Documentation     Play with tables.
Resource          resource.resource
Test Setup        Open Browser To Letcode Workspace Page
Test Teardown     Close Browser
Library           Collections

*** Test Cases ***
Test Tables
  Go To Table Page
  Get All Prices From Table

*** Keywords ***
Go To Table Page
  Go To       https://letcode.in/table

Get All Prices From Table
  ${row count}    Get Table Row Count
  @{prices}=      Set Variable       0       0
  FOR   ${index}    IN RANGE    2   ${row count}+1
    ${price}   Get Table Cell    shopping    ${index}   2
    Convert To Integer    ${price}
    Append To List    ${prices}     ${price}
  END
  Sum All Prices From Table   @{prices}

Sum All Prices From Table
  [Arguments]     @{prices}
  ${total}    Set Variable    0
  FOR   ${price}    IN      @{prices}
      ${total}    Evaluate    ${total}+${price}
  END
  Check If The Sum Matches    ${total}

Check If The Sum Matches
  [Arguments]     ${total}
  ${row count}    Get Table Row Count
  ${row count}    Evaluate      ${row count}+1

  ${table total}    Get Table Cell    shopping   ${row count}    2
  Should Be Equal   ${total}    ${table total}

Get Table Row Count
  ${row count}    Execute Javascript
  ...     return document.getElementById("shopping").rows.length;
  RETURN    ${row count}
