*** Settings ***
Library    Browser
Resource   ../../../resources/GUIs/user_management_page/tasks.resource
Resource   ../../../resources/GUIs/login_page/tasks.resource
Test Setup   Open Website, Login as Admin, Open User Management Page (All Verified)

*** Test Cases ***
Update Existing User
    Click Edit Button    ${employee_username}
    Update User Detail    ${updated_user_role}    ${updated_employee_status}    ${updated_employee_username}
    Click Save Button
    Check User Detail Update

Update Existing User with Password
    Click Edit Button    ${employee_username}
    Update User Detail    ${updated_user_role}    ${updated_employee_status}    ${updated_employee_username}
    Update User Password    ${updated_employee_password}    ${updated_employeeconfirm_password} 
    Click Save Button
    Check User Detail Update
