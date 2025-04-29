add_user_header = "//h6[text()='Add User']"
# Input field locators
user_role_field = 'css=label:has-text("User Role") >> xpath=../following-sibling::div//div[contains(@class,"oxd-select-text-input")]'
employee_name_field = 'css=label:has-text("Employee Name") >> xpath=../following-sibling::div//input'
employee_status_field = 'css=label:has-text("Status") >> xpath=../following-sibling::div//div[contains(@class,"oxd-select-text-input")]'
employee_username_field = 'css=label:has-text("Username") >> xpath=../following-sibling::div//input'
employee_password_field = 'xpath=//label[text()="Password"]/ancestor::div[contains(@class, "oxd-input-group")]//input'
employee_confirm_password_field = 'xpath=//label[text()="Confirm Password"]/ancestor::div[contains(@class, "oxd-input-group")]//input'
change_password_checkbox = 'xpath=//label[.//i[contains(@class,"bi-check")]]'

#buttons
add_user_button = "//button[normalize-space()='Add']"
save_user_button = "//button[@type='submit']"
cancel_button="//button[normalize-space()='Cancel']"
edit_button='xpath=//div[@role="row" and .//div[text()="{emp_uname}"]]//i[contains(@class,"bi-pencil-fill")]/ancestor::button'
delete_button='//div[@role="row" and .//div[text()="{emp_uname}"]]//i[contains(@class,"bi-trash")]/ancestor::button'

delete_popup_modal = '//div[contains(@class,"orangehrm-dialog-popup")]'
delete_popup_header='//p[contains(@class,"oxd-text--card-title")]'
delete_popup_agree="//button[normalize-space(.)='Yes, Delete']"

#Messages
invalid_status = "//div[contains(@class, 'oxd-select-text-input') and normalize-space(text())='-- Select --']"
password_weak_error_mesage= "Should have at least 7 characters"
role_error_message = 'Required'
invalid_role = 'css=.oxd-select-dropdown > div:has-text("-- Select --")'

invalid_employee_name='!@#$$%'
short_employee_username='aaa'
invalid_password='123'
invalid_confirm_passwor='456'
empty_employee_username=''
invalid_ename = 'div[role="listbox"] div[role="option"]:has-text("No Records Found")'

status_error_message='Required'
name_error_message='Invalid'
username_error_message= 'Should be at least 5 characters'
password_mismatch_error_message= 'Passwords do not match'
username_empty_error_message='Required'
mismatch_confirm_password= '3344Qwerty!!'
short_password_error_message= 'Should have at least 7 characters'