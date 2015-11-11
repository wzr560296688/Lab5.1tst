Given /^there is a post with title "(.*?)" and content "(.*?)"$/ do |vtitle,vcontent|
	@edit_title =  "#{vtitle}"
	Post.create!({ :title => "#{vtitle}", :content => "#{vcontent}", :post_time => Time.now })
end
When /^I edit this post$/ do
	click_on("Edit")
end
And /^I update title to "(.*?)" and content to "(.*?)"$/ do |utitle,ucontent|
	@utitle = utitle
	fill_in "Title", :with => utitle 
	fill_in "Content", :with => ucontent 
    click_button "Update Post" 
end
Then /^I can see it has been updated$/ do
	page.should have_content(@utitle) 
end