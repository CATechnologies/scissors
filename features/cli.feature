Feature: Command line interface
  In order to use Scissors
  As a CLI
  I want to have some commands

  Scenario: I have a test command
    When I run "scissors test"
    Then the output should contain "motherfucker"
