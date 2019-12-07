def create_student
  @student ||= {first_name: 'Lily', last_name: 'Brown', email: 'lilybrown@gmail.com',
                password: 'lily1234', password_confirmation: 'lily1234'}
end

def create_another_student
  @student ||= {first_name: 'Mike', last_name: 'Gordan', email: 'mike@gmail.com',
                password: 'mike1234', password_confirmation: 'mike1234'}
end

def saved_student_data
  @saved_student_data = {email: 'robin@gmail.com', password: '12345678'}
end

def log_in_student
  visit new_student_session_path
  fill_in 'log_in_text1', with: @saved_student_data[:email]
  fill_in 'log_in_text2', with: @saved_student_data[:password]
  click_button 'Log in'
end


def sign_up
  visit '/students/sign_up'
  fill_in 'sign_up_text1', with: @student[:first_name]
  fill_in 'sign_up_text2', with: @student[:last_name]
  fill_in 'sign_up_text3', with: @student[:email]
  fill_in 'sign_up_text4', with: @student[:password]
  fill_in 'sign_up_text5', with: @student[:password_confirmation]
  click_button 'Sign up'
end

Given /^I am on homepage of Online Tutorial/ do
  visit root_path
end

When /^I sign up with valid student details/ do
  create_student
  sign_up
end

Then /^I should get a message saying confirmation email has been sent/ do
  page.should have_content 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'
end

When /^I sign up with blank (.*?) as a student$/ do |field|
  create_student
  case field
  when 'first name'
    @student = @student.merge(first_name: '')
  when 'last name'
    @student = @student.merge(last_name: '')
  when 'password'
    @student = @student.merge(password: '')
  when 'email'
    @student = @student.merge(email: '')
  end
  sign_up
end

When /^I sign up with duplicate (.*?) as a student$/ do |field|
  create_student
  Student.create(@student)
  create_another_student
  case field
  when 'email'
    @student = @student.merge(email: 'lilybrown@gmail.com')
  end

  sign_up
end

Then /^I should see a blank (.*?) error message$/ do |field|
  case field

  when 'first name'
    page.should have_content "First name can't be blank"
  when 'last name'
    page.should have_content "Last name can't be blank"
  when 'email'
    page.should have_content "Email can't be blank"
  when 'password'
    page.should have_content "Password can't be blank"
  end
end

Then /^I should see a duplicate (.*?) message$/ do |field|
  case field
  when 'email'
    page.should have_content "Email has already been taken"
  end
end

When /^I log in as a student/ do
  saved_student_data
  log_in_student
end

When /^I login as a student moderator/ do
  moderator
  log_in_moderator
end
Then /^I should see a successful login message/ do
  page.should have_content "You are logged in"
end

When /^I log in with wrong (.*?) email/ do |field|
  case field
  when 'student'
    saved_student_data
    @saved_student_data = @saved_student_data.merge(email: 'robindeb@gmail.com')
    log_in_student
  when 'faculty'
    saved_faculty_data
    @save_faculty = @save_faculty.merge(email: 'alice@uiowa.edu')
    log_in_faculty
  when 'admin'
    create_admin
    @admin = @admin.merge(email: 'linh123@gmail.com')
    log_in_admin
  end
end

Then /^I should see an invalid login message/ do
  page.should have_content "Invalid Email or password"
end

When /^I log in with wrong (.*?) password/ do |field|
  case field
  when 'student'
    saved_student_data
    @saved_student_data = @saved_student_data.merge(password: 'robin123450')
    log_in_student
  when 'faculty'
    saved_faculty_data
    @save_faculty = @save_faculty.merge(password: 'alice98705')
    log_in_faculty
  when 'admin'
    create_admin
    @admin = @admin.merge(password: 'linh563782')
    log_in_admin
  end
end

And /^I click on log out as a student/ do
  page.find_link("Log Out", visible: false).click
end

Then /^I should get a successful message/ do
  page.should have_content "Welcome! You have signed up successfully."
end
