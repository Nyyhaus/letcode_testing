*** Settings ***
Documentation     Play with tables.
Resource          resource.resource
Library           Collections
#Test Setup        Open Browser To Letcode Workspace Page
#Test Teardown     Close Browser

*** Test Cases ***
Test Shopping List
  Go To Table Page
  Get All Prices From Table
  Mark Raj As Present
Test Table Sorting
  Go To Table Page
  Check If Sorting Works Properly

*** Keywords ***
Go To Table Page
  Go To       https://letcode.in/table

Get All Prices From Table
  ${row count}    Get Table Row Count
  ${prices}=      Create List
  FOR   ${index}    IN RANGE    2   ${row count}+2
    ${price}   Get Table Cell    shopping    ${index}   2
    Convert To Integer    ${price}
    Append To List    ${prices}     ${price}
  END
  Sum All Prices From Table   @{prices}

Sum All Prices From Table
  [Arguments]     @{prices}
  ${total}        Set Variable    0
  FOR   ${price}    IN      @{prices}
      ${total}    Evaluate    ${total}+${price}
  END
  Check If The Sum Matches    ${total}

Check If The Sum Matches
  [Arguments]           ${total}
  ${table total}        Get Text              //table[@id="shopping"]/tfoot/td[2]
  ${table total}        Convert To Integer    ${table total}
  Should Be Equal       ${total}              ${table total}

Get Table Row Count
  #${row count}    Execute Javascript
  #...     return document.getElementById("shopping").rows.length;
  ${rows}   Get Element Count     //table[@id="shopping"]/tbody/tr[position()]
  RETURN    ${rows}

Mark Raj As Present
  Select Checkbox       second

Check If Sorting Works Properly
  ${row count}    Execute Javascript
  ...     return document.querySelector(".mat-sort").rows.length;
  ${before sorting}     Create List
  FOR     ${i}    IN RANGE    1   ${row count}+1
      ${value}    Get Text    //table[contains(@class,"mat-sort table")]/tr[${i}]/td[4]
      Append To List    ${before sorting}     ${value}
  END
  Sort List         ${before sorting}

  # Sorting the values in the table and then checking them
  Click Element     //div[text()='Carbs (g)']

  ${after sorting}     Create List
  FOR     ${i}    IN RANGE    1   ${row count}+1
      ${sorted value}    Get Text    //table[contains(@class,"mat-sort table")]/tr[${i}]/td[4]
      Append To List    ${after sorting}     ${sorted value}
  END

  Should Be Equal   ${before sorting}     ${after sorting}
  

