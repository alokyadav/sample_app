Feature: hashtag

Scenario: Can see popular tags
	Given a user visits the signin page
		And the user has an account
	When the user submits valid signin information
		And they visit home page again
		And submit a micropost with hashtag
	Then they see Popular tags 
		And they see posted hashtag

Scenario: show all micropost related to a tag
	Given a user visits the signin page
		And the user has an account
	When the user submits valid signin information
		And they visit home page again
		And submit a micropost with hashtag
		And click on hashtag
	Then have heading of tags
 
