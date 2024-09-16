*** Settings ***
Documentation     Validating radio buttons and checkboxes.
Resource          resource.resource
Test Setup        Open Browser To Letcode Workspace Page
Test Teardown     Close Browser

*** Test Cases ***
Valid Checkboxes And Radios
  Go To Radio Page
  Select Any Radio Button
  Confirm you can select only one radio button
  Find the bug
  Find which one is selected
  Find if the checkbox is selected?

*** Keywords ***
Go To Radio Page
  Go To             https://letcode.in/radio

Select Any Radio Button
  Click Button      yes

Confirm you can select only one radio button
  Select Radio Button   one   one
  Radio Button Should Be Set To   one   on
  ${checked}  Execute Javascript  return document.getElementById('two').checked;
  Log To Console    \n${checked}
  Sleep   1
  Select Radio Button   one   two
  ${checked}  Execute Javascript  return document.getElementById('one').checked;
  Log To Console    ${checked}

Find the bug
  Radio Button Should Not Be Selected   bug   
  Radio Button Should Not Be Selected     nobug   
  Select Radio Button   nobug   nobug 
  Select Radio Button   bug    bug 
  Radio Button Should Be Set To   bug   on
  Radio Button Should Be Set To   nobug   on
  ${checked}  Execute Javascript  return document.getElementById('bug').checked;
  Log To Console    \n${checked}
  Sleep   1
  ${checked}  Execute Javascript  return document.getElementById('nobug').checked;
  Log To Console    \n${checked}

Find which one is selected
  ${checked}  Execute Javascript  return document.getElementById('foo').checked;
  Log To Console    \n${checked}
  Sleep   1
  ${checked}  Execute Javascript  return document.getElementById('notfoo').checked;
  Log To Console    \n${checked}

Find if the checkbox is selected?

