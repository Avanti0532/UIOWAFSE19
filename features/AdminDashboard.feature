Feature: Admin privileges

  Background: I am on the Welcome to Online Tutorial  page
    Given the following students have been added to Student Database:
      | first_name  | last_name  | email          | password    |
      | Robin       | Hood       | robin@gmail.com  | 12345678  |
      | Thomas      | Edison     | thomas@gmail.com  | 23456789  |
      | Frank       | Robert     | frank@gmail.com | 34567890    |

    And the following faculties have been added to Faculty Database:
      | first_name  | last_name   | email             | password    |
      | Alice       | May         | alicen@uiowa.edu  | 12345689    |
      | Lily        | Edison      | lilys@uiowa.edu   | 23456789    |
      | Hazel       | Robert      | hazel@uiowa.edu   | 34567890    |

    And the following admins have been added to Admin Database:
      | first_name  | last_name   | email             | password    | password_confirmation |
      | Linh        | Pham        | linh@gmail.com    | 12345689    |  12345689            |
      | Jordan        | Peterson  | jordan@gmail.com   | 23456789    | 23456789            |


  Scenario: Admin can see all faculties in the database
    When I log in as an admin
    Then I can see all faculties in the database

  Scenario: Admin can see all students in the database
    When I log in as an admin
    Then I can see all students in the database

  Scenario: Admin can see all admins in the database
    When I log in as an admin
    Then I can see all admins in the database

  Scenario: Admin cannot edit any student or faculty information
    When I log in as an admin
    Then I cannot edit any student or faculty information

  Scenario: Admin cannot add a new faculty or student
    When I log in as an admin
    Then I cannot add new faculty or student

  Scenario: Admin will be directed to dashboard when they sign in
    When I log in as an admin
    Then  I should be directed to the admin site

  Scenario: Admin can create other admin for the application
    When I log in as an admin
    Then I can create account for another admin


  Scenario: Admin cannot export student data
    When I log in as an admin
    Then I cannot export student information

  Scenario: Admin cannot export faculty data
    When I log in as an admin
    Then I cannot export faculty information

  Scenario: Admin can go to homepage from the dashboard
    When I log in as an admin
    Then I will go to homepage of Online Tutorial if I click on Home button on the navigation bar

