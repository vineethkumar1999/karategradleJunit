@test @Test @TestClass @ignore
Feature: Testing my API

  Background:

  @Check
  Scenario: Test the Project
    Given url 'https://api.aviationapi.com/v1/charts?apt=AVL'
    * def A = 20
    * print __arg
    * print firstname + lastname
    * print b
    When method Get
    Then status 200


  @Check2
  Scenario: Test the Project
    Given url 'https://api.aviationapi.com/v1/charts?apt=AVL'
    * print 'In Check2 Tag'
    * def A = 20
    * print __arg
    * print firstname + lastname
    * print b
    * def R = 'In Check 2'
    When method Get
    Then status 200





