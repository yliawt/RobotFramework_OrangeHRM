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