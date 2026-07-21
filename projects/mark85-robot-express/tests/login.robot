*** Settings ***

Documentation    online

Library    Browser
Library    FakerLibrary
Resource    ../resources/PageObjects/login.page.robot

*** Test Cases ***

Login com sucesso
    [Tags]    login-success

    Remove user from database    ${email}

    Dado que eu ja tenha efetuado o cadastro

    E que volte para tela de login
    
    E devo ver o um titulo Faça seu login

    Quando preencho os campos obrigatórios

    E clico no botao de login

    Entao devo ver a página de tarefas

Login com crendenciais inválidas
    [Tags]    login-invalid
    Remove user from database    ${email}

    Dado que eu esteja Na página de login

    Quando preencho os campos email e senha com dados inválidos

    E clico no botao de login

    Entao devo ver uma mensagem de erro
    