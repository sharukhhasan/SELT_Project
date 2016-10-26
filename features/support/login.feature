Feature: the user attempts to login to Spotitude
  
Given I am on the Spotitude login page

Scenario:
  When I have a valid Spotify account
  Then I should be able to login to Spotitude
  
  
Scenario:
  When I do not have a valid Spotify account
  Then I should not be able to login to Spotitude