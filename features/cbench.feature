Feature: cbench controller

  Background:
    Given I set the environment variables to:
      | variable         | value |
      | TREMA_LOG_DIR    | .     |
      | TREMA_PID_DIR    | .     |
      | TREMA_SOCKET_DIR | .     |

  @sudo
  Scenario: Run cbench
    Given I trema run "lib/cbench.rb"
    When I run `cbench --port 6653 --switches 1 --loops 2 --delay 1000`
    Then the stdout should contain:
      """
      RESULT: 1 switches 1 tests
      """

  @sudo
  Scenario: Run fast-cbench
    Given I trema run "lib/fast_cbench.rb"
    When I run `cbench --port 6653 --switches 1 --loops 2 --delay 1000`
    Then the stdout should contain:
      """
      RESULT: 1 switches 1 tests
      """
