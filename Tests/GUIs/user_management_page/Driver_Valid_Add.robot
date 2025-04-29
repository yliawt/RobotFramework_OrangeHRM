*** Settings ***
Library         Browser
#Library         DataDriver    file=user_data.csv
Resource        ../../../resources/GUIs/user_management_page/tasks.resource
Resource        ../../../resources/GUIs/login_page/tasks.resource
Test Setup      Open Website, Login as Admin, Open User Management Page (All Verified)
Test Template   Add New User To OrangeHRM Keyword

*** Test Cases ***    UserRole    UserStatus    EmployeeName    EmployeeUsername    Password    ConfirmPassword
Valid 1    ${ess_role}    ${enabled_employee_status}    ${employee_name}    ranga1    ${employee_password}    ${employee_confirm_password}
Valid 2    ${ess_role}    ${enabled_employee_status}    ${employee_name}    ranga2    ${employee_password}    ${employee_confirm_password}
Valid 3    ${ess_role}    ${enabled_employee_status}    ${employee_name}    ranga3    ${employee_password}    ${employee_confirm_password}
*** Keywords ***
Add New User To OrangeHRM Keyword
    [Arguments]    ${input_User_Role}    ${input_User_Status}    ${input_Employee_Name}    ${input_Employee_Username}    ${input_Password}    ${input_Confirm_Password}
    Select Add Button
    Fill in All Details    ${input_User_Role}    ${input_User_Status}    ${input_Employee_Name}    ${input_Employee_Username}    ${input_Password}    ${input_Confirm_Password}
    Select Save Button
    Verify User Is Updated    ${input_Employee_Username}
