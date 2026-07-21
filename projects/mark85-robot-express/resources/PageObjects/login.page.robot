*** Settings ***

Library   Browser
Library   ../libs/database.py

*** Variables ***

${name}            Robson Junior
${email}           Jrobinho211@gmail.com
${password}        pw1234

*** Keywords ***


Dado que eu ja tenha efetuado o cadastro

    New Browser   browser=chromium    headless=False
    New Page    http://localhost:3000
    Go To    http://localhost:3000/signup

    Wait For Elements State    css=h1    visible    5
    Get Text                  css=h1    equal    Faça seu cadastro

    Fill Text    id=name    ${name}
    Fill Text    id=email    ${email}
    Fill Text    id=password  ${password}


    Click    id=buttonSignup

    Wait For Elements State    css=.notice p    visible    5
    Get Text                  css=.notice p     equal      Boas vindas ao Mark85, o seu gerenciador de tarefas.

Dado que eu esteja Na página de login
    New Browser    browser=chromium    headless=False
    New Page  http://localhost:3000
    Go To   http://localhost:3000


E que volte para tela de login
    click    .sc-fznKkj a

E devo ver o um titulo Faça seu login
    Wait For Elements State   css=.sc-fzoLsD h1  visible    2
    Get Text                   css=.sc-fzoLsD h1    equal   Faça seu login

Quando preencho os campos obrigatórios
    Fill Text    id=email    ${email}
    Fill Text    id=password    ${password}

E clico no botao de login
    Click    id=buttonLogin

Entao devo ver a página de tarefas 
    Wait For Elements State    css=.oops p    visible    5
    Get Text    css=.oops p    equal    Nenhuma tarefa cadastrada


Quando preencho os campos email e senha com dados inválidos
    Fill Text    id=email    robsonlogin@gmail.com
    Fill Text    id=password    pw1234

Entao devo ver uma mensagem de erro
    Wait For Elements State    css=.notice.error p    visible    5
    Get Text    css=.notice.error p    equal    Ocorreu um erro ao fazer login, verifique suas credenciais.
