Given /^I am on the Spotitude login page$/ do
  #visit movies_path
  visit login_path
 end


 When /^I have a valid Spotify account$/ do
  #visit new_movie_path
  #fill_in 'Title', :with => title
  #select rating, :from => 'Rating'
  #click_button 'Save Changes'
 end

 Then /^I should be able to login to Spotitude$/ do
   
 end

 When /^I do not have a valid Spotify account$/ do
   #visit movies_path
   #click_on "More about #{title}"
 end

 Then /^I should not be able to login to Spotitude$/ do
    #expect(page).to have_content(text)
 end
