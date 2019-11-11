Feature: Allow faculties and students to sign up

  Background: I am on the homepage of Online Tutorial

    Given I am on homepage of Online Tutorial

  Scenario: Students sign up with valid details
    When I sign up with valid student details
    Then I should get a successful message

  Scenario: Faculties sign up with valid details
    When I sign up with valid faculties details
    Then I should get a successful message


  Scenario: Students sign up with blank first name
    When I sign up with blank first name as a student
    Then I should see a blank first name error message

  Scenario: Faculties sign up with blank first name
    When I sign up with blank first name as a faculty
    Then I should see a blank first name error message

  Scenario: Students sign up with blank last name
    When I sign up with blank last name as a student
    Then I should see a blank last name error message

  Scenario: Faculties sign up with blank last name
    When I sign up with blank last name as a faculty
    Then I should see a blank last name error message

  Scenario: Faculties sign up with blank email
    When I sign up with blank email as a faculty
    Then I should see a blank email error message

  Scenario: Students sign up with blank email
    When I sign up with blank email as a student
    Then I should see a blank email error message

  Scenario: Students sign up with blank email
    When I sign up with blank email as a faculty
    Then I should see a blank email error message

  Scenario: Students sign up with invalid password
    When I sign up with invalid password as a student
    Then I should see an invalid password message


  Scenario: Students sign up with duplicate email
    When I sign up with duplicate email as a student
    Then I should see a duplicate email message

  Scenario: Faculty sign up with duplicate email
    When I sign up with duplicate email as a faculty
    Then I should see a duplicate email message

  Scenario: Faculties sign up with invalid password
    When I sign up with invalid password as a faculty
    Then I should see an invalid password message

  Scenario: Students sign up without password
    When I sign up with blank password as a student
    Then I should see a blank password error message




