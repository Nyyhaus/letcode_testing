*** Settings ***
Documentation     Working with different elements.
Resource          resource.resource
Test Setup        Open Browser To Letcode Workspace Page
Test Teardown     Close Browser

*** Test Cases ***
Valid Elements
  Go To Elements Page
  Insert Git Username
  Asserting User Has Profile Image
  Print the user name & other informations

*** Keywords ***
Go To Elements Page
  Go To             https://letcode.in/elements

Insert Git Username
  Input Text    username      ortonikc 
  Click Button    search

Asserting User Has Profile Image
  Wait Until Page Contains      Koushik Chatterjee
  Page Should Contain Element    class:is-rounded
  
Print the user name & other informations
  BuiltIn.Sleep   1
  ${username}    Get Text    css:.is-4 
  ${location}    Get Text    css:.is-6
  Log To Console    \n${username} \n${location}
