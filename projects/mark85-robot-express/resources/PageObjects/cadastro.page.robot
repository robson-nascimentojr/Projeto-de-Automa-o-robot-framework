*** Settings ***

Library   Browser
Library   ../libs/database.py

*** Variables ***
${name}            Robson Junior
${email}           Jrobinho211@gmail.com
${password}        pw1234

*** Keywords ***

Start Session

    New Browser   browser=chromium    headless=False
    New Page    http://localhost:3000

Checkpoint

    Wait For Elements State    css=h1    visible    5
    Get Text                  css=h1    equal    Faça seu cadastro

Preencher Formulário de Cadastro

    Fill Text    id=name    ${name}
    Fill Text    id=email    ${email}
    Fill Text    id=password  ${password}

Clicar botão de cadastro

    Click    id=buttonSignup

Validar mensagem de sucesso
    Wait For Elements State    css=.notice p    visible    5
    Get Text                  css=.notice p     equal     Boas vindas ao Mark85, o seu gerenciador de tarefas.

Validar mensagem de erro
    Wait For Elements State    css=.notice.error p    visible    5
    Get Text                  css=.notice.error p     equal      Oops! Já existe uma conta com o e-mail informado.

Preencher Formulário de Cadastro com nome vazio

    Fill Text    id=name    ${Empty}
    Fill Text    id=email    ${email}
    Fill Text    id=password  ${password}

Validar mensagem de erro de nome vazio
    Wait For Elements State    css=.alert small    visible    2
    Get Text                  css=.alert small     equal      Informe seu nome completo

Preencher Formulário de Cadastro com email vazio

    Fill Text    id=name    ${name}
    Fill Text    id=email    ${Empty}
    Fill Text    id=password  ${password}

Validar mensagem de erro de email vazio
    Wait For Elements State   css=.alert small    visible    2
    Get Text                  css=.alert small     equal      Informe seu e-email

Preencher Formulário de Cadastro com senha vazia

    Fill Text    id=name    ${name}
    Fill Text    id=email    ${email}
    Fill Text    id=password  ${Empty}

Validar mensagem de erro de senha vazia
    Wait For Elements State   css=.alert small    visible    2
    Get Text                  css=.alert small.alert-error     equal      Informe uma senha com pelo menos 6 digitos

Preencher Formulário com campos vazios

    Fill Text    id=name    ${Empty}
    Fill Text    id=email    ${Empty}
    Fill Text    id=password  ${Empty}

Validar todas as mensagens de erro de campos vazios
    #nome
    Wait For Elements State   css=.form-input:nth-child(3) .alert-error   visible    2
    Get Text                  css=.form-input:nth-child(3) .alert-error    equal      Informe seu nome completo
    #email
    Wait For Elements State   css= .form-input:nth-child(4) .alert-error    visible    2
    Get Text                  css=.form-input:nth-child(4) .alert-error   equal      Informe seu e-email

    #password
    Wait For Elements State   css= .form-input:nth-child(5) .alert-error    visible    2
    Get Text                  css= .form-input:nth-child(5) .alert-error    equal      Informe uma senha com pelo menos 6 digitos