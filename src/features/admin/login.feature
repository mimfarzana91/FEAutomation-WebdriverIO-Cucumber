Feature: login Feature
    # No.1 必須項目（ID、パスワード）のバリデーション確認
    Scenario: Validation check of required items
    # 1. ログイン画面を開く / Open Login Screen
    Given I open the url "https://system.com/login"
    # 2. 画面表示（画面タイトルの表示）を待つ Wait for screen title is displayed
    Then I wait that element "//p[text()='共和電業 会員情報管理']" is within the viewport
    # 3. 「Sign In」ボタンが非活性であることを確認 / Verify that the Sign In button is inactive
    Then I expect that element "//button[contains(text(),'Sign In')]" is not enabled
    # 4. IDを空欄にする / Set user id blank
    When I set "" to the inputfield "//input[@name='username']"
    # 5. パスワードを空欄にする / Set password blank
    When I set "" to the inputfield "//input[@name='password']"
    # 6. ID空欄のバリデーションメッセージを確認 / Verify that the error message(ID not entered) is displayed
    Then I expect that element "//div[contains(@class, 'text-error-red')]" contains the text "IDを入力してください"
    # 7. IDを入力 / Input user id
    When I set "<username>" to the inputfield "//input[@name='username']"
    # 8. ID空欄のバリデーションメッセージが消えたことを確認 / Verify that the error message(ID not entered) is not displayed
    Then I expect that element "//div[contains(@class, 'text-error-red')]" not contains the text "IDを入力してください"
    # 9. 「Sign In」ボタンが非活性であることを確認 / Verify that the Sign In button is inactive
    Then I expect that element "//button[text()='Sign In']" is not enabled
    # 10. パスワード空欄のバリデーションメッセージを確認 / Verify that the error message(password not entered) is displayed
    Then I expect that element "//div[contains(@class, 'text-error-red')]" contains the text "パスワードを入力してください"
    # 11. 「Sign In」ボタンが非活性であることを確認 / Verify that the Sign In button is inactive
    Then I expect that element "//button[text()='Sign In']" is not enabled
    # 12. パスワードを入力 / Input password
    When I set "<password>" to the inputfield "//input[@name='password']"
    # 13. パスワード空欄のバリデーションメッセージが消えたことを確認 / Verify that the error message(password not entered) is not displayed
    Then I expect that element "//div[contains(@class, 'text-error-red')]" is not within the viewport
    # 14. 「Sign In」ボタンが活性であること（に変更したこと）を確認 / Verify that the Sign In button is active
    Then I expect that element "//button[text()='Sign In']" is enabled
    # 15. Take screenshot
    When I take the screenshot of screen "Scenario_1"

    Examples:
        | username | password |
        | admin | P@ssword |

    # No.2 ID、パスワードの不一致の場合にログインできないことを確認
    Scenario: Confirmation that login is not possible in case of ID and password mismatch
    # 1. ログイン画面を開く / Open Login Screen
    Given I open the url "https://system.com/login"
    # 2. 画面表示（画面タイトルの表示）を待つ Wait for screen title is displayed
    Then I wait that element "//p[text()='共和電業 会員情報管理']" is within the viewport
    # 3. IDを入力 / Input user id
    When I set "<username>" to the inputfield "//input[@name='username']"
    # 4. パスワードを入力 / Input password
    When I set "<password>" to the inputfield "//input[@name='password']"
    # 5. 「Sign In」ボタンをクリック / Click that the Sign In button
    When I click on the button "//button[text()='Sign In']"
    # 6. ID・パスワード不一致時のエラーメッセージがトーストに表示されることを確認 / Verify that the error message in toast message is displayed. ("IDまたはパスワードが違います。"
    #Then I expect that element "//div" contains the text "IDまたはパスワードが違います"
    Then I wait that element "//div[contains(text(),'IDまたはパスワードが違います')]" is within the viewport

    Examples:
    | username | password |
    | admin | P@sswddd |

    # No.3 登録済ID、パスワードを入力して、ログイン
    Scenario: Confirmation that login is not possible in case of ID and password mismatch
    # 1. ログイン画面を開く / Open Login Screen
    Given I open the url "https://system.com/login"
    # 2. 画面表示（画面タイトルの表示）を待つ Wait for screen title is displayed
    Then I wait that element "//p[text()='共和電業 会員情報管理']" is within the viewport
    # 3. IDを入力 / Input user id
    When I set "<username>" to the inputfield "//input[@name='username']"
    # 4. パスワードを入力 / Input password
    When I set "<password>" to the inputfield "//input[@name='password']"
    # 5. 「Sign In」ボタンをクリック / Click that the Sign In button
    When I click on the button "//button[text()='Sign In']"
    # 6. Wait for screen title of top page is displayed
    Then I wait that element "//p[text()='共和電業']/following-sibling::h1[text()='会員情報管理']" is within the viewport
    # 7. Take screenshot
    When I take the screenshot of screen "Scenario_3_<role>"

    Examples:
    | username  | password |
    | admin  | P@ssword |
    | reader | P@ssword |