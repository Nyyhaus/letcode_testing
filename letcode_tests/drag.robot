*** Settings ***
Documentation     Drag element.
Resource          resource.resource
Test Setup        Open Browser To Letcode Workspace Page
Test Teardown     Close Browser

*** Test Cases ***
Test Dragging
  Go To Draggable Page
  Drag The Box Around
  Go To Drop Page
  Drag The Box To Target
  Go To Sort Page
  From To Do To Done
  Go To Selectable Page
  Select All

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
  Go To       https://letcode.in/selectable
  
Select All
  FOR    ${i}     IN RANGE    0     9
    Click Element   selectable    CTRL
  END
  Sleep    1

