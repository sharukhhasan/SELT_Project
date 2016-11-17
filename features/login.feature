Feature: A user can login to Spotitude

  Scenario: A user logs in with Spotify
    Given I am on the Spotitude homepage
    When I click the login button
    Then I should be logged in

