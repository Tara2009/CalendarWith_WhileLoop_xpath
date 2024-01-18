# before running this suite.

*** Settings ***
Resource                 ../CalenResources/pncommon.robot
Library                  DateTime
Library                  String
Library                  QWeb
Library                  QForce
Suite Setup              Setup Browser
Suite Teardown           End suite

*** Variables ***
${for30Day}=             16
${for31Day}=             20
${setMonth}=             January
${DropMonth}=            Apr
${DropYear}=             2015


*** Test Cases ***
Current To Next Month display Calendar Format Xpath
    [Tags]               commitmentNext
    [Documentation]      Display current Month. System will click Next month button and select the date.
    Appstate             Home
    ClickText            Do not consent
    Log                  ${for30Day}
    ClickText            //table[@id\='datepickers']//input[@id\='first_date_picker']                        # click datepicker text box and populate the calender
    ${calheadermon}=     GetText                     //div[@class\='ui-datepicker-title']//span[@class\='ui-datepicker-month']
    ${calheaderyear}=    GetText                     //div[@class\='ui-datepicker-title']//span[@class\='ui-datepicker-year']
    ${calhdrmonyr}=      Set Variable                ${calheadermon} ${calheaderyear}                        # &nbsp;$
    #${calhdrmonyr}=     Set Variable                //div[@class\='ui-datepicker-title']//span[@class\='ui-datepicker-month'] //div[@class\='ui-datepicker-title']//span[@class\='ui-datepicker-year']
    Log                  ${calhdrmonyr}
    WHILE                '${calhdrmonyr}'!='March 2025'
        Log              ${calhdrmonyr}
        ClickText        //table[@class\='ui-datepicker-calendar']//a[text()\='${for30Day}']
        ClickText        //table[@id\='datepickers']//input[@id\='first_date_picker']
        ClickText        //a[@class\='ui-datepicker-next ui-corner-all']//span[@class\='ui-icon ui-icon-circle-triangle-e']
        ${calheadermon}=                             GetText                     //div[@class\='ui-datepicker-title']//span[@class\='ui-datepicker-month']
        ${calheaderyear}=                            GetText                     //div[@class\='ui-datepicker-title']//span[@class\='ui-datepicker-year']
        ${calhdrmonyr}=                              Set Variable                ${calheadermon} ${calheaderyear}
        Log              ${calhdrmonyr}
    END
    ClickText            //table[@class\='ui-datepicker-calendar']//a[text()\='${for30Day}']                 # select the date from the table
    Sleep                3s
    ${selectedMon}=      GetInputValue               //input[@id\='first_date_picker']                       # After selected the date , fetch the selected date from input field
    Sleep                3s
    Log                  'Only Enable Calender Value : ' ${selectedMon}
    #Sleep               3s
Current To Previous Month display Calendar Format Xpath
    [Tags]               commitmentprevious
    [Documentation]      Display current Month. System will click previous month button and select the date.
    Appstate             Home
    Log                  ${for30Day}
    ClickText            //table[@id\='datepickers']//input[@id\='first_date_picker']                        # click datepicker text box and populate the calender
    ${calheadermon}=     GetText                     //div[@class\='ui-datepicker-title']//span[@class\='ui-datepicker-month']
    ${calheaderyear}=    GetText                     //div[@class\='ui-datepicker-title']//span[@class\='ui-datepicker-year']
    ${calhdrmonyr}=      Set Variable                ${calheadermon} ${calheaderyear}                        # &nbsp;$
    #${calhdrmonyr}=     Set Variable                //div[@class\='ui-datepicker-title']//span[@class\='ui-datepicker-month'] //div[@class\='ui-datepicker-title']//span[@class\='ui-datepicker-year']
    Log                  ${calhdrmonyr}
    WHILE                '${calhdrmonyr}'!='March 2021'
        Log              ${calhdrmonyr}
        ClickText        //table[@class\='ui-datepicker-calendar']//a[text()\='${for30Day}']
        ClickText        //table[@id\='datepickers']//input[@id\='first_date_picker']
        ClickText        //a[@class\='ui-datepicker-prev ui-corner-all']//span[@class\='ui-icon ui-icon-circle-triangle-w']
        ${calheadermon}=                             GetText                     //div[@class\='ui-datepicker-title']//span[@class\='ui-datepicker-month']
        ${calheaderyear}=                            GetText                     //div[@class\='ui-datepicker-title']//span[@class\='ui-datepicker-year']
        ${calhdrmonyr}=                              Set Variable                ${calheadermon} ${calheaderyear}
        Log              ${calhdrmonyr}
    END
    ClickText            //table[@class\='ui-datepicker-calendar']//a[text()\='${for30Day}']                 # select the date from the table
    Sleep                3s
    ${selectedMon}=      GetInputValue               //input[@id\='first_date_picker']                       # After selected the date , fetch the selected date from input field
    Sleep                3s
    Log                  'Only Enable Calender Value : ' ${selectedMon}

