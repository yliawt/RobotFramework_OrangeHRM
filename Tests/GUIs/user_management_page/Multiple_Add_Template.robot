*** Settings ***
Library    Browser
Resource   ../../../resources/GUIs/user_management_page/tasks.resource
Resource   ../../../resources/GUIs/login_page/tasks.resource
Test Setup   Open Website, Login as Admin, Open User Management Page (All Verified)
Test Template   Add New User to OrangeHRM


*** Test Cases ***
Add New User for All Correct Input
    ${user_role}        ${employee_status}       ${employee_name}        ranga1         ${employee_password}    ${employee_confirm_password}

Add New User with Invalid User Role
    ${EMPTY}        ${employee_status}       ${employee_name}        ranga2         ${employee_password}    ${employee_confirm_password}

Add New User with Invalid User Status
    ${user_role}           ${employee_name}        ${EMPTY}       ranga3         ${employee_password}    ${employee_confirm_password}

Add New User with Invalid Employee Name (No Entry)
    ${user_role}            ${employee_status}            ${EMPTY}         ranga4         ${employee_password}    ${employee_confirm_password}

Add New User with Invalid Employee Name (Non-registered Employee)
    ${user_role}                 ${employee_status}            Abu         ranga5         ${employee_password}    ${employee_confirm_password}

Add New User with Invalid Employee Username (No Entry)
    ${user_role}        ${employee_status}       ${employee_name}        ${EMPTY}       ${employee_password}    ${employee_confirm_password}


*** Keywords ***
Add New User to OrangeHRM
    [Arguments]    ${input_user_role}    ${input_employee_name}    ${input_employee_status}    ${input_employee_username}    ${input_employee_password}    ${input_employee_confirm_password}
    Select Add Button
    Fill in All Details    ${input_user_role}    ${input_employee_name}    ${input_employee_status}    ${input_employee_username}    ${input_employee_password}    ${input_employee_confirm_password}
    Select Save Button
    Verify User Is Updated    ${input_employee_username}


