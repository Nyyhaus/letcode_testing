*** Settings ***
Documentation     Play with tables.
Resource          resource.resource
Library           Collections
#Test Setup        Open Browser To Letcode Workspace Page
#Test Teardown     Close Browser

*** Test Cases ***
Test Shopping And Presence Tables
  Go To Table Page
  Get All Prices From Table
  Mark Raj As Present
Test Table Sorting
  Go To Table Page
  Create List Of Carbs Before Sorting

*** Keywords ***
Go To Table Page
  Go To       https://letcode.in/table

Get All Prices From Table
  ${row count}    Get Table Row Count     shopping
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
  [Arguments]     ${table_id}
  ${rows}   Get Element Count     //table[@id="${table_id}"]/tbody/tr[position()]
  RETURN    ${rows}

Mark Raj As Present
  ${rows}       Get Table Row Count     simpletable

  FOR   ${i}    IN RANGE    1   ${rows}+1 
      ${name}     Get Text    //table[@id="simpletable"]/tbody/tr[${i}]/td[2]
      IF    $name == "Raj"
          Select Checkbox       second
      END
  END

Create List Of Carbs Before Sorting
  ${row count}    Execute Javascript
  ...     return document.querySelector(".mat-sort").rows.length;
  ${before sorting}     Create List
  FOR     ${i}    IN RANGE    1   ${row count}+1
      ${value}    Get Text    //table[contains(@class,"mat-sort table")]/tr[${i}]/td[4]
      Append To List    ${before sorting}     ${value}
  END
  Sort List         ${before sorting}
  Compare Carbs After Sorting     ${before sorting}     ${row count}

Compare Carbs After Sorting   
  [Arguments]       ${before sorting}     ${row count}
  Click Element     //div[text()='Carbs (g)']

  ${after sorting}     Create List
  FOR     ${i}    IN RANGE    1   ${row count}+1
      ${sorted value}    Get Text    //table[contains(@class,"mat-sort table")]/tr[${i}]/td[4]
      Append To List    ${after sorting}     ${sorted value}
  END

  Should Be Equal   ${before sorting}     ${after sorting}
  

