def create_admin
  @admin ||= {email: 'linh@gmail.com', password: '12345689'}
end

def create_new_admin
  @new_admin = {email: 'admin@gmail.com', password: '12345689', first_name: 'admin', last_name: 'admin', password_confirmation: '12345689'}
end

def log_in_admin
  visit new_admin_session_path
  fill_in 'log_in_text1', with: @admin[:email]
  fill_in 'log_in_text2', with: @admin[:password]
  click_button 'Log in'
end

Given(/the following (.*?) have been added to (.*?) Database:/) do |user, table_name, user_table|
  case table_name
  when 'Admin'
    user_table.hashes.each do |admin|
      Admin.create(admin)
    end
  when 'Faculty'
    user_table.hashes.each do |faculty|
      Faculty.create(faculty)
    end
  when 'Student'
    user_table.hashes.each do |student|
      Student.create(student)
    end
  when 'Level'
    user_table.hashes.each do |level|
      Level.create(level)
    end
  when 'Course'
    user_table.hashes.each do |course|
      Course.create(course)
    end
  when 'Prerequisite'
    user_table.hashes.each do |prerequisite|
      Prerequisite.create(prerequisite)
    end
  when 'Enrollment'
    user_table.hashes.each do |enrollment|
      Enrollment.create(enrollment)
    end
  end
end


When(/^I log in as an admin/) do
  create_admin
  log_in_admin
end

Then(/^I will see message saying that I logged in to the system/) do
  page.should have_content 'You are logged in'
end

Then(/^I will receive message saying I'm already logged in if I attempt to go to (.*?) or (.*?) login page/) do |user1, user2|
  if user1.eql?("faculty") or user2.eql?("faculty")
    visit new_faculty_session_path
    page.should have_content 'You are logged in'
    page.should_not have_content 'Log in'
  end
  if user1.eql?("student") or user2.eql?("student")
    visit new_student_session_path
    page.should have_content 'You are logged in'
    page.should_not have_content 'Log in'
  end
  if user1.eql?("admin") or user2.eql?("admin")
    visit new_admin_session_path
    page.should have_content 'You are logged in'
    page.should_not have_content 'Log in'
  end
end


Then(/^I will receive message saying I'm already logged in if I attempt to go to (.*?) or (.*?) signup page/) do |user1, user2|
  if user1.eql?("faculty") or user2.eql?("faculty")
    visit new_faculty_registration_path
    page.should have_content 'You are logged in'
    page.should_not have_content 'Log in'
  end
  if user1.eql?("student") or user2.eql?("student")
    visit new_student_registration_path
    page.should have_content 'You are logged in'
    page.should_not have_content 'Log in'
  end
  if user1.eql?("admin") or user2.eql?("admin")
    visit new_admin_registration_path
    page.should have_content 'You are logged in'
    page.should_not have_content 'Log in'
  end
end


Then(/^I can see all (.*?) in the database$/) do |field|
  visit '/admin/dashboard'
  if field == "faculties"
    find('tr', text: 'Faculties').click_link 'Faculties'
    Faculty.all.each do |faculty|
      page.should have_content faculty.email
    end
  elsif field == "students"
    find('tr', text: 'Students').click_link 'Students'
    Student.all.each do |student|
      page.should have_content student.email
    end
  elsif field == "admins"
    find('tr', text: 'Admins').click_link 'Admins'
    Admin.all.each do |admin|
      page.should have_content admin.email
    end
  end
end

Then(/^I cannot edit any student or faculty information$/) do
  visit '/admin/dashboard'
  find('tr', text: 'Faculties').click_link 'Faculties'
  expect(page).to have_no_link('Edit')
  visit '/admin/dashboard'
  find('tr', text: 'Students').click_link 'Students'
  expect(page).to have_no_link('Edit')
end

Then(/^I cannot add new faculty or student$/) do
  visit '/admin/dashboard'
  find('tr', text: 'Faculties').click_link 'Faculties'
  expect(page).to have_no_link('Add new')
  visit '/admin/dashboard'
  find('tr', text: 'Students').click_link 'Students'
  expect(page).to have_no_link('Add new')
end

Then(/^I should be directed to the admin site$/) do
  find('a', text: 'Admin Dashboard', visible: false).click
  expect(current_path).to eq rails_admin_path
end

Then(/^I can create account for another admin$/) do
  admin_count = Admin.count
  visit '/admin/dashboard'
  find('tr', text: 'Admins').click_link 'Admins'
  expect(page).to have_link('Add new')
  click_link 'Add new'
  create_new_admin
  fill_in 'Email', with: @new_admin[:email]
  fill_in 'Password', with: @new_admin[:password]
  fill_in 'Password confirmation', with: @new_admin[:password]
  fill_in 'First name', with: @new_admin[:first_name]
  fill_in 'Last name', with: @new_admin[:last_name]
  click_button 'Save'
  expect(Admin.count).to eq(admin_count + 1)
end

Then(/^I cannot export (.*?) information$/) do |field|
  visit '/admin/dashboard'
  if field.eql?('student')
    find('tr', text: 'Students').click_link 'Students'
    expect(page).to have_no_link('Export')
  elsif field.eql?('faculty')
    find('tr', text: 'Faculties').click_link 'Faculties'
    expect(page).to have_no_link('Export')
  end
end


Then(/^I will go to homepage of Online Tutorial if I click on Home button on the navigation bar$/) do
  visit '/admin/dashboard'
  click_link 'Home'
  expect(current_path).to eq(root_path)
end

And(/^I got redirected to homepage$/) do
  expect(current_path).to eq(root_path)
end

And(/^I click on log out as an admin$/) do
  click_link 'Log out'
end

