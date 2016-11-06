Feature: Authentication
  In order to create and view playlists
  As a user
  I want to sign in with Spotify

  Scenario: Login via Spotify
    When I go to the "the homepage"
    And I login via Spotify
    And Spotify authorizes me
    Then I should see, "Welcome, "

  Scenario: Checking Login Status
    Given I am signed in
    When I go to the "the homepage"
    Then I should see, "Welcome, "

  Scenario: Log out
    Given I am signed in
    When I go to "the homepage"
    And I logout
    Then I should see the login button