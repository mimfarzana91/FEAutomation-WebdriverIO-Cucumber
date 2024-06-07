Feature: Delete User
    # No.1 会員詳細の情報を確認する
    Scenario: delete user information
    ### 詳細情報の確認
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
    # 6. TOP画面のタイトル表示を待つ / Wait for screen title of top page is displayed
    Then I wait that element "//p[text()='共和電業']/following-sibling::h1[text()='会員情報管理']" is within the viewport
    # 7. 「会員情報一覧」リンクをクリックする / Click the User Information List Link
    When I click on the button "//div[contains(@class, 'cursor-pointer')][text()='会員情報一覧']"
    # 8. 会員情報管理画面のタイトル表示を待つ / Wait for screen title of top page is displayed
    Then I wait that element "//h1[text()='会員情報管理']/following-sibling::h2[text()='会員登録者検索']" is within the viewport
    # 9. 検索条件を入力する / Input search condition
    When I set "<email>" to the inputfield "//input[@id='email']"
    # 10. 「検索」ボタンをクリックする / Click the Search button
    When I click on the button "//button/div[text()='検索']"
    # 11. 検索結果の表示を待つ / Wait for the text of search result is displayed
    Then I wait that element "//p[contains(text(), '検索結果')]" is within the viewport
    # 12. 「詳細」ボタンをクリックする / Click the Detail button
    When I click on the button "//tr//td/div[text()='<email>']/parent::td/following-sibling::td[2]/div/a[1]/div[text()='詳細']"
    # 13. 会員詳細画面のタイトル表示を待つ / Wait for the title to be displayed on the member details screen.
    Then I wait that element "//h1[text()='会員登録者情報詳細']" is within the viewport
    # 14. 削除ボタンをクリックする / Click Delete "削除" Button
    When I click on the button "//div[text()='削除']"
    # 15. 削除確認ダイアログタイトルの表示を待つ / Wait for the title to be displayed on the delete confirm dialog.
    Then I wait that element "//div[text()='削除確認']" is within the viewport
    # 16. 削除ボタンをクリックする / Click Delete "削除" Button
    When I click on the button "//div[text()='削除確認']/parent::h2/following-sibling::div//button/div[text()='削除']"
    # 17. 削除完了のtoastメッセージを確認する / Confirm toast message of deletion completion
    Then I wait that element "//div[text()='会員情報が削除されました。']" is within the viewport
    # 18. 削除が完了し、反映されるのを待つ / Wait for the deletion to be completed and reflected.
    When I pause for 10000ms
    # 19. 検索条件を入力する / Input search condition
    When I set "<email>" to the inputfield "//input[@id='email']"
    # 20. 「検索」ボタンをクリックする / Click the Search button
    When I click on the button "//button/div[text()='検索']"
    # 21. 検索結果の表示を待つ / Wait for the text of search result is displayed
    Then I wait that element "//p[contains(text(), '検索結果')]" is within the viewport
    # 22. 検索結果が0件の場合のメッセージが表示されることを確認する / Verify that the message is displayed when there are zero search results.
    Then I wait that element "//div[(text()='一致するデータは見つかりませんでした。')]" is within the viewport

    Examples:
    |  username   | password  |  email                                              |
    |  admin   | P@ssword  |  admin+prd_auto@gmail.com  |
    |  admin   | P@ssword  |  admin+prd_auto@gmail.com  |
    |  admin   | P@ssword  |  admin+prd_auto@gmail.com  |