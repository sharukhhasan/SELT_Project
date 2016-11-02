Given /^I am on the Spotitude homepage$/ do
  visit root_path
 end

  When /^I am not logged into Spotitude$/ do
      visit root_path
  end

  Then /^I should see the login button$/ do 
     result = false
     
     if page.has_button?("Login With Spotify!")
        result = true 
     end
     
     expect(result).to be_truthy
  end

Given /^I am on the Spotitude homepage and the following user is in the database:$/ do
  users_table.hashes.each do |user|
     User.create user 
  end
  visit root_path
  #click_button 'Login With Spotify!'
 end

  When /^I am logged into Spotitude$/ do
      #code
      #visit Rails.application.routes.recognize_path('playlists/index')
      #click_button 'Login With Spotify!'
      visit root_path
      click_button 'Login With Spotify!'
      #sesh = SessionsController.create
  end

  Then /^I should see the logout button$/ do 
     result = false
     
     if page.has_button?("Sign out Here!")
        result = true 
     end
     
     expect(result).to be_truthy
  end






=begin
Given /^I am on the Spotitude login page$/ do
  #visit movies_path
  visit login_path
 end
 
 Given /^I click to login$/ do
  #visit movies_path
  #visit login_path
  click_button ''
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
=end
