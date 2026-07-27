*** Settings ***

Library   Browser
Library   ../libs/database.py

*** Variables ***
${name}            Robson Junior
${email}           Jrobinho211@gmail.com
${password}        pw1234
${password2}        12345

*** Keywords ***

Dado que estou na página de cadastro

    New Browser   browser=chromium    headless=False

    New Page    http://localhost:3000

    Go To    http://localhost:3000/signup

    Wait For Elements State    css=h1    visible    5
    Get Text                  css=h1    equal    Faça seu cadastro

Quando preencho os campos corretamente

    Fill Text    id=name    ${name}
    Fill Text    id=email    ${email}
    Fill Text    id=password  ${password}


Quando preencho os campos com dados ja cadastrados

    Fill Text    id=name    ${name}
    Fill Text    id=email    ${email}
    Fill Text    id=password  ${password}

E clico no botão de cadastro

    Click    id=buttonSignup

Devo ver mensagem de sucesso
    Wait For Elements State    css=.notice p    visible    5
    Get Text                  css=.notice p     equal     Boas vindas ao Mark85, o seu gerenciador de tarefas.

Devo ver mensagem de erro
    Wait For Elements State    css=.notice.error p    visible    5
    Get Text                  css=.notice.error p     equal      Oops! Já existe uma conta com o e-mail informado.

Quando preencho os campo de Cadastro com nome vazio

    Fill Text    id=name    ${Empty}
    Fill Text    id=email    ${email}
    Fill Text    id=password  ${password}

Devo ver uma mensagem de erro no campo nome 
    Wait For Elements State    css=.alert small    visible    2
    Get Text                  css=.alert small     equal      Informe seu nome completo

Quando preencho o campo de Cadastro com email vazio

    Fill Text    id=name    ${name}
    Fill Text    id=email    ${Empty}
    Fill Text    id=password  ${password}

Devo ver uma mensagem de erro no campo email
    Wait For Elements State   css=.alert small    visible    2
    Get Text                  css=.alert small     equal      Informe seu e-email

Quando preencho o campo de Cadastro com senha vazia

    Fill Text    id=name    ${name}
    Fill Text    id=email    ${email}
    Fill Text    id=password  ${Empty}

Devo ver uma mensagem de erro no campo senha
    Wait For Elements State   css=.alert small    visible    2
    Get Text                  css=.alert small.alert-error     equal      Informe uma senha com pelo menos 6 digitos

Quando preencho o campo de cadastro com todos os campos vazios

    Fill Text    id=name    ${Empty}
    Fill Text    id=email    ${Empty}
    Fill Text    id=password  ${Empty}

Devo ver as mensagens de erro de campos vazios
    #nome
    Wait For Elements State   css=.form-input:nth-child(3) .alert-error   visible    2
    Get Text                  css=.form-input:nth-child(3) .alert-error    equal      Informe seu nome completo
    #email
    Wait For Elements State   css= .form-input:nth-child(4) .alert-error    visible    2
    Get Text                  css=.form-input:nth-child(4) .alert-error   equal      Informe seu e-email

    #password
    Wait For Elements State   css= .form-input:nth-child(5) .alert-error    visible    2
    Get Text                  css= .form-input:nth-child(5) .alert-error    equal      Informe uma senha com pelo menos 6 digitos


Quando preencho o campo senha com 5 digitos

    Fill Text    id=name    ${name}
    Fill Text    id=email    ${email}
    Fill Text    id=password  ${password2}

Devo ver uma mensagem de erro pedindo para informar mais de 6 digitos 
    Wait For Elements State   css=.alert small    visible    2
    Get Text                  css=.alert small.alert-error     equal      Informe uma senha com pelo menos 6 digitos
