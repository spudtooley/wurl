*** Settings ***
Library  SeleniumLibrary
Library  Dialogs

Suite Setup  Setup The Test Case
Suite Teardown  Tear Down The Test Case

*** Variables ***
${google_search_box}         name:q
${im_feeling_lucky}          id:gbqfbb
${request_a_demo}            link:Request a Demo
${demo_firstname}            id:field_qh4icy3
${demo_lastname}             id:field_ocfup13
${demo_email}                id:field_29yf4d3
${demo_subject}              id:field_e6lis63
${demo_message}              id:field_e6lis63
${demo_submit}               class:frm_final_submit
${menu_solutions}            link:Solutions
${solutions_video_services}  xpath:/html/body/section/header/div/div/div/nav/ul/li[1]/div/div/div[2]/div/h4/a
${expand_channel_lineups}    link:Expand Channel Lineups
${optimize_ad_revenue}       link:Optimize Ad Revenue

*** Keywords ***
Setup The Test Case

    [Documentation]  Suite Setup:
    ...              i. Open a web browser to www.google.com
    ...              ii. Enter the word "wurl" in the search box
    ...              iii. Click "I'm Feeling Lucky"

    Open Browser   https://www.google.com  Chrome
    Input Text     ${google_search_box}    wurl
    Press Keys     ${google_search_box}    TAB
    Click Element  ${im_feeling_lucky}

Tear Down The Test Case

    # close the browser
    Close Browser

*** Test Cases ***

Verify Homepage

    [Documentation]  Verify that you are now on the wurl.com homepage and the page title is "Home | Wurl"

    ${title} =  Get Title
    should be equal  ${title}  Home | Wurl

    ${location} =  Get Location
    should be equal  ${location}  https://www.wurl.com/

Verify Request A Demo

    [Documentation]  Click on the "Request a Demo" button. Verify that there are the following
    ...              fields: First Name, Last Name, Email, Subject, Message. Verify there is
    ...              an input field that corresponds with the "Submit" button on the bottom.
    ...              Take a screenshot for verification.

    Click Element   ${request_a_demo}

    Element Should Be Visible  ${demo_firstname}
    Element Should Be Visible  ${demo_lastname}
    Element Should Be Visible  ${demo_email}
    Element Should Be Visible  ${demo_subject}
    Element Should Be Visible  ${demo_message}
    Element Should Be Visible  ${demo_submit}

    Capture Page Screenshot

Verify Solutions

    [Documentation]  Click the Solutions dropdown on the top left. Click on Solutions for
    ...              Video Services and verify that you have two links: Expand Channel
    ...              Lineups and Optimize Ad Revenue, verify that the links are correct (you
    ...              can assume that what they are l inked to currently is correct).

    Click Element  ${menu_solutions}
    Click Element  ${solutions_video_services}
    Element Should Be Visible  ${expand_channel_lineups}
    Element Should Be Visible  ${optimize_ad_revenue}

Verify Optimize Ad Revenu

    [Documentation]  Click on the Optimize Ad Revenue button.  Verify that the name of the
    ...              page you are on is Optimize Ad Revenue | Wurl.

    Click Element  ${optimize_ad_revenue}
    ${title} =  Get Title
    Should Be Equal  ${title}  Optimize Ad Revenue | Wurl

Verify Element Class Attribute

    [Documentation]  Verify that the html class of the following elements is fl-heading-text :
    ...              1. Maximize Monetization with AdSpring
    ...              2. AdSpring Benefits for Video Services
    ...              3. At Your Service: Our World-Class Operations and Monetization Team

    ${attr} =  Get Element Attribute  xpath://*[text()='Maximize Monetization with AdSpring']  class
    Should Be Equal  ${attr}  fl-heading-text

    ${attr} =  Get Element Attribute  xpath://*[text()='AdSpring Benefits for Video Services']  class
    Should Be Equal  ${attr}  fl-heading-text

    ${attr} =  Get Element Attribute  xpath://*[text()='At Your Service: Our World-Class Operations and Monetization Team']  class
    Should Be Equal  ${attr}  fl-heading-text

Verify Bold Elements

    [Documentation]  Verify that each of the elements in bold (Plug-and-Play Convenience,
    ...              Optimize Revenue, etc) are present AND children of the correct element
    ...              from test v.

    Element Should Be Visible  xpath://*[text()='Plug-and-Play Convenience']
    Element Should Be Visible  xpath://*[text()='Automatic Ad Insertion']
    Element Should Be Visible  xpath://*[text()='Optimize Revenue']
    Element Should Be Visible  xpath://*[text()='Increase Scale and Reach']
    Element Should Be Visible  xpath://*[text()='Make it Personal']
    Element Should Be Visible  xpath://*[text()='Surpass KPIs']
    Element Should Be Visible  xpath://*[text()='Ensure TV Quality']