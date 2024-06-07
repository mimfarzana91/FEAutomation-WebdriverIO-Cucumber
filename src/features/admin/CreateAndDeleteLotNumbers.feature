Feature: Create and delete Lot Number
    
    # No.1 ロット番号を新規登録する
    Scenario: Register Lot Numbers
    # 1. ログイン画面を開く / Open Login Screen
    Given I open the url "https:system.com/login"
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
    # 7. 「ロット番号一覧」リンクをクリックする / Click the Lot Numbers List Link
    When I click on the button "//div[contains(@class, 'cursor-pointer')][text()='ロット番号一覧']"
    # 8. ロット番号管理画面のタイトルと検索ラベルの表示を待つ / Wait for the title and search label to appear on the lot number management screen
    Then I wait that element "//h1[text()='ロット番号管理']/following-sibling::div/child::div[text()='型式・ロット番号を入力して検索']" is within the viewport
    # 8. 新規登録ボタンをクリックする / Click register button
    When I click on the button "//button/div[text()='新規登録']"
    # 9. ダイアログのタイトルの表示を確認する / Check the display of the dialog title
    Then I wait that element "//h2/div[text()='ロット番号登録']" is within the viewport
    # 10. キャンセルボタンをクリックする / Click cancel button
    When I click on the button "//button/div[text()='キャンセル']"
    # 11. ダイアログのタイトルが表示されていないことを確認する / Check the dialog title is not displayed
    When I pause for 2000ms
    Then I expect that element "//h2/div[text()='ロット番号登録']" is not displayed
    # 12. 新規登録ボタンをクリックする / Click register button
    When I click on the button "//button/div[text()='新規登録']"
    # 13. ダイアログのタイトルの表示を確認する / Check the display of the dialog title
    Then I wait that element "//h2/div[text()='ロット番号登録']" is within the viewport
    # 14. 登録ボタンが非活性であることを確認する / Check the registration button is inactive
    Then I expect that element "//div[text()='登録']/parent::button" is not enabled
    # 15. バリデーションのエラーメッセージを確認する / Check validation error messages
    #     型式を未入力で、ロット番号のテキストボックスをクリックする / Click on the lot number text box with the model not entered
    When I click on the button "//input[@id='type']"
    When I click on the button "//input[@id='lot_number']"
    Then I expect that element "//input[@id='type']/following-sibling::div[contains(@class, 'text-error-red')]" matches the text "必須項目です"
    #     ロット番号を未入力で、型式のテキストボックスをクリックする / Click on the type text box with the lot number not entered
    When I click on the button "//input[@id='type']"
    Then I expect that element "//input[@id='lot_number']/following-sibling::div[contains(@class, 'text-error-red')]" matches the text "必須項目です"
    # 16. 型式を入力し、バリデーションのエラーメッセージが消えることを確認する / Enter the type and verify that the validation error message disappears
    When I set "<model>" to the inputfield "//input[@id='type']"
    Then I expect that element "//input[@id='type']/following-sibling::div[contains(@class, 'text-error-red')][text()='必須項目です']" is not displayed
    # 17. 登録ボタンが非活性のままであることを確認する / Check that the registration button remains inactive
    Then I expect that element "//div[text()='登録']/parent::button" is not enabled
    # 18. ロット番号を入力し、バリデーションのエラーメッセージが消えることを確認する / Enter the lot number and verify that the validation error message disappears
    When I set "<lot_number>" to the inputfield "//input[@id='lot_number']"
    Then I expect that element "//input[@id='lot_number']/following-sibling::div[contains(@class, 'text-error-red')][text()='必須項目です']" is not displayed
    # 19. 登録ボタンが活性である（に変わる）ことを確認する / Check that the registration button is (turns into) active
    Then I expect that element "//div[text()='登録']/parent::button" is enabled
    # 20. 登録ボタンをクリックする / Click register button
    When I click on the button "//div[text()='登録']/parent::button"
    # 21. 登録完了のトーストメッセージを確認する / Check the toast message for completed registration
    Then I wait that element "//div[text()='ロット番号が追加されました。']" is within the viewport
    # 22. DBへの反映を待つ / Wait for reflection in DB
    When I pause for 5000ms
    # 23. ロット番号を入力する / Enter the lot number
    When I set "<lot_number>" to the inputfield "//input[@id='query']"
    # 24. 「検索」アイコンをクリックする / Click the Search icon
    #     "type=submit"のボタンは2つ。1つ目が検索アイコン/ Two buttons with "type=submit", the first is a search icon
    When I click on the button "//button[@type='submit'][1]"
    # 25. 検索結果の表示を待つ / Wait for the text of search result is displayed
    Then I wait that element "//p[contains(text(), '検索結果')]" is within the viewport
    # 26. 対象データの表示を確認する / Confirm that the test data is displayed in table.
    #     一意となるロット番号をキーにデータを確認する / Verify data using unique lot number as the key.
    Then I expect that element "//tr//td/div[text()='<lot_number>']" is displayed
    #     ロット番号の左側のカラムを確認 / Check the column to the left of the lot number
    Then I expect that element "//tr//td/div[text()='<lot_number>']/parent::td/preceding-sibling::td[1]/div[text()='<model>']" is displayed


    Examples:
    | username  | password | lot_number | model    |
    | kw_admin  | P@ssword | TE0008     | TES-100T |


    # No.2 ロット番号を削除する
    Scenario: Delete Lot Numbers
    # 1. 「トップ」リンクをクリック / Click that the Top link
    When I click on the button "//a[text()='トップ']"
    # 2. TOP画面のタイトル表示を待つ / Wait for screen title of top page is displayed
    Then I wait that element "//p[text()='共和電業']/following-sibling::h1[text()='会員情報管理']" is within the viewport
    # 3. 「ロット番号一覧」リンクをクリックする / Click the Lot Numbers List Link
    When I click on the button "//div[contains(@class, 'cursor-pointer')][text()='ロット番号一覧']"
    # 4. ロット番号管理画面のタイトルと検索ラベルの表示を待つ / Wait for the title and search label to appear on the lot number management screen
    Then I wait that element "//h1[text()='ロット番号管理']/following-sibling::div/child::div[text()='型式・ロット番号を入力して検索']" is within the viewport
    # 5. ロット番号を入力する / Enter the lot number
    When I set "<lot_number>" to the inputfield "//input[@id='query']"
    # 6. 「検索」アイコンをクリックする / Click the Search icon
    #     "type=submit"のボタンは2つ。1つ目が検索アイコン/ Two buttons with "type=submit", the first is a search icon
    When I click on the button "//button[@type='submit'][1]"
    # 7. 検索結果の表示を待つ / Wait for the text of search result is displayed
    Then I wait that element "//p[contains(text(), '検索結果')]" is within the viewport
    # 8. 対象データの表示を確認する / Confirm that the test data is displayed in table.
    #     一意となるロット番号をキーにデータを確認する / Verify data using unique lot number as the key.
    Then I expect that element "//tr//td/div[text()='<lot_number>']" is displayed
    #     ロット番号の左側のカラムを確認 / Check the column to the left of the lot number
    Then I expect that element "//tr//td/div[text()='<lot_number>']/parent::td/preceding-sibling::td[1]/div[text()='<model>']" is displayed
    #     ロット番号の右側のカラムを確認 / Check the column to the right of the lot number
    Then I expect that element "//tr//td/div[text()='<lot_number>']/parent::td/following-sibling::td[1]/div/button/div[text()='削除']" is displayed
    # 9. 削除ボタンをクリックする / Click delete button
    When I click on the button "//tr//td/div[text()='<lot_number>']/parent::td/following-sibling::td[1]/div/button/div[text()='削除']"
    # 10. ダイアログのタイトルの表示を確認する / Check the display of the dialog title
    Then I wait that element "//h2/div[text()='本当に削除しますか？']" is within the viewport
    # 11. キャンセルボタンをクリックする / Click cancel button
    When I click on the button "//button/div[text()='キャンセル']"
    # 12. ダイアログのタイトルが表示されていないことを確認する / Check the dialog title is not displayed
    When I pause for 2000ms
    Then I expect that element "//h2/div[text()='本当に削除しますか？']" is not displayed
    # 13. 削除ボタンをクリックする / Click delete button
    When I click on the button "//tr//td/div[text()='<lot_number>']/parent::td/following-sibling::td[1]/div/button/div[text()='削除']"
    # 14. ダイアログのタイトルの表示を確認する / Check the display of the dialog title
    Then I wait that element "//h2/div[text()='本当に削除しますか？']" is within the viewport
    # 15. 削除するデータを確認する / Check the data to be deleted
    Then I expect that element "//div[text()='型式：<model>']" is displayed
    Then I expect that element "//div[text()='ロット番号：<lot_number>']" is displayed
    # 16. 削除ボタンをクリックする / Click delete button
    When I click on the button "//div[text()='キャンセル']/parent::button/following-sibling::button/div[text()='削除']"
    # 17. 削除完了のトーストメッセージを確認する / Confirm toast message of completed deletion
    Then I wait that element "//div[text()='ロット番号が削除されました。']" is within the viewport
    # 18. DBへの反映を待つ / Wait for reflection in DB
    When I pause for 5000ms
    # 19. ロット番号を入力する / Enter the lot number
    When I set "<lot_number>" to the inputfield "//input[@id='query']"
    # 20. 「検索」アイコンをクリックする / Click the Search icon
    #     "type=submit"のボタンは2つ。1つ目が検索アイコン/ Two buttons with "type=submit", the first is a search icon
    When I click on the button "//button[@type='submit'][1]"
    # 21. 検索結果が0件の場合のメッセージが表示されることを確認する / Verify that the message is displayed when there are zero search results.
    Then I wait that element "//div[(text()='一致するデータは見つかりませんでした。')]" is within the viewport

    Examples:
    | username  | password | lot_number | model    |
    | kw_admin  | P@ssword | TE0008     | TES-100T |