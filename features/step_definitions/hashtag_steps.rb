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

When /^the user visits home page again$/ do
	visit root_url
end
When /^the user submits a micropost with sample hashtag$/ do
	fill_in 'micropost_content', with: "#kings dummy"
	click_button "Post"
end

When /^the user submits multiple microposts with hashtag$/ do
  20.times.each do |num|
    steps %{
      When submit a micropost with hashtag "#king-#{num} dummy"
    }
  end
end

When /^the user submits multiple microposts with repeated hashtag$/ do
  50.times.each do |num|
    steps %{
      When submit a micropost with hashtag "#king-#{rand(11)} dummy"
    }
  end
end

When /^submit a micropost with hashtag "(.*?)"$/ do |arg|
  fill_in 'micropost_content', with: arg
  click_button "Post"
end
When /^the user clicks on hashtag$/ do
	visit 'hashtags/kings'
end
Then /^the user sees Popular tags$/ do
  within('div#Popular_tags') do
    expect(page).to have_content('Popular Tags')
  end
end 
Then /^the user sees posted hashtag$/ do
  within('div#Popular_tags') do
    expect(page).to have_selector('li', text: 'kings')
  end
end


Then /^page have heading of tag$/ do
	expect(page).to have_content('kings')
end

Then /^hashtag have link$/ do
  within('div#Popular_tags') do
    expect(page).to have_link('kings',href: '/hashtags/kings')
  end
end
Then /^hashtag of feed is link$/ do
  within('.microposts') do
    expect(page).to have_link('#kings',href: '/hashtags/kings')
  end
end

Then /^the user sees only ten popular tags$/ do
  #within('div#Popular_tags') do
    page.should have_css("div#Popular_tags li", :count => 10)
  #end
end

Then /^order of tags is descending according to number of occurrence$/ do

  arr = page.all("div#Popular_tags li a")
  SimpleHashtag::Hashtag.find_by_name(arr[0].text.to_sym)

  byebug

end