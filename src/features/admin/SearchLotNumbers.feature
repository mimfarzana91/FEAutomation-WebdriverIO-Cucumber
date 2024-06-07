Feature: Search Lot Number
    
    # No.1 デフォルトの条件で検索し、対象データが表示されることを確認する
    Scenario: Search using the default criteria and confirm that the target data is displayed.
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
    # 7. 「ロット番号一覧」リンクをクリックする / Click the Lot Numbers List Link
    When I click on the button "//div[contains(@class, 'cursor-pointer')][text()='ロット番号一覧']"
    # 8. ロット番号管理画面のタイトルと検索ラベルの表示を待つ / Wait for the title and search label to appear on the lot number management screen
    Then I wait that element "//h1[text()='ロット番号管理']/following-sibling::div/child::div[text()='型式・ロット番号を入力して検索']" is within the viewport
    # 9. 「検索」アイコンをクリックする / Click the Search icon
    #     "type=submit"のボタンは2つ。1つ目が検索アイコン/ Two buttons with "type=submit", the first is a search icon
    When I click on the button "//button[@type='submit'][1]"
    # 10. 検索結果の表示を待つ / Wait for the text of search result is displayed
    Then I wait that element "//p[contains(text(), '検索結果')]" is within the viewport
    # 11. ヘッダーのテキストを確認する / Confrim the header text
    Then I expect that element "//thead//th[1]" matches the text "型式"
    Then I expect that element "//thead//th[2]" matches the text "ロット番号"
    Then I expect that element "//thead//th[3]" matches the text "操作"
    # 12. 対象データの表示を確認する / Confirm that the test data is displayed in table.
    #     一意となるロット番号をキーにデータを確認する / Verify data using unique lot number as the key.
    Then I expect that element "//tr//td/div[text()='<lot_number>']" is displayed
    #     ロット番号の左側のカラムを確認 / Check the column to the left of the lot number
    Then I expect that element "//tr//td/div[text()='<lot_number>']/parent::td/preceding-sibling::td[1]/div[text()='<model>']" is displayed
    #     ロット番号の右側のカラムを確認 / Check the column to the right of the lot number
    Then I expect that element "//tr//td/div[text()='<lot_number>']/parent::td/following-sibling::td[1]/div/button/div[text()='削除']" is displayed

    ## ページングしてデータが変更されることを確認する / Paging to make sure data is changed
    # 13. ページング前の表示件数が1-20件であることを確認する / Verify that the number of items displayed before paging is 1-20
    Then I wait that element "//div/span[contains(text(), '1-20件')]" is within the viewport
    # 14. 次へアイコンをクリックする / Click the Next icon
    When I click on the button "//button[@aria-label='Go to next page']"
    # 15. ページング後の表示件数が21-40件であることを確認する / Ensure that the number of items displayed after paging is between 21-40.
    Then I wait that element "//div/span[contains(text(), '21-40件')]" is within the viewport
    # 16. 次のページのデータの表示を確認する / Check the data display on the next page.
    #     一意となるロット番号をキーにデータを確認する / Verify data using unique lot number as the key.
    Then I expect that element "//tr//td/div[text()='<lot_number_2>']" is displayed
    #     ロット番号の左側のカラムを確認 / Check the column to the left of the lot number
    Then I expect that element "//tr//td/div[text()='<lot_number_2>']/parent::td/preceding-sibling::td[1]/div[text()='<model_2>']" is displayed
    #     ロット番号の右側のカラムを確認 / Check the column to the right of the lot number
    Then I expect that element "//tr//td/div[text()='<lot_number_2>']/parent::td/following-sibling::td[1]/div/button/div[text()='削除']" is displayed
    

    # 17. ページング前のデータが表示されないことを確認する / Ensure that no data is displayed before paging
    Then I expect that element "//tr//td/div[text()='<lot_number>']" is not displayed
    # 18. 戻るアイコンをクリックする / Click the Back icon
    When I click on the button "//button[@aria-label='Go to previous page']"
    # 19. ページング後の表示件数が1-20件であることを確認する / Ensure that the number of displayed items after paging is 1-20
    Then I wait that element "//div/span[contains(text(), '1-20件')]" is within the viewport
    # 20. ページング前のデータが表示されることを確認する / Verify that data is displayed before paging
    Then I expect that element "//tr//td/div[text()='<lot_number>']" is displayed

    Examples:
    | username  | password | lot_number | model      | lot_number_2 | model_2  |
    | admin     | P@ssword | 8200       | 200A       | 4360         | DCS-100A |


    # No.2 ロット番号・型式で検索し、対象データが表示されることを確認する
    Scenario: Search by lot number or model number and confirm that the target data is displayed.
    # 1. TOP画面に遷移する / Transition to Top screen
    When I click on the button "//div/a[(text()='トップ')]"
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
    # 9. 条件外のデータの表示を確認する / Check the display of out-of-condition data
    Then I expect that element "//tr//td/div[text()='<lot_number_2>']" is not displayed
    # 10. 検索条件をクリアする / Clear search condition
    #     "type=submit"のボタンは2つ。2つ目が削除アイコン/ Two buttons with "type=submit", the first is a delete icon
    When I click on the button "//button[@type='submit'][2]"
    # 11. 型式を入力する / Input model
    When I set "<model>" to the inputfield "//input[@id='query']"
    # 12. 検索結果の表示を待つ / Wait for the text of search result is displayed
    Then I wait that element "//p[contains(text(), '検索結果')]" is within the viewport
    # 13. 対象データの表示を確認する / Confirm that the test data is displayed in table.
    #     一意となるロット番号をキーにデータを確認する / Verify data using unique lot number as the key.
    Then I expect that element "//tr//td/div[text()='<lot_number>']" is displayed
    #     ロット番号の左側のカラムを確認 / Check the column to the left of the lot number
    Then I expect that element "//tr//td/div[text()='<lot_number>']/parent::td/preceding-sibling::td[1]/div[text()='<model>']" is displayed
    #     ロット番号の右側のカラムを確認 / Check the column to the right of the lot number
    Then I expect that element "//tr//td/div[text()='<lot_number>']/parent::td/following-sibling::td[1]/div/button/div[text()='削除']" is displayed
    # 14. 条件外のデータの表示を確認する / Check the display of out-of-condition data
    Then I expect that element "//tr//td/div[text()='<lot_number_2>']" is not displayed

    Examples:
    | username  | password | lot_number | model    | lot_number_2 | model_2  |
    | admin     | P@ssword | 8200       | 200A     | 4360         | 100A     |

    # No.3 検索に合致しない場合に表示されるメッセージを確認する
    Scenario: Check the message displayed when a search does not match
    # 1. TOP画面に遷移する / Transition to Top screen
    When I click on the button "//div/a[(text()='トップ')]"
    # 2. TOP画面のタイトル表示を待つ / Wait for screen title of top page is displayed
    Then I wait that element "//p[text()='共和電業']/following-sibling::h1[text()='会員情報管理']" is within the viewport
    # 3. 「ロット番号一覧」リンクをクリックする / Click the Lot Numbers List Link
    When I click on the button "//div[contains(@class, 'cursor-pointer')][text()='ロット番号一覧']"
    # 4. ロット番号管理画面のタイトルと検索ラベルの表示を待つ / Wait for the title and search label to appear on the lot number management screen
    Then I wait that element "//h1[text()='ロット番号管理']/following-sibling::div/child::div[text()='型式・ロット番号を入力して検索']" is within the viewport
    # 5. 無効なロット番号を入力する / Enter the invalid lot number
    When I set "<invalid_lot_number>" to the inputfield "//input[@id='query']"
    # 6. 「検索」アイコンをクリックする / Click the Search icon
    #     "type=submit"のボタンは2つ。1つ目が検索アイコン/ Two buttons with "type=submit", the first is a search icon
    When I click on the button "//button[@type='submit'][1]"
    # 7. 検索結果が0件の場合のメッセージが表示されることを確認する / Verify that the message is displayed when there are zero search results.
    Then I wait that element "//div[(text()='一致するデータは見つかりませんでした。')]" is within the viewport

    Examples:
    | username  | password    | invalid_lot_number |
    | admin     | P@ssword    | 82000000           |