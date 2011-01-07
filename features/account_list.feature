Feature: Account listing

  Background:
    Given the following account exists:
      | username    |
      | matz        |
      | tristandunn |
    And the following names exist:
      | account        | value              |
      | username: matz | 松本行弘           |
      | username: matz | Yukihiro Matsumoto |
    And the following portrait exists:
      | account        | url                                                                       |
      | username: matz | http://upload.wikimedia.org/wikipedia/commons/7/76/Yukihiro_Matsumoto.JPG |
    And the following services exist:
      | account        | name       | key  |
      | username: matz | friendfeed | matz |
      | username: matz | github     | matz |
    And the following sites exist:
      | account        | title      | url                           |
      | username: matz | Matzにっき | http://www.rubyist.net/~matz/ |

  Scenario: Viewing account listing
    When I go to the homepage
    Then I should see the avatar of the "matz" account
    And I should see "Yukihiro Matsumoto" as the name of the "matz" account
    And I should see the "Matzにっき" website for the "matz" account
    And I should see the following services of the "matz" account:
      | name       | active |
      | facebook   | false  |
      | friendfeed | true   |
      | github     | true   |
      | iddy       | false  |
      | mixi       | false  |
      | twitter    | false  |
    And I should see the default avatar for the "tristandunn" account
    And I should see "tristandunn" as the name of the "tristandunn" account
    And I should not see a website for the "tristandunn" account
    And I should see the following services of the "tristandunn" account:
      | name       | active |
      | facebook   | false  |
      | friendfeed | false  |
      | github     | false  |
      | iddy       | false  |
      | mixi       | false  |
      | twitter    | false  |

  Scenario: Viewing account listing, in Japanese
    When I go to the homepage
    And I follow "Japanese"
    Then I should see "松本行弘" as the name of the "matz" account
    And I should see the avatar of the "matz" account
    And I should see the following services of the "matz" account:
      | name       | active |
      | facebook   | false  |
      | friendfeed | true   |
      | github     | true   |
      | iddy       | false  |
      | mixi       | false  |
      | twitter    | false  |
