Feature: A user can logout of Spotitude

  Scenario: A user logs out of Spotitude
    Given I am logged into Spotitude already
    When I click the logout button
    Then I should be logged out of Spotitude

