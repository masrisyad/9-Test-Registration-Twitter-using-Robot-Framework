*** Settings ***
Library           Selenium2Library
Library           OperatingSystem 
*** Keywords ***
Set Environment Variable   webdriver.gecko.driver  geckodriver.exe
*** Variables ***
#Your Browser
${Browser}        Firefox
#Testing URL
${SiteUrl}        https://twitter.com/signup
#Registration Data
${FullName}       Saya Bot 1 
${Email}          test_developericad1@yahoo.com
${Password}       !q@w1e1r1t 
#Time Delay
${Delay}          5s  
*** Keywords *** 
#Feel free for add any Keywords here
Open page
    open browser    ${SiteUrl}      ${browser}     
    Maximize Browser Window
fill registration form  
    Input Text       id=full-name   ${FullName}
    Input Text       id=email       ${Email}
    Input Text       id=password    ${Password}
Check tailor twitter checkbox and submit registration
    Sleep   ${Delay}
    ${input_value}      Get Value      xpath=//input[@name='user[use_cookie_personalization]']
    Run Keyword If      '${input_value}' == '1'     submit register  
    [Teardown]    Close Browser
submit register
    Click Element  xpath=//input[@id='submit_button']
*** Test Cases ***
#Focus in Test case 
Twitter Registration Flow 
    Open Page   
    fill registration form
    Check tailor twitter checkbox and submit registration
