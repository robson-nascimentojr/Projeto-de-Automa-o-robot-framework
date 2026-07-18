*** Settings ***

Resource    ../resources/PageObjects/cadastro.page.robot

*** Test Cases ***
Webapp deve estar online
    Start session
    Get Title   equal    Mark85 by QAx