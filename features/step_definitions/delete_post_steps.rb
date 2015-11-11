Given /^there is a post titled with "(.*?)" and content with "(.*?)"$/ do |dtitle,dcontent|
	Post.create!({ :title => "#{dtitle}", :content => "#{dcontent}", :post_time => Time.now })
end 
When /^I am on the post page$/ do
	visit("/posts") 
end
And /^I select a post$/ do
	click_on("Show")
end
And /^I click "Delete Post"$/ do
	click_on("Delete Post")
end
Then /^the post should be deleted$/ do
	page.should !have_content(@dtitle) 
end