Feature: Sample Feature
    # Scenario No.1
    Scenario: Login and confirm title
        # 1	Open Login Screen
        Given I open the url "https://practicetestautomation.com/practice-test-login/"
        # 2	Input Username "student"
        When  I set "<username>" to the inputfield "//*[@id='username']"
        # 3	Input password "Password123"
        When  I set "<password>" to the inputfield "//*[@id='password']"
        # 4	Click that the Submit button
        When  I click on the button "//button[text()='Submit']"
        # 5	Confirm the title(Logged In Successfully).
        Then I expect that element "//h1[@class='post-title']" matches the text "Logged In Successfully"
        Examples:
          | username | password    |
          | student  | Password123 |