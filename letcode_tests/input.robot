*** Settings ***
Documentation     Validating different input fields.
Resource          resource.resource
Metadata          Version      7 
  
*** Test Cases ***
Valid Inputs
  Go To Input Page
  Enter Full Name
  Append Text And Press Keyboard Tab
  Check Text Box Content
  Clear The Text
  Confirm Edit Field Is Disabled
  Confirm Text Is Readonly
  
*** Keywords ***
Go To Input Page
  Go To   ${INPUT URL}
  Input Page Should Be Open

Input Page Should Be Open
  Title Should Be   Interact with Input fields 

Enter Full Name 
  Input Text   fullName   Testi Prove  
  
Append Text And Press Keyboard Tab
  Input Text   join   \ dog   clear=False
  Press Keys    join   TAB

Check Text Box Content
  Element Attribute Value Should Be   getMe   value   ortonikc
  
Clear The Text
  Clear Element Text  clearMe
  
Confirm Edit Field Is Disabled
  Element Should Be Disabled    noEdit
  
Confirm Text Is Readonly
  Element Should Be Disabled   dontwrite

