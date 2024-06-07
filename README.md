
# Preconditions
- Node LTS
- chormedriver installed

# Directory Structure
```
ErrorHandling.js                   # script for slack notification when errors occur in GithubActions
package.json                       # specify module setting
report.hook.js                     # script for reporter 
tsconfig.json                      # specify script language setting
wdio-github.conf.ts                # config for test run in Github Actions
wdio-init.conf.ts                  # config for test preperation
wdio-local.conf.ts                 # config for test run in local
└── src
    ├── apis
    │   └── gmail                  # scripts for use Gmail
    ├── features                   # directory for testcases
    ├── steps
    │   ├── given.ts               # Steps to operate the browser
    │   ├── then.ts                # Steps to operate the browser
    │   └── when.ts                # Steps to operate the browser
    └── support
        ├── action                 # function for steps
        ├── check                  # function for steps
        ├── lib                    # function for steps
        └── hook.ts                # function for steps
```



# How to create testcase
Over 150 predefined steps that cover almost everything you need, you can start writing testcases right away.

1. Move to` ./src/feature`
2. Create a new file
3. Save as `*.feature`
4. Copy the steps described in the test case from the `./src/steps/*` folder and paste them into the feature file
5. Change choices(ex.`url|site`, `add|set`) and regular expressions(ex.`css selector`, `xpath`)

## Sample Testcase
A sample test case based on the above flow is described.

Testcase in spreadsheet
```
1. Go to the Login Screen
2. Input correct user ID
3. Input correnct password
4. Click Login button
5. Confirm transition to Top screen
```
> 4. Copy the steps described in the test case from the `./src/steps/*` folder and paste them into the feature file
```gherkin
Scenario: Log in with correct account information
    # 1. Go to the Login Screen
    I open the (url|site) "([^"]*)?" with devtools$/
    # 2. Input correct user ID
    I (add|set) "([^"]*)?" to the inputfield "([^"]*)?"$/
    # 3. Input correnct password
    I (add|set) "([^"]*)?" to the inputfield "([^"]*)?"$/
    # 4. Click Login button
    And I (click|doubleclick) on the (link|button|element) "([^"]*)?"$/
    # 5. Confirm transition to Top screen
    I expect that the title is( not)* "([^"]*)?"$/
```
> 5. Change choices(ex.`url|site`, `add|set`) and regular expressions(ex.`css selector`, `xpath`)
```gherkin
Scenario: Log in with correct account information
    # 1. Go to the Login Screen
    Given I open the url "https://system.com/login"
    # 2. Input correct user ID
    When I set "correct_userID" to the inputfield "#user_id"
    # 3. Input correnct password
    When I set "correct_password" to the inputfield "#password"
    # 4. Click Login button
    And I click on the button "#login"
    # 5. Confirm transition to Top screen
    Then I expect that the title is "TOP"
```

# How to run testcase
test preperation
```
npm install
npx wdio run wdio-init.conf.ts --spec createAccountInfo.feature
```
run all testcases in local
```
npx wdio run wdio-local.conf.ts
```
run the specified testcase in local
```
npx wdio run wdio-local.conf.ts --spec xxx.feature
```