*** Settings ***
Library    Browser
Resource   ../../../resources/GUIs/user_management_page/tasks.resource
Resource   ../../../resources/GUIs/login_page/tasks.resource
Test Setup   Open Website, Login as Admin, Open User Management Page (All Verified)

*** Test Cases ***
Add New User to OrangeHRM (Positive Test)
    Select Add Button
    Fill in All Details    ${ess_role}    ${enabled_employee_status}    ${employee_name}    aranga1    ${employee_password}    ${employee_confirm_password}
    Select Save Button
    Verify User Is Updated    ${employee_username}

Invalid User Role Should Show Error
    Select Add Button
    Leave User Role As Unselected   
    Fill in All Details    ${invalid_role}    ${enabled_employee_status}     ${employee_name}   aranga12    ${employee_password}    ${employee_confirm_password}
    Select Save Button
    Verify Error Message    ${role_error_message}

Invalid User Status Should Show Error
    Select Add Button
    Leave User Role As Unselected
    Sleep    1s  
    Fill in All Details    ${ess_role}    ${invalid_status}    ${employee_name}    aranga13    ${employee_password}    ${employee_confirm_password}
    Select Save Button
    Verify Error Message    ${status_error_message}

Invalid Employee Name Should Show Error
    Select Add Button
    Fill in All Details    ${ess_role}    ${enabled_employee_status}    ${invalid_employee_name}    aranga14    ${employee_password}    ${employee_confirm_password}
    Select Save Button
    Verify Error Message    ${name_error_message}

Invalid Username Should Show Error
    Select Add Button
    Fill in All Details    ${ess_role}    ${enabled_employee_status}    ${employee_name}    ${short_employee_username}    ${employee_password}    ${employee_confirm_password}
    Select Save Button
    Verify Error Message    ${username_error_message}
#need to sleep

Password is less than 7 characters
    Select Add Button
    Fill in All Details    ${ess_role}    ${enabled_employee_status}    ${employee_name}    aranga15    ${invalid_password}    ${invalid_password}
    Select Save Button
    Verify Error Message    ${short_password_error_message}
# pw= less 7 char; c_pw = pw not match

Confirm Password is different with Password
    Select Add Button
    Fill in All Details    ${ess_role}    ${enabled_employee_status}    ${employee_name}    aranga15    ${employee_password}    ${mismatch_confirm_password}
    Select Save Button
    Verify Error Message    ${password_mismatch_error_message}

*** Keywords ***
Leave User Role As Unselected
    Sleep    1s  # Adding a small sleep for stability if needed
