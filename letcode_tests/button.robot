*** Settings ***
Documentation     Validating different buttons.
Resource          resource.resource
  
*** Test Cases ***
Valid Inputs
  Go To Button Page
  
*** Keywords ***
Go To Button Page
  Go To     ${BUTTON URL}
  Button Page Should Be Open

Button Page Should Be Open
  Title Should Be    Interact with Button fields
