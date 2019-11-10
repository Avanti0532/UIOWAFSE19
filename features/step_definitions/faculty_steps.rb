def create_faculty
@faculty ||= {first_name: 'James', last_name: 'Brown', email: 'jamesbrown@uiowa.edu',
              password: 'james1234', password_confirmation: 'james1234'}
end

def create_another_faculty
  @faculty ||= {first_name: 'Mike', last_name: 'Day', email: 'mikeday@uiowa.edu',
                password: 'mike1234', password_confirmation: 'mike1234', weblink: 'http://homepage.cs.uiowa.edu/~mike/'}
end

def saved_faculty_data
  @save_faculty = {email: 'alicen@uiowa.edu', password: '12345689', university_id: 1 }
end

def sign_up_faculty
  visit '/faculties/sign_up'
  fill_data
end

def log_in_faculty
  visit new_faculty_session_path
  fill_in 'Email', with: @save_faculty[:email]
  fill_in 'Password', with: @save_faculty[:password]
  click_button 'Log in'
end

def fill_data
  fill_in 'sign_up_text1', with: @faculty[:first_name]
  fill_in 'sign_up_text2', with: @faculty[:last_name]
  fill_in 'sign_up_text3', with: @faculty[:email]
  fill_in 'sign_up_text4', with: @faculty[:password]
  fill_in 'sign_up_text5', with: @faculty[:password_confirmation]
  click_button 'Sign up'
end

When /^I log in as a faculty/ do
  saved_faculty_data
  log_in_faculty
end
When /^I log_in as a faculty as (.*?)$/ do |name|
  visit new_faculty_session_path
  case name
  when 'Alice'
    fill_in 'Email', with: 'alicen@uiowa.edu'
    fill_in 'Password', with: '12345689'
  when 'Lily'
    fill_in 'Email', with: 'lilys@uiowa.edu '
    fill_in 'Password', with: '23456789'
  end
  click_button 'Log in'
end

When /^I sign up with valid faculties details/ do
  create_faculty
  sign_up_faculty
end

When /^I sign up with blank (.*?) as a faculty$/ do |field|
  create_faculty
  case field
  when 'first name'
    @faculty = @faculty.merge(first_name: '')
  when 'last name'
    @faculty = @faculty.merge(last_name: '')
  when 'password'
    @faculty = @faculty.merge(password: '')
  when 'email'
    @faculty = @faculty.merge(email: '')
  end
  sign_up_faculty
end

When /^I sign up with an email that doesn't end with edu/ do
  create_faculty
  @faculty = @faculty.merge(email: 'jamesbrown@gmail.com')
  sign_up_faculty
end

When /^I sign up without id card and faculty web page link/ do
  create_faculty
  @faculty = @faculty.merge(weblink: '')
  visit '/faculties/sign_up'
  fill_data
end

When /^I sign up with both id card and faculty web page link/ do
  create_faculty
  sign_up_faculty
end

When /^I sign up with id card keeping faculty web page link blank/ do
  create_faculty
  @faculty = @faculty.merge(weblink: '')
  sign_up_faculty
end

When /^I sign up with faculty web page link keeping id card blank/ do
  create_faculty
  visit '/faculties/sign_up'
  fill_data
end

When /^I sign up with invalid password as a (.*?)/ do |field|
  if field == 'faculty'
    create_faculty
    @faculty = @faculty.merge(password: 'james12')
    @faculty = @faculty.merge(password_confirmation: 'james12')
    sign_up_faculty
  else
    create_student
    @student = @student.merge(password: 'lily12')
    @student = @student.merge(password_confirmation: 'lily12')
    sign_up
  end
end

When /^I sign up with duplicate (.*?) as a faculty$/ do |field|
  create_faculty
  Faculty.create(@faculty)
  create_another_faculty
  case field
  when 'email'
    @faculty = @faculty.merge(email: 'jamesbrown@uiowa.edu')
  end
  sign_up_faculty
end


Then /^I should see an email error message/ do
  page.should have_content 'Please provide an university email'
end


Then /^I should see an invalid password message/ do
  page.should have_content 'Password is too short (minimum is 8 characters)'
end

And /^I click on log out as a faculty/ do
  find('a', :text=> 'Hi, alice_may', :visible => false).click
  find('a', :class => 'nav-link', :text=> 'Log Out', :visible => false).click
end

Then(/^I should see a sign out message/) do
  page.should have_content 'Signed out successfully.'
end

And (/^I should see a log in button/) do
  expect(page).to have_link("Login", visible: false)
end