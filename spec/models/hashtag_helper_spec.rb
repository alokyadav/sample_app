require 'spec_helper'
include HashtagsHelper

describe "Hashtag" do
	describe "tags are in descending order" do
		User.destroy_all
		@user = User.create!(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
		@microposts = [] 
		20.times.each do |num|
			@microposts << @user.microposts.create!(content: "#Lorem ipsum")
		end
		30.times.each do |num|
			@microposts << @user.microposts.create!(content: "#some ipsum")
		end
		# byebug
		render_tags.collect {|arg| 
			arg.name}.should == ['some','lorem']
	end
end