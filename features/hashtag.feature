Feature: hashtag

Scenario: Can see popular tags
	Given a user visits the signin page
		And the user has an account
	When the user submits valid signin information
		And the user visits home page again
		And the user submits a micropost with sample hashtag
	Then the user sees Popular tags 
		And the user sees posted hashtag

Scenario: show all micropost related to a tag
	Given a user visits the signin page
		And the user has an account
	When the user submits valid signin information
		And the user visits home page again
		And the user submits a micropost with sample hashtag 
		And the user clicks on hashtag
	Then page have heading of tag

Scenario: Popular Tags are link
	Given a user visits the signin page
		And the user has an account
	When the user submits valid signin information
		And the user visits home page again
		And the user visits home page again
		And the user submits a micropost with sample hashtag 
	Then hashtag have link

Scenario: Number of popular tags
	Given a user visits the signin page
		And the user has an account
	When the user submits valid signin information
		And the user visits home page again
		And the user submits multiple microposts with hashtag
	Then the user sees only ten popular tags
 
Scenario: Order of Tags
	Given a user visits the signin page
		And the user has an account
	When the user submits valid signin information
		And the user visits home page again
		And the user submits multiple microposts with repeated hashtag
	Then order of tags is descending according to number of occurrence


