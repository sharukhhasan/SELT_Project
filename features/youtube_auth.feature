Feature: A user can authorize their YouTube account within Spotitude
  Scenario: A user logs in with Spotify
    Given I am logged into Spotitude already
    When I double click a Spotify playlist
    AND
    When I click the YouTube authorize button
    Then I should be redirected to the YouTube callback view
