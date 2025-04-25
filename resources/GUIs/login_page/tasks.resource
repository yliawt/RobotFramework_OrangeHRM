*** Settings ***
Library    Browser
Variables    ./page.py
Resource    ./actions.resource

*** Keywords ***

Open Website, Login as Admin, Open User Management Page (All Verified)
    Open Login Page
    Enter Admin Credentials
    Click Login Button
    Verify Admin Login is successful
    Open User Management Page 
    Verify User Management Page is Opened
