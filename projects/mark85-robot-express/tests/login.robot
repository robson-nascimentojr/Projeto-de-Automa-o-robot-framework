*** Settings ***

Documentation    online

Library    Browser
Library    FakerLibrary
Resource    ../resources/PageObjects/login.page.robot

*** Test Cases ***

Login com sucesso
    [Tags]    login-success

    Remove user from database    ${email}

    Garantir que exista uma conta cadastrada com as crendiciais fornecidads

    Voltar para tela de login

    Checkpoint página de login

    Preencher campos obrigatórios

    Clicar no botao de login

    Checkpoint página de tarefas

Login com crendenciais inválidas
    [Tags]    login-invalid
    Remove user from database    ${email}

    Na página de login

    Preencher campo email e senha com dados inválidos

    Clicar no botao de login

    Validar mensagem de erro de crendenciais inválidas
    