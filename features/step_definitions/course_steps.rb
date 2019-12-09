And(/^I search courses with (.*?)$/) do |search_field|
  page.execute_script("$('#coursesTable').DataTable({});")
  page.should have_content('Search:')
  page.fill_in "Search:", with: search_field
end

Then(/^I should see only search result with (.*?)$/) do |search_field|
  Course.all.each do |course|
    if !course.course_name.eql?(search_field)
      page.should_not have_content(course.course_name)
    end
  end
  page.should have_content(search_field)
end

And(/^I click on view link of (.*?)$/) do |course|
  find(:xpath, "//tr[contains(.,\"#{course}\")]/td/a", :text => 'view').click
end

Then(/^I should be able to see (.*?) information$/) do |course|
  expect(page).to have_current_path(/courses\/[0-9]+/)
  expect(page).to have_content(course)
end

And(/^I click on register$/) do
  click_link 'Register'

end

Then(/^I should be successfully registered$/) do
  expect(page).to have_content('You are successfully registered in this course')
end

Then(/^I should receive error message$/) do
  expect(page).to have_content('Please complete prerequisite course before registration')
end

Then(/^I should see the course in registered course section$/) do
  click_on 'Online Tutorial'
  click_on 'Registered Courses'
  expect(page).to have_content('Database Systems')
end