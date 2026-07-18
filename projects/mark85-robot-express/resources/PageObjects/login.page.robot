*** Settings ***

Library   Browser
Library   ../libs/database.py

*** Variables ***
${name}            Robson Junior
${email}           Jrobinho211@gmail.com
${password}        pw1234

*** Keywords ***


Garantir que exista uma conta cadastrada com as crendiciais fornecidads

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

Na página de login
    New Browser    browser=chromium    headless=False
    New Page  http://localhost:3000
    Go To   http://localhost:3000


Voltar para tela de login
    click    .sc-fznKkj a

Checkpoint página de login
    Wait For Elements State   css=.sc-fzoLsD h1  visible    2
    Get Text                   css=.sc-fzoLsD h1    equal   Faça seu login

Preencher campos obrigatórios
    Fill Text    id=email    ${email}
    Fill Text    id=password    ${password}

Clicar no botao de login
    Click    id=buttonLogin

Checkpoint página de tarefas 
    Wait For Elements State    css=.oops p    visible    5
    Get Text    css=.oops p    equal    Nenhuma tarefa cadastrada


Preencher campo email e senha com dados inválidos
    Fill Text    id=email    robsonlogin@gmail.com
    Fill Text    id=password    pw1234

Validar mensagem de erro de crendenciais inválidas
    Wait For Elements State    css=.notice.error p    visible    5
    Get Text    css=.notice.error p    equal    Ocorreu um erro ao fazer login, verifique suas credenciais.
