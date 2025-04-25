*** Settings ***
Library    Browser
Variables    ./page.py
Variables    ../../../configs/urls.py

*** Keywords ***

Open Login Page
    Open Browser    ${loginpage_url}    

Enter Admin Credentials 
    Fill Text     ${login_username_field}    ${login_username}
    Fill Text    ${login_password_field}    ${login_password}
    
Click Login Button
    Click    ${login_button}
    
Verify Admin Login is successful
    Wait For Elements State         css=h6.oxd-topbar-header-breadcrumb-module    visible    timeout=10s
    ${text}=    Get Text            css=h6.oxd-topbar-header-breadcrumb-module
    Should Be Equal                 ${text}    Dashboard


Open User Management Page
    Click   ${admin_tab}
    Click   ${user_tab}
    Click   ${user_management_tab}

Verify User Management Page is Opened
    Wait For Elements State    xpath=//h5[text()='System Users']    visible    timeout=10s
    ${text}=    Get Text       xpath=//h5[text()='System Users']
    Should Be Equal    ${text}    System Users
