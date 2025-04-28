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
    Select from Selection Dropdown    ${user_role_field}    ${user_role}
    Select form Employee DropDown    ${employee_name_field}    ${employee_name}
    Select from Selection Dropdown    ${employee_status_field}    ${employee_status}
    Fill in Text Field        ${employee_username_field}    ${employee_username}
    Fill in Text Field        ${employee_password_field}    ${employee_password}
    Fill in Text Field        ${employee_confirm_password_field}    ${employeeconfirm_password}

Select Save Button
    Click Save Button
####Edit Existing User Keywords#####################################################


Update User Detail
    Select from Selection Dropdown    ${user_role_field}    ${updated_user_role}
    Select from Selection Dropdown    ${employee_status_field}    ${updated_employee_status}
    Fill in Text Field        ${employee_username_field}    ${updated_employee_username}

Click Table Row Checkbox
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