Feature: Test
    Scenario: Check email for account information change confirmation.
        Then I expect that the confirmation email contains that changed account info mailID: "<mailID>", loginID: "<loginID>", name: "<name>", email: "<email>", password: "<password>" 
        Examples:
          | mailID    | loginID | name    | email                                        | password |
          | MID003    | XXX000  | ******  | ml-kyowa_qa_admin@monstar-lab.com            | 92#Zwx5s |
          | MID004    | XXX000  | ******  | ml-kyowa_qa_sales@monstar-lab.com            | 92#Zwx5s |
          | MID005    | XXX000  | ******  | ml-kyowa_qa_distributor+d01@monstar-lab.com  | 92#Zwx5s |
          | MID006    | XXX000  | *****  | ml-kyowa_qa_distributor+g01@monstar-lab.com  | 92#Zwx5s |