*** Settings ***
Library    Browser
Resource   ./actions.resource
Variables  ./page.py
Variables  ../../../configs/testdata.py

*** Keywords ***

####Add New User Keywords#####################################################
Select Add button
    Select Add User Button
    Verify is add user page

Fill in all Details
    [Arguments]    ${input_user_role}    ${input_employee_status}     ${input_employee_name}   ${input_employee_username}    ${input_employee_password}    ${input_employee_confirm_password}
    Select from Selection Dropdown    ${user_role_field}    ${input_user_role}
    Select from Selection Dropdown    ${employee_status_field}    ${input_employee_status}
    Select from Employee DropDown    ${employee_name_field}    ${input_employee_name}  
    Fill in Text Field        ${employee_username_field}    ${input_employee_username}
    Fill in Text Field        ${employee_password_field}    ${input_employee_password}
    Fill in Text Field        ${employee_confirm_password_field}    ${input_employee_confirm_password}

Select Save Button
    Click Save Button

####Add New User Keywords####################################################
Verify Error Message
    [Arguments]    ${error_message}
    Wait For Elements State    ${error_message_field}    visible    timeout=10s
    ${text}=    Get Text       ${error_message_field}
    Should Be Equal            ${text}    ${error_message}



####Edit Existing User Keywords#####################################################

Update User Detail
    Select from Selection Dropdown    ${user_role_field}    ${updated_user_role}
    Select from Selection Dropdown    ${employee_status_field}    ${updated_employee_status}
    Fill in Text Field        ${employee_username_field}    ${updated_employee_username}

Update User Password
    Click    ${change_password_checkbox}
    Fill in Text Field        ${employee_password_field}    ${updated_employee_password}
    Fill in Text Field        ${employee_confirm_password_field}    ${updated_employeeconfirm_password}

Check User Detail Update
    Verify User Is Updated    ${updated_employee_username}


####Delete Existing User Keywords#####################################################
Select Delete Button
    Click Delete Button    ${updated_employee_username}

Confirm Delete User
    Wait For Elements State    ${delete_popup_modal}    visible    timeout=10s
    ${confirmation_text}=    Get Text    ${delete_popup_header}
    Should Be Equal    ${confirmation_text}    Are you Sure?
    Click     ${delete_popup_agree}


Check User Detail Deleted
    Verify User Is Deleted    ${updated_employee_username}