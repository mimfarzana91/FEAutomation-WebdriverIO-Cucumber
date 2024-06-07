Feature: visual regression Feature
    # Scenario No.1
    Scenario: Visual Regression Test
        # 1. Open Login Screen
        Given I open the url "https://dev-partner.kml-system.com/login"
        # 2. Wait for screen title is displayed
        Then I wait that element "//p[text()='共和電業 販売代理店サイト']" is within the viewport
        # 3. Input User ID
        When I set "<username>" to the inputfield "input[name='username']"
        # 4. Input password
        When I set "<password>" to the inputfield "input[name='password']"
        # 5. Click that the login (SignIn) button
        When I click on the button "//button[text()='Sign In']"
        # 6. Wait for screen title of top page is displayed
        Then I wait that element "//p[text()='共和電業']/following-sibling::p[text()='販売代理店サイト']" is within the viewport
        # 7. Compare full-size browser screenshots with the variable data display section hidden (transparent)
        When I pause for 2000ms
        # Change News to hidden (transparent)
        When I change the element "//div[contains(@class, 'flex-1')][contains(@class, 'mt-4')]" to transparent
        # Change Workshop to hidden (transparent)
        When I change the element "//div[contains(@class, 'flex-1')][contains(@class, 'mt-8')]" to transparent
        Then I check the full page screenshot in the name of "2023-05-01_TOP_transparent.png"
        # 8. Open TOP Screen
        Given I open the url "https://dev-partner.kml-system.com"
        # 9. Compare full-size browser screenshots
        Then I check the full page screenshot in the name of "2023-05-01_TOP.png"
        
        Examples:
          | role                 | username   |  password  |
          | Admin                | kwd_0001   |  ~We4?Jh6  |