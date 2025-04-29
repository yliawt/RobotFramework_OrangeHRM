*** Settings ***
Library    Browser
Resource   ../../../resources/GUIs/user_management_page/tasks.resource
Resource   ../../../resources/GUIs/login_page/tasks.resource
Test Setup   Open Website, Login as Admin, Open User Management Page (All Verified)
Test Template   Add InvalidNew User to OrangeHRM

*** Test Cases ***
Empty User Role When Add New User    ${invalid_role}    ${enabled_employee_status}     ${employee_name}   aranga12    ${employee_password}    ${employee_confirm_password}   ${role_error_message}
Empty User Status When Add New User    ${ess_role}    ${invalid_status}    ${employee_name}    aranga13    ${employee_password}    ${employee_confirm_password}    ${status_error_message}
Non-registered Employee Name When Add New User    ${ess_role}    ${enabled_employee_status}    ${invalid_employee_name}    aranga14    ${employee_password}    ${employee_confirm_password}    ${name_error_message}
Short Username When Add New User    ${ess_role}    ${enabled_employee_status}    ${employee_name}    ${short_employee_username}    ${employee_password}    ${employee_confirm_password}   ${username_error_message}
Empty Username When Add New User    ${ess_role}    ${enabled_employee_status}    ${employee_name}    ${empty_input}    ${employee_password}    ${employee_confirm_password}   ${empty_error_message}    
Password is less than 7 characters    ${ess_role}    ${enabled_employee_status}    ${employee_name}    aranga15    ${invalid_password}    ${invalid_password}    ${short_password_error_message}
Only Integer Input in Password    ${ess_role}    ${enabled_employee_status}    ${employee_name}    aranga16    ${integer_only_password}    ${integer_only_password}    ${alphabet_password_error_message}
Only Aphabet Input in Password    ${ess_role}    ${enabled_employee_status}    ${employee_name}    aranga17    ${alphabet_only_password}    ${alphabet_only_password}    ${integer_password_error_message}
Confirm Password is different with Password   ${ess_role}    ${enabled_employee_status}    ${employee_name}    aranga15    ${employee_password}    ${mismatch_confirm_password}    ${password_mismatch_error_message}

*** Keywords ***
Add InvalidNew User to OrangeHRM
    [Arguments]    ${input_user_role}    ${input_employee_name}    ${input_employee_status}    ${input_employee_username}    ${input_employee_password}    ${input_employee_confirm_password}    ${error_msg}
    Select Add Button
    Fill in All Details    ${invalid_role}    ${enabled_employee_status}     ${employee_name}   aranga12    ${employee_password}    ${employee_confirm_password}
    Select Save Button
    Verify Error Message    ${error_msg}