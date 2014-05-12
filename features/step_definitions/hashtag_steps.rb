Given /^a user visits the signin page$/ do
  visit signin_path
end
Given /^the user has an account$/ do
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
end

When /^the user submits valid signin information$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

When /^they visit home page again/ do
	visit root_url
end
When /^submit a micropost with hashtag/ do
	fill_in 'micropost_content', with: "#kings dummy"
	click_button "Post"
end

When /^click on hashtag/ do
	visit 'hashtags/kings'
end
Then /^they see Popular tags$/ do
  expect(page).to have_content('Popular Tags')
end 
Then /^they see posted hashtag/ do
	expect(page).to have_selector('li', text: 'kings')
end


Then /^have heading of tags/ do
	expect(page).to have_content('kings')
end