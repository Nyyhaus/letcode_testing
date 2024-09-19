*** Settings ***
Documentation     Play with tables.
Resource          resource.resource
Test Setup        Open Browser To Letcode Workspace Page
Test Teardown     Close Browser

*** Test Cases ***
Test Dragging
  Go To Table Page

*** Keywords ***
Go To Table Page
  Go To       
