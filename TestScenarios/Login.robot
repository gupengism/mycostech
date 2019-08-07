*** Settings ***
Library     Selenium2Library
Library     DebugLibrary
Resource	../Resources/Keywords/login_page.txt
Resource    ../TestData/regression_testdata.txt
Test Setup      Open application    ${BROWSER}    ${URL}
Test Teardown   Close All Browsers

*** Test Cases ***
Login should success with valid username and valid password
    [Tags]  Regression    Login
    Click on 'Login' link
    Input username      ${USERNAME_VALID}
    Input password      ${PASSWORD_VALID}
    Click on 'Login' button
    Verify user login success with say 'Hello <logged in username>'    ${USERNAME_VALID}

Login should not success with valid username and wrong password
    [Tags]  Regression    Login
    Click on 'Login' link
    Input username      ${USERNAME_VALID}
    Input password      ${PASSWORD_INVALID}
    Click on 'Login' button
    Verify message alert 'UserName or password is not correct' is display

User can logout by click on 'Logout' button on navigation bar
    [Tags]  Regression    Login    Logout
    Click on 'Login' link
    Input username      ${USERNAME_VALID}
    Input password      ${PASSWORD_VALID}
    Click on 'Login' button
    Verify user login success with say 'Hello <logged in username>'    ${USERNAME_VALID}
    Click on 'Logout' button
    Verify user logout success by navigation bar show 'Login' link