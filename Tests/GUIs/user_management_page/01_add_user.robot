*** Settings ***
Library    Browser
Resource   ../../../resources/GUIs/user_management_page/tasks.resource
Resource   ../../../resources/GUIs/login_page/tasks.resource
Test Setup   Open Website, Login as Admin, Open User Management Page (All Verified)

*** Test Cases ***
Add New User to OrangeHRM
    Select Add Button
    Fill in All Details    ${ess_role}    ${enabled_employee_status}    ${employee_name}    ${employee_username}    ${employee_password}   ${employee_confirm_password}
    Select Save Button
    Verify User Is Updated    ${employee_username}


