*** Settings ***
Documentation     Working with different browser windows.
Resource          resource.resource

*** Test Cases ***
Valid windows
  Go To Windows Page
  Click Home Button
  Print the title of the page 
  Close the parent window
  Close the child window
  Click on the Multiple windows button
  Print all the window titles
  Close all the windows

*** Keywords ***
Go To Windows Page
  Go To             https://letcode.in/windows

Click Home Button
  Click Button      home
  
Goto the newly opened tab
  Switch Window

Print the title of the page 
  @{window titles}    Get Window Titles
  Log To Console      \n${window titles}[1]

Close the parent window
  @{window titles}    Get Window Titles
  Switch Window       ${window titles}[0]
  ${current url}      Get Location        
  Log To Console      ${current url}
  Close Window

Close the child window
  Switch Window
  ${current url}      Get Location        
  Log To Console      ${current url}
  Close Window
  
Click on the Multiple windows button
  Open Browser To Letcode Workspace Page
  Go To Windows Page
  Click Button    multi
  
Print all the window titles
  @{window titles}    Get Window Titles
  FOR   ${window}   IN    @{window titles}
      Log To Console    ${window}
  END

Close all the windows
  Close Browser
