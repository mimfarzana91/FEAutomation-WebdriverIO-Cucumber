Feature: Search User

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
    # 7. 「会員情報一覧」リンクをクリックする / Click the User Information List Link
    When I click on the button "//div[contains(@class, 'cursor-pointer')][text()='会員情報一覧']"
    # 8. 会員情報管理画面のタイトル表示を待つ / Wait for screen title of top page is displayed
    Then I wait that element "//h1[text()='会員情報管理']/following-sibling::h2[text()='会員登録者検索']" is within the viewport
    # 9. 「検索」ボタンをクリックする / Click the Search button
    When I click on the button "//button/div[text()='検索']"
    # 10. 検索結果の表示を待つ / Wait for the text of search result is displayed
    Then I wait that element "//p[contains(text(), '検索結果')]" is within the viewport
    # 11. ヘッダーのテキストを確認する / Confrim the header text
    Then I expect that element "//thead//th[1]" matches the text "会社・学校・研究機関名"
    Then I expect that element "//thead//th[2]" matches the text "部署・学部名"
    Then I expect that element "//thead//th[3]" matches the text "氏名"
    Then I expect that element "//thead//th[4]" matches the text "メールアドレス"
    Then I expect that element "//thead//th[5]" matches the text "アカウント登録日時"
    Then I expect that element "//thead//th[6]" matches the text "操作"
    # 12. 対象データの表示を確認する / Confirm that the test data is displayed in table.
    #     一意となるメールアドレスをキーにデータを確認する / Verify data using unique email addresses as the key.
    Then I expect that element "//tr//td/div[text()='<email>']" is displayed
    #     メールアドレスの左側のカラムを確認 / Check the column to the left of the email address
    Then I expect that element "//tr//td/div[text()='<email>']/parent::td/preceding-sibling::td[3]/div[text()='<organization>']" is displayed
    Then I expect that element "//tr//td/div[text()='<email>']/parent::td/preceding-sibling::td[2]/div[text()='<department>']" is displayed
    Then I expect that element "//tr//td/div[text()='<email>']/parent::td/preceding-sibling::td[1]/div[text()='<fullname>']" is displayed
    #     メールアドレスの右側のカラムを確認 / Check the column to the right of the email address
    Then I expect that element "//tr//td/div[text()='<email>']/parent::td/following-sibling::td[1]/div[text()='<created_at>']" is displayed
    Then I expect that element "//tr//td/div[text()='<email>']/parent::td/following-sibling::td[2]/div/a[1]/div[text()='詳細']" is displayed
    Then I expect that element "//tr//td/div[text()='<email>']/parent::td/following-sibling::td[2]/div/a[2]/div[text()='修正']" is displayed

    ## ページングしてデータが変更されることを確認する / Paging to make sure data is changed
    # 13. ページング前の表示件数が1-20件であることを確認する / Verify that the number of items displayed before paging is 1-20
    Then I wait that element "//div/span[contains(text(), '1-20件')]" is within the viewport
    # 14. 次へアイコンをクリックする / Click the Next icon
    When I click on the button "//button[@aria-label='Go to next page']"
    # 15. ページング後の表示件数が21-40件であることを確認する / Ensure that the number of items displayed after paging is between 21-40.
    Then I wait that element "//div/span[contains(text(), '21-40件')]" is within the viewport
    # 16. 次のページのデータの表示を確認する / Check the data display on the next page.
    Then I expect that element "//tr//td/div[text()='<email_2>']" is displayed
    #     一意となるメールアドレスをキーにデータを確認する / Verify data using unique email addresses as the key.
    Then I expect that element "//tr//td/div[text()='<email_2>']" is displayed
    #     メールアドレスの左側のカラムを確認 / Check the column to the left of the email address
    Then I expect that element "//tr//td/div[text()='<email_2>']/parent::td/preceding-sibling::td[3]/div[text()='<organization_2>']" is displayed
    Then I expect that element "//tr//td/div[text()='<email_2>']/parent::td/preceding-sibling::td[2]/div[text()='<department_2>']" is displayed
    Then I expect that element "//tr//td/div[text()='<email_2>']/parent::td/preceding-sibling::td[1]/div[text()='<fullname_2>']" is displayed
    #     メールアドレスの右側のカラムを確認 / Check the column to the right of the email address
    Then I expect that element "//tr//td/div[text()='<email_2>']/parent::td/following-sibling::td[1]/div[text()='<created_at_2>']" is displayed
    Then I expect that element "//tr//td/div[text()='<email_2>']/parent::td/following-sibling::td[2]/div/a[1]/div[text()='詳細']" is displayed
    Then I expect that element "//tr//td/div[text()='<email_2>']/parent::td/following-sibling::td[2]/div/a[2]/div[text()='修正']" is displayed

    # 17. ページング前のデータが表示されないことを確認する / Ensure that no data is displayed before paging
    Then I expect that element "//tr//td/div[text()='<email>']" is not displayed
    # 18. 戻るアイコンをクリックする / Click the Back icon
    When I click on the button "//button[@aria-label='Go to previous page']"
    # 19. ページング後の表示件数が1-20件であることを確認する / Ensure that the number of displayed items after paging is 1-20
    Then I wait that element "//div/span[contains(text(), '1-20件')]" is within the viewport
    # 20. ページング前のデータが表示されることを確認する / Verify that data is displayed before paging
    Then I expect that element "//tr//td/div[text()='<email>']" is displayed

    # テストデータは一旦仮で記載
    Examples:
    | username  | password | organization | department | fullname      | email                | created_at | organization_2 | department_2 | fullname_2    | email_2                                             | created_at_2 |
    | admin     | P@ssword | Mon          | FE         | hassan shimul | shimulpato@gmail.com | 2023-04-28 | 株式会社共和電業  | 経営管理本部   | 検証 検証      | qa_admin@gmail.com | 2023-05-12   |
    # | reader | P@ssword | Mon          | FE         | hassan shimul | shimulpato@gmail.com | 2023-04-28 |


    # No.2 登録期間以外の条件を入力して検索し、対象データが表示されることを確認し、対象外のデータが表示されないことを確認する
    Scenario: Enter criteria other than the registration period to search and confirm that the target data are displayed and that no data are displayed that are not covered by the search.
    # 1. TOP画面に遷移する / Transition to Top screen
    When I click on the button "//div/a[(text()='トップ')]"
    # 2. TOP画面のタイトル表示を待つ / Wait for screen title of top page is displayed
    Then I wait that element "//p[text()='共和電業']/following-sibling::h1[text()='会員情報管理']" is within the viewport
    # 3. 「会員情報一覧」リンクをクリックする / Click the User Information List Link
    When I click on the button "//div[contains(@class, 'cursor-pointer')][text()='会員情報一覧']"
    # 4. 会員情報管理画面のタイトル表示を待つ / Wait for screen title of top page is displayed
    Then I wait that element "//h1[text()='会員情報管理']/following-sibling::h2[text()='会員登録者検索']" is within the viewport
    # 5. 検索条件を入力する / Input search condition
    When I set "<fullname>" to the inputfield "//input[@id='fullname']"
    When I set "<organization>" to the inputfield "//input[@id='organization']"
    When I set "<email>" to the inputfield "//input[@id='email']"
    When I click on the button "//label[text()='メール配信許諾']/parent::label/following-sibling::div//span[text()='<email_permission>']"
    When I click on the button "//label[text()='認証済みフラグ']/parent::label/following-sibling::div//span[text()='<authorized>']"
    # 6. 「検索」ボタンをクリックする / Click the Search button
    When I click on the button "//button/div[text()='検索']"
    # 7. 検索結果の表示を待つ / Wait for the text of search result is displayed
    Then I wait that element "//p[contains(text(), '検索結果')]" is within the viewport
    # 8. 対象データの表示を確認する / Confirm that the test data is displayed in table.
    #     一意となるメールアドレスをキーにデータを確認する / Verify data using unique email addresses as the key.
    Then I expect that element "//tr//td/div[text()='<email>']" is displayed
    #     メールアドレスの左側のカラムを確認 / Check the column to the left of the email address
    Then I expect that element "//tr//td/div[text()='<email>']/parent::td/preceding-sibling::td[3]/div[text()='<organization>']" is displayed
    Then I expect that element "//tr//td/div[text()='<email>']/parent::td/preceding-sibling::td[2]/div[text()='<department>']" is displayed
    Then I expect that element "//tr//td/div[text()='<email>']/parent::td/preceding-sibling::td[1]/div[text()='<fullname>']" is displayed
    #     メールアドレスの右側のカラムを確認 / Check the column to the right of the email address
    Then I expect that element "//tr//td/div[text()='<email>']/parent::td/following-sibling::td[1]/div[text()='<created_at>']" is displayed
    Then I expect that element "//tr//td/div[text()='<email>']/parent::td/following-sibling::td[2]/div/a[1]/div[text()='詳細']" is displayed
    Then I expect that element "//tr//td/div[text()='<email>']/parent::td/following-sibling::td[2]/div/a[2]/div[text()='修正']" is displayed

    # 9. 条件外のデータの表示を確認する / Check the display of out-of-condition data
    Then I expect that element "//tr//td/div[text()='<email_2>']" is not displayed

    # テストデータは一旦仮で記載
    Examples:
    | username  | password | organization | department | fullname           | email                                               | created_at | email_permission | authorized | email_2                                             |
    | admin     | P@ssword | organization | department | Last FirstName     | qa_admin@gmail.com | 2023-05-12 | 希望する          | 認証済み     | qa_admin1@gmail.com |


    # No.3 検索に合致しない場合に表示されるメッセージを確認する
    Scenario: Check the message displayed when a search does not match

    # 1. TOP画面に遷移する / Transition to Top screen
    When I click on the button "//div/a[(text()='トップ')]"
    # 2. TOP画面のタイトル表示を待つ / Wait for screen title of top page is displayed
    Then I wait that element "//p[text()='共和電業']/following-sibling::h1[text()='会員情報管理']" is within the viewport
    # 3. 「会員情報一覧」リンクをクリックする / Click the User Information List Link
    When I click on the button "//div[contains(@class, 'cursor-pointer')][text()='会員情報一覧']"
    # 4. 会員情報管理画面のタイトル表示を待つ / Wait for screen title of top page is displayed
    Then I wait that element "//h1[text()='会員情報管理']/following-sibling::h2[text()='会員登録者検索']" is within the viewport
    # 5. 検索条件を入力する / Input search condition
    When I set "<email>" to the inputfield "//input[@id='email']"
    # 6. 「検索」ボタンをクリックする / Click the Search button
    When I click on the button "//button/div[text()='検索']"
    # 7. 検索結果が0件の場合のメッセージが表示されることを確認する / Verify that the message is displayed when there are zero search results.
    Then I wait that element "//div[(text()='一致するデータは見つかりませんでした。')]" is within the viewport
    Examples:
    | username  | password | email                                               |
    | admin     | P@ssword | qa_admin@gmail.com |