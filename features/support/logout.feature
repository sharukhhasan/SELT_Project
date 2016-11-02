Feature: the user can logout of Spotitude
  
  Given I am on the Spotitude homepage and the following user is in the database:
  | provider  | uid  | name | session_token | created_at                | updated_at                |
  | provider1 | Joe1 | Joe  | session1      | 2013-09-12 22:49:27 +0530 | 2013-09-12 22:49:27 +0530 |

Scenario:
  When I am logged into Spotitude
  Then I should see the logout button