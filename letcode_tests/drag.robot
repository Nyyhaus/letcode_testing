*** Settings ***
Documentation     Drag element.
Resource          resource.resource

*** Test Cases ***
Test Dragging
  Go To Draggable Page
  Drag The Box Around
Test Dropping
  Go To Drop Page
  Drag The Box To Target
Test Sorting
  Go To Sort Page
  From To Do To Done
Test Multiselect
  Go To Selectable Page
  Select All
Test Slider
  Go To Slider Page
  Move Slider
  Get Countries
  Count Countries
  
*** Keywords ***
Go To Draggable Page
  Go To             https://letcode.in/draggable
  
Drag The Box Around
  ${area size}      Get Element Size    class:example-boundary
  ${box size}       Get Element Size    sample-box
  Log To Console    Area size: ${area size} box size: ${box size}
  Drag And Drop By Offset     sample-box    200   200

Go To Drop Page
  Go To     https://letcode.in/dropable

Drag The Box To Target
  Drag And Drop   draggable     droppable

Go To Sort Page
  Go To     https://letcode.in/sortable

From To Do To Done
  FOR   ${i}  IN RANGE    0   4
    Drag And Drop   //*[@id="cdk-drop-list-0"]    //*[@id="cdk-drop-list-1"]  
    Evaluate    ${i}+1
  END

Go To Selectable Page
  Go To           https://letcode.in/selectable
  
Select All
  Click Element   xpath://h3[text()="Selenium"]         CTRL
  Click Element   xpath://h3[text()="Protractor"]       CTRL
  Click Element   xpath://h3[text()="Appium"]           CTRL
  Click Element   xpath://h3[text()="TestNg"]           CTRL
  Click Element   xpath://h3[text()="Postman"]          CTRL
  Click Element   xpath://h3[text()="Cypress"]          CTRL
  Click Element   xpath://h3[text()="Webdriver.io"]     CTRL
  Click Element   xpath://h3[text()="Testproject.io"]   CTRL
  Click Element   xpath://h3[text()="LetCode"]          CTRL

Go To Slider Page
  Go To           https://letcode.in/slider

Move Slider
  Drag And Drop By Offset     generate    50    0 

Get Countries
  Click Button     xpath://button[text()="Get Countries"]
  Sleep    2

Count Countries
  ${word limit}   Execute Javascript
  ...  let text = document.querySelector('h1.subtitle').textContent;
  ...  let num = text.replace(/[^0-9]/g, "");
  ...  return num;
  Log To Console    \n${word limit}   
  Assert Country Count   ${word limit}

Assert Country Count
  [Arguments]     ${word limit}
  ${words}   Execute Javascript
  ...   return document.querySelector('.has-text-primary-light')
  ...   .textContent.match(/-/g);
  ${words len}    Get Length     ${words}
  Log To Console    ${words len}
  ${words len}    Evaluate       ${words len}+1
  Should Be Equal As Integers    ${word limit}   ${words len}

