Feature: A user can authorize their YouTube account within Spotitude
  Scenario: A user logs in with Spotify
    Given I am logged into Spotitude already
    When I click a Spotify playlist
    Then I should see my selected playlist
