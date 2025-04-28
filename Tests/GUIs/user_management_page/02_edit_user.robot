*** Settings ***
Library    Browser
Resource   ../../../resources/GUIs/user_management_page/tasks.resource
Resource   ../../../resources/GUIs/login_page/tasks.resource
Test Setup   Open Website, Login as Admin, Open User Management Page (All Verified)

*** Test Cases ***
Update Existing User
    Click Edit Button    ${employee_username}
    Update User Detail
    Click Save Button
    Check User Detail Update
