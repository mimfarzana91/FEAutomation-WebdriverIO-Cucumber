Feature: Show detail and edit User
    # No.1 日本語会員詳細の情報を確認し、編集する。 / Check and edit information in JP Member Details.
    @ja
    Scenario: Check user details information and edit JP user information.
    ### 会員詳細情報の確認 / Check user details information
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
    # 14. 表示データが一致していることを確認する / Verify that the displayed data are consistent.
    Then I expect that element "//div[text()='利用サイト']/following-sibling::div" matches the text "<site>"
    Then I expect that element "//div[text()='お名前（姓名）']/following-sibling::div" matches the text "<lastname> <firstname>"
    Then I expect that element "//div[text()='フリガナ（セイメイ）']/following-sibling::div" matches the text "<lastname_kana> <firstname_kana>"
    Then I expect that element "//div[text()='業種']/following-sibling::div" matches the text "<buisiness>"
    Then I expect that element "//div[text()='会社・学校・研究機関名']/following-sibling::div" matches the text "<organization>"
    Then I expect that element "//div[text()='部署・学部名']/following-sibling::div" matches the text "<department>"
    Then I expect that element "//div[text()='役職']/following-sibling::div" matches the text "<job_title>"
    Then I expect that element "//div[text()='郵便番号']/following-sibling::div" matches the text "<zipcode>"
    Then I expect that element "//div[text()='都道府県']/following-sibling::div" matches the text "<prefecture>"
    Then I expect that element "//div[text()='市区町村']/following-sibling::div" matches the text "<city>"
    Then I expect that element "//div[text()='番地・建物']/following-sibling::div" matches the text "<address>"
    Then I expect that element "//div[text()='電話番号']/following-sibling::div" matches the text "<phonenumber>"
    Then I expect that element "//div[text()='メールアドレス']/following-sibling::div" matches the text "<email>"
    Then I expect that element "//div[text()='メール配信を希望しますか？']/following-sibling::div" matches the text "<is_email_allowed>"
    Then I expect that element "//div[text()='認証済みフラグ']/following-sibling::div" matches the text "<authorized>"
    Then I expect that element "//div[text()='配信可能（メールアドレス）']/following-sibling::div" matches the text "<is_email_sendable>"
    Then I expect that element "//div[text()='備考']/following-sibling::div" matches the text "<note>"
    # 15. 「一覧に戻る」リンクをクリックする / Click on the "Back to List" link.
    When I click on the button "//a[text()='会員情報一覧に戻る']"
    # 16. 会員情報管理画面のタイトル表示を待つ / Wait for screen title of manage user info page is displayed
    Then I wait that element "//h1[text()='会員情報管理']/following-sibling::h2[text()='会員登録者検索']" is within the viewport

    ### ユーザ情報を編集する / Edit user information
    # 17. 検索条件を入力する / Input search condition
    When I set "<email>" to the inputfield "//input[@id='email']"
    # 18. 「検索」ボタンをクリックする / Click the Search button
    When I click on the button "//button/div[text()='検索']"
    # 19. 検索結果の表示を待つ / Wait for the text of search result is displayed
    Then I wait that element "//p[contains(text(), '検索結果')]" is within the viewport
    # 20. 「詳細」ボタンをクリックする / Click the Detail button
    When I click on the button "//tr//td/div[text()='<email>']/parent::td/following-sibling::td[2]/div/a[1]/div[text()='詳細']"
    # 21. 会員詳細画面のタイトル表示を待つ / Wait for the title to be displayed on the member details screen.
    Then I wait that element "//h1[text()='会員登録者情報詳細']" is within the viewport
    # 22. 詳細ボタンをクリックする / Click the Details button
    When I click on the button "//div[text()='修正']"
    # 23. 会員詳細画面のタイトル表示を待つ / Wait for the title to be displayed on the member details screen.
    Then I wait that element "//h1[text()='会員登録者情報修正']" is within the viewport
    When I pause for 3000ms

    # 24. 変更する会員情報を入力する / Enter the membership information to be changed
    When I set "<lastname_update>" to the inputfield "//input[@id='last_name']"
    When I set "<firstname_update>" to the inputfield "//input[@id='first_name']"
    When I set "<lastname_kana_update>" to the inputfield "//input[@id='last_name_kana']"
    When I set "<firstname_kana_update>" to the inputfield "//input[@id='first_name_kana']"
    ## プルダウンの表示にはクリックが必要 / A click is required to display the pull-down menu
    When I click on the button "//label[text()='業種']/parent::div/following-sibling::button"
    When I click on the button "//li/span[text()='<buisiness_update>']"
    When I set "<organization_update>" to the inputfield "//input[@id='organization']"
    When I set "<department_update>" to the inputfield "//input[@id='department']"
    When I set "<job_title_update>" to the inputfield "//input[@id='job_title']"
    When I set "<zipcode_update>" to the inputfield "//input[@id='zip_code']"
    When I click on the button "//div[text()='住所入力']/parent::button"
    When I pause for 3000ms
    When I click on the button "//label[text()='都道府県']/parent::div/following-sibling::div/button"
    When I pause for 3000ms
    Then I expect that element "//li/span[text()='<prefecture_update>']/parent::li[@aria-selected='true']" is displayed
    ## 郵便番号検索による結果については、確認しない / Results from a zip code search will not be checked.
    When I set "<address_update>" to the inputfield "//input[@id='address']"
    When I set "<phonenumber_update>" to the inputfield "//input[@id='phone']"
    When I click on the button "//span[text()='希望する']/parent::div"
    When I click on the button "//span[text()='<is_email_sendable_update>']/parent::div"
    When I set "<note_update>" to the inputfield "//textarea[@id='note']"
    When I click on the button "//div[text()='確認画面に進む']/parent::button"

    ## 25. モーダルの表示される変更後の内容を確認する / Confirm the changes displayed in the modal
    When I pause for 5000ms
    Then I wait that element "//div[text()='利用サイト']/following-sibling::div[text()='<site>']" is within the viewport
    Then I expect that element "//div[text()='お名前（姓名）']/following-sibling::div" matches the text "<lastname_update> <firstname_update>"
    Then I expect that element "//div[text()='フリガナ（セイメイ）']/following-sibling::div" matches the text "<lastname_kana_update> <firstname_kana_update>"
    Then I expect that element "//div[text()='業種']/following-sibling::div" matches the text "<buisiness_update>"
    Then I expect that element "//div[text()='会社・学校・研究機関名']/following-sibling::div" matches the text "<organization_update>"
    Then I expect that element "//div[text()='部署・学部名']/following-sibling::div" matches the text "<department_update>"
    Then I expect that element "//div[text()='役職']/following-sibling::div" matches the text "<job_title_update>"
    Then I expect that element "//div[text()='郵便番号']/following-sibling::div" matches the text "<zipcode_update>"
    Then I expect that element "//div[text()='都道府県']/following-sibling::div" matches the text "<prefecture_update>"
    Then I expect that element "//div[text()='市区町村']/following-sibling::div" matches the text "<city_update>"
    Then I expect that element "//div[text()='番地・建物']/following-sibling::div" matches the text "<address_update>"
    Then I expect that element "//div[text()='電話番号']/following-sibling::div" matches the text "<phonenumber_update>"
    Then I expect that element "//div[text()='メールアドレス']/following-sibling::div" matches the text "<email>"
    Then I expect that element "//div[text()='メール配信を希望しますか？']/following-sibling::div" matches the text "<is_email_allowed_update>"
    Then I expect that element "//div[text()='認証済みフラグ']/following-sibling::div" matches the text "<authorized_update>"
    Then I expect that element "//div[text()='配信可能（メールアドレス）']/following-sibling::div" matches the text "<is_email_sendable_update>"
    Then I expect that element "//div[text()='備考']/following-sibling::div" matches the text "<note_update>"

    # 26. 「保存」ボタンをクリックする / Click the "Save" button.
    When I click on the button "//div[text()='保存']/parent::button"
    # 27. 登録完了のtoastメッセージを確認する / Confirm toast message of registration completion
    Then I wait that element "//div[text()='会員情報が保存されました。']" is within the viewport

    ### 次回のテスト用に元のデータに戻す / Restore original data for next test
    # 28. 検索条件を入力する / Input search condition
    When I set "<email>" to the inputfield "//input[@id='email']"
    # 29. 「検索」ボタンをクリックする / Click the Search button
    When I click on the button "//button/div[text()='検索']"
    # 30. 検索結果の表示を待つ / Wait for the text of search result is displayed
    Then I wait that element "//p[contains(text(), '検索結果')]" is within the viewport
    # 31. 「詳細」ボタンをクリックする / Click the Detail button
    When I click on the button "//tr//td/div[text()='<email>']/parent::td/following-sibling::td[2]/div/a[1]/div[text()='詳細']"
    # 32. 会員詳細画面のタイトル表示を待つ / Wait for the title to be displayed on the member details screen.
    Then I wait that element "//h1[text()='会員登録者情報詳細']" is within the viewport
    # 33. 詳細ボタンをクリックする / Click the Detail button
    When I click on the button "//div[text()='修正']"
    # 34. 会員詳細画面のタイトル表示を待つ / Wait for the title to be displayed on the member details screen.
    Then I wait that element "//h1[text()='会員登録者情報修正']" is within the viewport
    When I pause for 3000ms

    # 35. 変更する会員情報を入力する / Enter the membership information to be changed
    When I set "<lastname>" to the inputfield "//input[@id='last_name']"
    When I set "<firstname>" to the inputfield "//input[@id='first_name']"
    When I set "<lastname_kana>" to the inputfield "//input[@id='last_name_kana']"
    When I set "<firstname_kana>" to the inputfield "//input[@id='first_name_kana']"
    ## プルダウンの表示にはクリックが必要 / A click is required to display the pull-down menu
    When I click on the button "//label[text()='業種']/parent::div/following-sibling::button"
    When I click on the button "//li/span[text()='<buisiness>']"
    When I set "<organization>" to the inputfield "//input[@id='organization']"
    When I set "<department>" to the inputfield "//input[@id='department']"
    When I set "<job_title>" to the inputfield "//input[@id='job_title']"
    When I set "<zipcode>" to the inputfield "//input[@id='zip_code']"
    When I click on the button "//div[text()='住所入力']/parent::button"
    When I pause for 3000ms
    When I click on the button "//label[text()='都道府県']/parent::div/following-sibling::div/button"
    Then I expect that element "//li/span[text()='<prefecture>']/parent::li[@aria-selected='true']" is displayed
    ## 郵便番号検索による結果については、確認しない / Results from a zip code search will not be checked.
    When I set "<address>" to the inputfield "//input[@id='address']"
    When I set "<phonenumber>" to the inputfield "//input[@id='phone']"
    When I click on the button "//span[text()='希望する']/parent::div"
    When I click on the button "//span[text()='<is_email_sendable>']/parent::div"
    When I set "<note>" to the inputfield "//textarea[@id='note']"
    When I click on the button "//div[text()='確認画面に進む']/parent::button"

    ## 36. モーダルの表示される変更後の内容を確認する / Confirm the changes displayed in the modal
    When I pause for 5000ms
    Then I wait that element "//div[text()='利用サイト']/following-sibling::div[text()='<site>']" is within the viewport
    Then I expect that element "//div[text()='お名前（姓名）']/following-sibling::div" matches the text "<lastname> <firstname>"
    Then I expect that element "//div[text()='フリガナ（セイメイ）']/following-sibling::div" matches the text "<lastname_kana> <firstname_kana>"
    Then I expect that element "//div[text()='業種']/following-sibling::div" matches the text "<buisiness>"
    Then I expect that element "//div[text()='会社・学校・研究機関名']/following-sibling::div" matches the text "<organization>"
    Then I expect that element "//div[text()='部署・学部名']/following-sibling::div" matches the text "<department>"
    Then I expect that element "//div[text()='役職']/following-sibling::div" matches the text "<job_title>"
    Then I expect that element "//div[text()='郵便番号']/following-sibling::div" matches the text "<zipcode>"
    Then I expect that element "//div[text()='都道府県']/following-sibling::div" matches the text "<prefecture>"
    Then I expect that element "//div[text()='市区町村']/following-sibling::div" matches the text "<city>"
    Then I expect that element "//div[text()='番地・建物']/following-sibling::div" matches the text "<address>"
    Then I expect that element "//div[text()='電話番号']/following-sibling::div" matches the text "<phonenumber>"
    Then I expect that element "//div[text()='メールアドレス']/following-sibling::div" matches the text "<email>"
    Then I expect that element "//div[text()='メール配信を希望しますか？']/following-sibling::div" matches the text "<is_email_allowed>"
    Then I expect that element "//div[text()='認証済みフラグ']/following-sibling::div" matches the text "<authorized>"
    Then I expect that element "//div[text()='配信可能（メールアドレス）']/following-sibling::div" matches the text "<is_email_sendable>"
    Then I expect that element "//div[text()='備考']/following-sibling::div" matches the text "<note>"
    # 37. 「保存」ボタンをクリックする / Click the "Save" button.
    When I click on the button "//div[text()='保存']/parent::button"
    # 38. 登録完了のtoastメッセージを確認する / Confirm toast message of registration completion
    Then I wait that element "//div[text()='会員情報が保存されました。']" is within the viewport


    Examples:
    |   username   | password   |  email   |  site   |  firstname   |  lastname   |  firstname_kana   |  lastname_kana   |  buisiness   |  organization   |  department   |  job_title   |  zipcode   |  prefecture   |  city   |  address   |  phonenumber   |  is_email_allowed   |  authorized   |  is_email_sendable   |  note   |  firstname_update   |  lastname_update   |  firstname_kana_update   |  lastname_kana_update   |  buisiness_update   |  organization_update   |  department_update   |  job_title_update   |  zipcode_update   |  prefecture_update   |  city_update   |  address_update   |  phonenumber_update   |  is_email_allowed_update   |  authorized_update   |  is_email_sendable_update   |  note_update   | 
    |   admin   | P@ssword   |  auto_ja_001@gmail.com   |  日本（.com）   |  手酢戸   |  自動   |  テスト   |  ジドウ   |  エネルギー   |  株式会社自動テスト   |  総務部   |  課長   | 1500012 |  東京都   |  渋谷区   |  広尾1-1-39 恵比寿プライムスクエアタワー4階   | 0344557243 |  はい   |  認証済み   |  配信可能   |  テスト   |  太郎   |  山田   |  タロウ   |  ヤマダ   |  医療・福祉   |  Autoテスト株式会社   |  営業部   |  部長   | 5300011 |  大阪府   |  大阪市北区   |  大深町４−２０ グランフロント大阪1F   | 663726300 |  はい   |  認証済み   |  配信可能   |  変更   | 



    # No.1 英語会員詳細の情報を確認し、編集する。 / Check and edit information in global(EN) Member Details.
    @en
    Scenario: Check user details information and edit EN user information.
    ### 会員詳細情報の確認 / Check user details information
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
    # 14. 表示データが一致していることを確認する / Verify that the displayed data are consistent.
    Then I expect that element "//div[text()='利用サイト']/following-sibling::div" matches the text "<site>"
    Then I expect that element "//div[text()='お名前（姓名）']/following-sibling::div" matches the text "<lastname> <firstname>"
    Then I expect that element "//div[text()='業種']/following-sibling::div" matches the text "<buisiness>"
    Then I expect that element "//div[text()='会社・学校・研究機関名']/following-sibling::div" matches the text "<organization>"
    Then I expect that element "//div[text()='部署・学部名']/following-sibling::div" matches the text "<department>"
    Then I expect that element "//div[text()='役職']/following-sibling::div" matches the text "<job_title>"
    Then I expect that element "//div[text()='国・地域']/following-sibling::div" matches the text "<country>"
    Then I expect that element "//div[text()='住所（市、区、県）']/following-sibling::div" matches the text "<city>"
    Then I expect that element "//div[text()='住所（建物、街名、室号）']/following-sibling::div" matches the text "<address>"
    Then I expect that element "//div[text()='郵便番号']/following-sibling::div" matches the text "<zipcode>"
    Then I expect that element "//div[text()='電話番号']/following-sibling::div" matches the text "<phonenumber>"
    Then I expect that element "//div[text()='メールアドレス']/following-sibling::div" matches the text "<email>"
    Then I expect that element "//div[text()='メール配信を希望しますか？']/following-sibling::div" matches the text "<is_email_allowed>"
    Then I expect that element "//div[text()='認証済みフラグ']/following-sibling::div" matches the text "<authorized>"
    Then I expect that element "//div[text()='配信可能（メールアドレス）']/following-sibling::div" matches the text "<is_email_sendable>"
    Then I expect that element "//div[text()='備考']/following-sibling::div" matches the text "<note>"
    # 15. 「一覧に戻る」リンクをクリックする / Click on the "Back to List" link.
    When I click on the button "//a[text()='会員情報一覧に戻る']"
    # 16. 会員情報管理画面のタイトル表示を待つ / Wait for screen title of manage user info page is displayed
    Then I wait that element "//h1[text()='会員情報管理']/following-sibling::h2[text()='会員登録者検索']" is within the viewport

    ### ユーザ情報を編集する / Edit user information
    # 17. 検索条件を入力する / Input search condition
    When I set "<email>" to the inputfield "//input[@id='email']"
    # 18. 「検索」ボタンをクリックする / Click the Search button
    When I click on the button "//button/div[text()='検索']"
    # 19. 検索結果の表示を待つ / Wait for the text of search result is displayed
    Then I wait that element "//p[contains(text(), '検索結果')]" is within the viewport
    # 20. 「詳細」ボタンをクリックする / Click the Detail button
    When I click on the button "//tr//td/div[text()='<email>']/parent::td/following-sibling::td[2]/div/a[1]/div[text()='詳細']"
    # 21. 会員詳細画面のタイトル表示を待つ / Wait for the title to be displayed on the member details screen.
    Then I wait that element "//h1[text()='会員登録者情報詳細']" is within the viewport
    # 22. 詳細ボタンをクリックする / Click the Details button
    When I click on the button "//div[text()='修正']"
    # 23. 会員詳細画面のタイトル表示を待つ / Wait for the title to be displayed on the member details screen.
    Then I wait that element "//h1[text()='会員登録者情報修正']" is within the viewport
    When I pause for 3000ms

    When I set "<lastname_update>" to the inputfield "//input[@id='last_name']"
    When I set "<firstname_update>" to the inputfield "//input[@id='first_name']"
    ## プルダウンの表示にはクリックが必要 / A click is required to display the pull-down menu
    When I click on the button "//label[text()='業種']/parent::div/following-sibling::button"
    When I click on the button "//li/span[text()='<buisiness_update>']"
    When I set "<organization_update>" to the inputfield "//input[@id='organization']"
    When I set "<department_update>" to the inputfield "//input[@id='department']"
    When I set "<job_title_update>" to the inputfield "//input[@id='job_title']"
    When I set "<zipcode_update>" to the inputfield "//input[@id='zip_code']"
    When I click on the button "//label[text()='国・地域']/parent::div/following-sibling::button"
    When I pause for 3000ms
    When I click on the button "//li/span[text()='<country_update>']"
    When I set "<address_update>" to the inputfield "//input[@id='address']"
    When I set "<city_update>" to the inputfield "//input[@id='city']"
    When I set "<phonenumber_update>" to the inputfield "//input[@id='phone']"
    When I click on the button "//span[text()='希望する']/parent::div"
    When I click on the button "//span[text()='<is_email_sendable_update>']/parent::div"
    When I set "<note_update>" to the inputfield "//textarea[@id='note']"
    When I click on the button "//div[text()='確認画面に進む']/parent::button"

    ## モーダルの表示を確認する
    When I pause for 5000ms
    Then I wait that element "//div[text()='利用サイト']/following-sibling::div[text()='<site>']" is within the viewport
    ## 25. モーダルの表示される変更後の内容を確認する / Confirm the changes displayed in the modal
    Then I expect that element "//div[text()='お名前（姓名）']/following-sibling::div" matches the text "<lastname_update> <firstname_update>"
    Then I expect that element "//div[text()='業種']/following-sibling::div" matches the text "<buisiness_update>"
    Then I expect that element "//div[text()='会社・学校・研究機関名']/following-sibling::div" matches the text "<organization_update>"
    Then I expect that element "//div[text()='部署・学部名']/following-sibling::div" matches the text "<department_update>"
    Then I expect that element "//div[text()='役職']/following-sibling::div" matches the text "<job_title_update>"
    Then I expect that element "//div[text()='国・地域']/following-sibling::div" matches the text "<country_update>"
    Then I expect that element "//div[text()='住所（建物、街名、室号）']/following-sibling::div" matches the text "<address_update>"
    Then I expect that element "//div[text()='住所（市、区、県）']/following-sibling::div" matches the text "<city_update>"
    Then I expect that element "//div[text()='郵便番号']/following-sibling::div" matches the text "<zipcode_update>"
    Then I expect that element "//div[text()='電話番号']/following-sibling::div" matches the text "<phonenumber_update>"
    Then I expect that element "//div[text()='メールアドレス']/following-sibling::div" matches the text "<email>"
    Then I expect that element "//div[text()='メール配信を希望しますか？']/following-sibling::div" matches the text "<is_email_allowed_update>"
    Then I expect that element "//div[text()='認証済みフラグ']/following-sibling::div" matches the text "<authorized_update>"
    Then I expect that element "//div[text()='配信可能（メールアドレス）']/following-sibling::div" matches the text "<is_email_sendable_update>"
    Then I expect that element "//div[text()='備考']/following-sibling::div" matches the text "<note_update>"

    # 26. 「保存」ボタンをクリックする / Click the "Save" button.
    When I click on the button "//div[text()='保存']/parent::button"
    # 27. 登録完了のtoastメッセージを確認する / Confirm toast message of registration completion
    Then I wait that element "//div[text()='会員情報が保存されました。']" is within the viewport

    ### 次回のテスト用に元のデータに戻す / Restore original data for next test
    # 28. 検索条件を入力する / Input search condition
    When I set "<email>" to the inputfield "//input[@id='email']"
    # 29. 「検索」ボタンをクリックする / Click the Search button
    When I click on the button "//button/div[text()='検索']"
    # 30. 検索結果の表示を待つ / Wait for the text of search result is displayed
    Then I wait that element "//p[contains(text(), '検索結果')]" is within the viewport
    # 31. 「詳細」ボタンをクリックする / Click the Detail button
    When I click on the button "//tr//td/div[text()='<email>']/parent::td/following-sibling::td[2]/div/a[1]/div[text()='詳細']"
    # 32. 会員詳細画面のタイトル表示を待つ / Wait for the title to be displayed on the member details screen.
    Then I wait that element "//h1[text()='会員登録者情報詳細']" is within the viewport
    # 33. 詳細ボタンをクリックする / Click the Detail button
    When I click on the button "//div[text()='修正']"
    # 34. 会員詳細画面のタイトル表示を待つ / Wait for the title to be displayed on the member details screen.
    Then I wait that element "//h1[text()='会員登録者情報修正']" is within the viewport
    When I pause for 3000ms

    # 35. 変更する会員情報を入力する / Enter the membership information to be changed
    When I set "<lastname>" to the inputfield "//input[@id='last_name']"
    When I set "<firstname>" to the inputfield "//input[@id='first_name']"
    ## プルダウンの表示にはクリックが必要 / A click is required to display the pull-down menu
    When I click on the button "//label[text()='業種']/parent::div/following-sibling::button"
    When I click on the button "//li/span[text()='<buisiness>']"
    When I set "<organization>" to the inputfield "//input[@id='organization']"
    When I set "<department>" to the inputfield "//input[@id='department']"
    When I set "<job_title>" to the inputfield "//input[@id='job_title']"
    When I set "<zipcode>" to the inputfield "//input[@id='zip_code']"
    When I click on the button "//label[text()='国・地域']/parent::div/following-sibling::button"
    When I pause for 3000ms
    When I click on the button "//li/span[text()='<country>']"
    When I set "<address>" to the inputfield "//input[@id='address']"
    When I set "<city>" to the inputfield "//input[@id='city']"
    When I set "<phonenumber>" to the inputfield "//input[@id='phone']"
    When I click on the button "//span[text()='希望する']/parent::div"
    When I click on the button "//span[text()='<is_email_sendable>']/parent::div"
    When I set "<note>" to the inputfield "//textarea[@id='note']"
    When I click on the button "//div[text()='確認画面に進む']/parent::button"

    ## 36. モーダルの表示される変更後の内容を確認する / Confirm the changes displayed in the modal
    When I pause for 5000ms
    Then I wait that element "//div[text()='利用サイト']/following-sibling::div[text()='<site>']" is within the viewport
    Then I expect that element "//div[text()='お名前（姓名）']/following-sibling::div" matches the text "<lastname> <firstname>"
    Then I expect that element "//div[text()='業種']/following-sibling::div" matches the text "<buisiness>"
    Then I expect that element "//div[text()='会社・学校・研究機関名']/following-sibling::div" matches the text "<organization>"
    Then I expect that element "//div[text()='部署・学部名']/following-sibling::div" matches the text "<department>"
    Then I expect that element "//div[text()='役職']/following-sibling::div" matches the text "<job_title>"
    Then I expect that element "//div[text()='国・地域']/following-sibling::div" matches the text "<country>"
    Then I expect that element "//div[text()='住所（建物、街名、室号）']/following-sibling::div" matches the text "<address>"
    Then I expect that element "//div[text()='住所（市、区、県）']/following-sibling::div" matches the text "<city>"
    Then I expect that element "//div[text()='郵便番号']/following-sibling::div" matches the text "<zipcode>"
    Then I expect that element "//div[text()='電話番号']/following-sibling::div" matches the text "<phonenumber>"
    Then I expect that element "//div[text()='メールアドレス']/following-sibling::div" matches the text "<email>"
    Then I expect that element "//div[text()='メール配信を希望しますか？']/following-sibling::div" matches the text "<is_email_allowed>"
    Then I expect that element "//div[text()='認証済みフラグ']/following-sibling::div" matches the text "<authorized>"
    Then I expect that element "//div[text()='配信可能（メールアドレス）']/following-sibling::div" matches the text "<is_email_sendable>"
    Then I expect that element "//div[text()='備考']/following-sibling::div" matches the text "<note>"

    # 37. 「保存」ボタンをクリックする / Click the "Save" button.
    When I click on the button "//div[text()='保存']/parent::button"
    # 38. 登録完了のtoastメッセージを確認する / Confirm toast message of registration completion
    Then I wait that element "//div[text()='会員情報が保存されました。']" is within the viewport


    Examples:
    |  username   | password  |  email                                              |  site         |  firstname  |  lastname   |  buisiness  |  organization     |  department  |  job_title  |  country  |  city  |  address                                 |  zipcode  |  phonenumber  |  is_email_allowed  |  authorized  |  is_email_sendable  |  note   |  firstname_update  |  lastname_update   |  buisiness_update  |  organization_update     |  department_update  |  job_title_update  |  country_update  |  city_update  |  address_update                                 |  zipcode_update  |  phonenumber_update  |  is_email_allowed_update  |  authorized_update  |  is_email_sendable_update  |  note_update  | 
    |  admin   | P@ssword  |  auto_en_001@gmail.com  |  グローバル（en）  |  Test       |  Jidou       |  鉄道・輸送   |  ml.Inc  |  Sales       |  Manager        |  アメリカ       |  New York  |  Times Square,1560 Broadway Suite 1001  | 1003600 | 1888634822 |  はい               |  認証済み     |  配信可能             | test | Auto | Mation |  医療・福祉   |  Auto.Inc  | Develop | CEO | イギリス | London |  London Bridge,1560 Baker Street 1001  | 3601200 | 663726300 |  はい               |  認証済み     |  配信可能             | test update | 


    # No.1 中国語会員詳細の情報を確認し、編集する。 / Check and edit information in ZH Member Details.
    @zh
    Scenario: Check user details information and edit ZH user information.
    ### 会員詳細情報の確認 / Check user details information
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
    # 14. 表示データが一致していることを確認する / Verify that the displayed data are consistent.
    Then I expect that element "//div[text()='利用サイト']/following-sibling::div" matches the text "<site>"
    Then I expect that element "//div[text()='お名前（姓名）']/following-sibling::div" matches the text "<lastname> <firstname>"
    Then I expect that element "//div[text()='業種']/following-sibling::div" matches the text "<buisiness>"
    Then I expect that element "//div[text()='会社・学校・研究機関名']/following-sibling::div" matches the text "<organization>"
    Then I expect that element "//div[text()='部署・学部名']/following-sibling::div" matches the text "<department>"
    Then I expect that element "//div[text()='役職']/following-sibling::div" matches the text "<job_title>"
    Then I expect that element "//div[text()='郵便番号']/following-sibling::div" matches the text "<zipcode>"
    Then I expect that element "//div[text()='住所（市、区、県）']/following-sibling::div" matches the text "<city>"
    Then I expect that element "//div[text()='住所（建物、街名、室号）']/following-sibling::div" matches the text "<address>"
    Then I expect that element "//div[text()='電話番号']/following-sibling::div" matches the text "<phonenumber>"
    Then I expect that element "//div[text()='メールアドレス']/following-sibling::div" matches the text "<email>"
    Then I expect that element "//div[text()='メール配信を希望しますか？']/following-sibling::div" matches the text "<is_email_allowed>"
    Then I expect that element "//div[text()='認証済みフラグ']/following-sibling::div" matches the text "<authorized>"
    Then I expect that element "//div[text()='配信可能（メールアドレス）']/following-sibling::div" matches the text "<is_email_sendable>"
    Then I expect that element "//div[text()='備考']/following-sibling::div" matches the text "<note>"
    # 15. 「一覧に戻る」リンクをクリックする / Click on the "Back to List" link.
    When I click on the button "//a[text()='会員情報一覧に戻る']"
    # 16. 会員情報管理画面のタイトル表示を待つ / Wait for screen title of manage user info page is displayed
    Then I wait that element "//h1[text()='会員情報管理']/following-sibling::h2[text()='会員登録者検索']" is within the viewport

    ### ユーザ情報を編集する / Edit user information
    # 17. 検索条件を入力する / Input search condition
    When I set "<email>" to the inputfield "//input[@id='email']"
    # 18. 「検索」ボタンをクリックする / Click the Search button
    When I click on the button "//button/div[text()='検索']"
    # 19. 検索結果の表示を待つ / Wait for the text of search result is displayed
    Then I wait that element "//p[contains(text(), '検索結果')]" is within the viewport
    # 20. 「詳細」ボタンをクリックする / Click the Detail button
    When I click on the button "//tr//td/div[text()='<email>']/parent::td/following-sibling::td[2]/div/a[1]/div[text()='詳細']"
    # 21. 会員詳細画面のタイトル表示を待つ / Wait for the title to be displayed on the member details screen.
    Then I wait that element "//h1[text()='会員登録者情報詳細']" is within the viewport
    # 22. 詳細ボタンをクリックする / Click the Details button
    When I click on the button "//div[text()='修正']"
    # 23. 会員詳細画面のタイトル表示を待つ / Wait for the title to be displayed on the member details screen.
    Then I wait that element "//h1[text()='会員登録者情報修正']" is within the viewport
    When I pause for 3000ms

    # 24. 変更する会員情報を入力する / Enter the membership information to be changed
    When I set "<lastname_update>" to the inputfield "//input[@id='last_name']"
    When I set "<firstname_update>" to the inputfield "//input[@id='first_name']"
    ## プルダウンの表示にはクリックが必要 / A click is required to display the pull-down menu
    When I click on the button "//label[text()='業種']/parent::div/following-sibling::button"
    When I click on the button "//li/span[text()='<buisiness_update>']"
    When I set "<organization_update>" to the inputfield "//input[@id='organization']"
    When I set "<department_update>" to the inputfield "//input[@id='department']"
    When I set "<job_title_update>" to the inputfield "//input[@id='job_title']"
    When I set "<zipcode_update>" to the inputfield "//input[@id='zip_code']"
    When I set "<city_update>" to the inputfield "//input[@id='city']"
    When I set "<address_update>" to the inputfield "//input[@id='address']"
    When I set "<phonenumber_update>" to the inputfield "//input[@id='phone']"
    When I click on the button "//span[text()='希望する']/parent::div"
    When I click on the button "//span[text()='<is_email_sendable_update>']/parent::div"
    When I set "<note_update>" to the inputfield "//textarea[@id='note']"
    When I click on the button "//div[text()='確認画面に進む']/parent::button"

    ## 25. モーダルの表示される変更後の内容を確認する / Confirm the changes displayed in the modal
    When I pause for 5000ms
    Then I wait that element "//div[text()='利用サイト']/following-sibling::div[text()='<site>']" is within the viewport
    Then I expect that element "//div[text()='お名前（姓名）']/following-sibling::div" matches the text "<lastname_update> <firstname_update>"
    Then I expect that element "//div[text()='業種']/following-sibling::div" matches the text "<buisiness_update>"
    Then I expect that element "//div[text()='会社・学校・研究機関名']/following-sibling::div" matches the text "<organization_update>"
    Then I expect that element "//div[text()='部署・学部名']/following-sibling::div" matches the text "<department_update>"
    Then I expect that element "//div[text()='役職']/following-sibling::div" matches the text "<job_title_update>"
    Then I expect that element "//div[text()='郵便番号']/following-sibling::div" matches the text "<zipcode_update>"
    Then I expect that element "//div[text()='住所（市、区、県）']/following-sibling::div" matches the text "<city_update>"
    Then I expect that element "//div[text()='住所（建物、街名、室号）']/following-sibling::div" matches the text "<address_update>"
    Then I expect that element "//div[text()='電話番号']/following-sibling::div" matches the text "<phonenumber_update>"
    Then I expect that element "//div[text()='メールアドレス']/following-sibling::div" matches the text "<email>"
    Then I expect that element "//div[text()='メール配信を希望しますか？']/following-sibling::div" matches the text "<is_email_allowed_update>"
    Then I expect that element "//div[text()='認証済みフラグ']/following-sibling::div" matches the text "<authorized_update>"
    Then I expect that element "//div[text()='配信可能（メールアドレス）']/following-sibling::div" matches the text "<is_email_sendable_update>"
    Then I expect that element "//div[text()='備考']/following-sibling::div" matches the text "<note_update>"

    # 26. 「保存」ボタンをクリックする / Click the "Save" button.
    When I click on the button "//div[text()='保存']/parent::button"
    # 27. 登録完了のtoastメッセージを確認する / Confirm toast message of registration completion
    Then I wait that element "//div[text()='会員情報が保存されました。']" is within the viewport

    ### 次回のテスト用に元のデータに戻す / Restore original data for next test
    # 28. 検索条件を入力する / Input search condition
    When I set "<email>" to the inputfield "//input[@id='email']"
    # 29. 「検索」ボタンをクリックする / Click the Search button
    When I click on the button "//button/div[text()='検索']"
    # 30. 検索結果の表示を待つ / Wait for the text of search result is displayed
    Then I wait that element "//p[contains(text(), '検索結果')]" is within the viewport
    # 31. 「詳細」ボタンをクリックする / Click the Detail button
    When I click on the button "//tr//td/div[text()='<email>']/parent::td/following-sibling::td[2]/div/a[1]/div[text()='詳細']"
    # 32. 会員詳細画面のタイトル表示を待つ / Wait for the title to be displayed on the member details screen.
    Then I wait that element "//h1[text()='会員登録者情報詳細']" is within the viewport
    # 33. 詳細ボタンをクリックする
    When I click on the button "//div[text()='修正']"
    # 34. 会員詳細画面のタイトル表示を待つ / Wait for the title to be displayed on the member details screen.
    Then I wait that element "//h1[text()='会員登録者情報修正']" is within the viewport
    When I pause for 3000ms

    # 35. 変更する会員情報を入力する / Enter the membership information to be changed
    When I set "<lastname>" to the inputfield "//input[@id='last_name']"
    When I set "<firstname>" to the inputfield "//input[@id='first_name']"
    ## プルダウンの表示にはクリックが必要 / A click is required to display the pull-down menu
    When I click on the button "//label[text()='業種']/parent::div/following-sibling::button"
    When I click on the button "//li/span[text()='<buisiness>']"
    When I set "<organization>" to the inputfield "//input[@id='organization']"
    When I set "<department>" to the inputfield "//input[@id='department']"
    When I set "<job_title>" to the inputfield "//input[@id='job_title']"
    When I set "<zipcode>" to the inputfield "//input[@id='zip_code']"
    When I set "<city>" to the inputfield "//input[@id='city']"
    When I set "<address>" to the inputfield "//input[@id='address']"
    When I set "<phonenumber>" to the inputfield "//input[@id='phone']"
    When I click on the button "//span[text()='希望する']/parent::div"
    When I click on the button "//span[text()='<is_email_sendable>']/parent::div"
    When I set "<note>" to the inputfield "//textarea[@id='note']"
    When I click on the button "//div[text()='確認画面に進む']/parent::button"

    ## 36. モーダルの表示される変更後の内容を確認する / Confirm the changes displayed in the modal
    When I pause for 5000ms
    Then I wait that element "//div[text()='利用サイト']/following-sibling::div[text()='<site>']" is within the viewport
    Then I expect that element "//div[text()='お名前（姓名）']/following-sibling::div" matches the text "<lastname> <firstname>"
    Then I expect that element "//div[text()='業種']/following-sibling::div" matches the text "<buisiness>"
    Then I expect that element "//div[text()='会社・学校・研究機関名']/following-sibling::div" matches the text "<organization>"
    Then I expect that element "//div[text()='部署・学部名']/following-sibling::div" matches the text "<department>"
    Then I expect that element "//div[text()='役職']/following-sibling::div" matches the text "<job_title>"
    Then I expect that element "//div[text()='郵便番号']/following-sibling::div" matches the text "<zipcode>"
    Then I expect that element "//div[text()='住所（市、区、県）']/following-sibling::div" matches the text "<city>"
    Then I expect that element "//div[text()='住所（建物、街名、室号）']/following-sibling::div" matches the text "<address>"
    Then I expect that element "//div[text()='電話番号']/following-sibling::div" matches the text "<phonenumber>"
    Then I expect that element "//div[text()='メールアドレス']/following-sibling::div" matches the text "<email>"
    Then I expect that element "//div[text()='メール配信を希望しますか？']/following-sibling::div" matches the text "<is_email_allowed>"
    Then I expect that element "//div[text()='認証済みフラグ']/following-sibling::div" matches the text "<authorized>"
    Then I expect that element "//div[text()='配信可能（メールアドレス）']/following-sibling::div" matches the text "<is_email_sendable>"
    Then I expect that element "//div[text()='備考']/following-sibling::div" matches the text "<note>"
    # 37. 「保存」ボタンをクリックする / Click the "Save" button.
    When I click on the button "//div[text()='保存']/parent::button"
    # 38. 登録完了のtoastメッセージを確認する / Confirm toast message of registration completion
    Then I wait that element "//div[text()='会員情報が保存されました。']" is within the viewport


    Examples:
    |  username   | password  |  email                                              |  site         |  firstname  |  lastname   |  buisiness  |  organization     |  department  |  job_title  |  city  |  address                                 |  zipcode  |  phonenumber  |  is_email_allowed  |  authorized  |  is_email_sendable  |  note   |  firstname_update  |  lastname_update   |  buisiness_update  |  organization_update     |  department_update  |  job_title_update  |  city_update  |  address_update                                 |  zipcode_update  |  phonenumber_update  |  is_email_allowed_update  |  authorized_update  |  is_email_sendable_update  |  note_update  | 
    |  admin   | P@ssword  | auto_zh_001@gmail.com | 中国（zh） | 手酢戸中文 | 自動中文 | 医療・福祉 | 株式会社ML | 销售部 | 社团负责人 | 朝陽区 | 亮馬橋東街1号 | 1006000 | 0853190000 |  はい               |  認証済み     |  配信可能             | test | 中文手酢戸 | 中文自動 | エネルギー | ML株式会社 | 部销售 | 负责人社团 | 朝陽区 | 亮馬橋東街2号 | 1007000 | 0743190000 |  はい               |  認証済み     |  配信可能             | test | 