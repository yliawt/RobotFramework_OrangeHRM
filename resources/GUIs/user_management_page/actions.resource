*** Settings ***
Library    Browser
Variables  ./page.py

*** Keywords ***
Select Add User Button
    Click    ${add_user_button}
    Sleep    2s

Verify is add user page
   Wait For Elements State    xpath=//h6[text()='Add User']    visible    timeout=10s
    ${text}=    Get Text       xpath=//h6[text()='Add User']
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
Search Corresponding Edit Button
    [Arguments]    ${emp_username}
    ${row}=    Get Element    xpath=//div[@role="row" and .//div[text()="${emp_username}"]]
    Scroll To Element    ${row}
    ${edit_button}=    Get Element    xpath=//div[@role="row" and .//div[text()="${emp_username}"]]//i[contains(@class,"bi-pencil-fill")]/ancestor::button
    Click    ${edit_button}
    Sleep    2s
    Log To Console    Edit User Page is Opened

Verify User Is Updated
    [Arguments]    ${emp_username}
    Wait For Elements State    text=${emp_username}    state=visible    timeout=10s
    Log To Console    User '${emp_username}' is listed on the page

####Delete Existing User Keywords#####################################################
Click Delete Button
    [Arguments]    ${updated_employee_username}
    ${delete_button_locator}=    Set Variable    xpath=//div[@role="row" and .//div[text()="${updated_employee_username}"]]//i[contains(@class,"bi-trash")]/ancestor::button
    Scroll To Element    xpath=//div[@role="row" and .//div[text()="${updated_employee_username}"]]
    Wait For Elements State    ${delete_button_locator}    state=visible    timeout=10s
    Click    ${delete_button_locator}


Verify User Is Deleted
    [Arguments]    ${emp_username}
    Wait For Elements State    text=${emp_username}    state=detached    timeout=10s
    Log To Console    User '${emp_username}' has been deleted and is no longer on the page