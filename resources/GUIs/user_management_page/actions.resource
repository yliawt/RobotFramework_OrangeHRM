*** Settings ***
Library    Browser
Variables  ./page.py

*** Keywords ***
Select Add User Button
    Click    ${add_user_button}
    Sleep    2s

Verify is add user page
   Wait For Elements State    ${add_user_header}    visible    timeout=10s
    ${text}=    Get Text       ${add_user_header}
    Should Be Equal            ${text}    Add User

Select from Selection Dropdown
    [Arguments]    ${field}    ${content}  
    Click    ${field}
    Click    ${content}

Select form Employee DropDown
    [Arguments]    ${field}    ${content}  
    Type Text    ${field}    ${content}  
    Click        text=${content}    

Fill in Text Field
    [Arguments]    ${field}    ${content} 
    Type Text    ${field}    ${content} 

Click Save Button
    Click   ${save_user_button}
    Sleep    2s

####Edit Existing User Keywords#####################################################
Click Edit Button
    [Arguments]    ${emp_username}
    ${edit_button_locator}=    Set Variable    ${edit_button.format(emp_uname='${emp_username}')}
    Scroll To Element    ${edit_button.format(emp_uname='${emp_username}')}
    Wait For Elements State    ${edit_button_locator}    state=visible    timeout=10s
    Click    ${edit_button_locator}

Verify User Is Updated
    [Arguments]    ${emp_username}
    Wait For Elements State    text=${emp_username}    state=visible    timeout=10s

####Delete Existing User Keywords#####################################################
Click Delete Button
    [Arguments]    ${updated_employee_username}
    ${delete_button_locator}=    Set Variable    ${delete_button.format(emp_uname='${updated_employee_username}')}
    Scroll To Element    ${delete_button.format(emp_uname='${updated_employee_username}')}
    Wait For Elements State    ${delete_button_locator}    state=visible    timeout=10s
    Click    ${delete_button_locator}

Verify User Is Deleted
    [Arguments]    ${emp_username}
    Wait For Elements State    text=${emp_username}    state=detached    timeout=10s

