*** Settings ***

Documentation    Online

library    Browser
Library   FakerLibrary
resource    ../resources/PageObjects/cadastro.page.robot


*** Test Cases *** 

Cadastro com sucesso
    [Tags]    signup-success

    Remove user from database    ${email}

    Dado que estou na página de cadastro

    Quando preencho os campos corretamente
    
    E clico no botão de cadastro
    
    Devo ver mensagem de sucesso


Cadastro com usuario duplicado
    [Tags]    dup
    
    Remove user from database    ${email}

    Insert user into database    ${name}   ${email}   ${password}

    Dado que estou na página de cadastro
    
    Quando preencho os campos com dados ja cadastrados
    
    E clico no botão de cadastro

    Devo ver mensagem de erro

Cadastro com nome vazio
    [tags]    signup-empty-name
    
    Remove user from database    ${email}
    
    Dado que estou na página de cadastro

    Quando preencho os campo de Cadastro com nome vazio

    E clico no botão de cadastro

    Devo ver uma mensagem de erro no campo nome

Cadastro com email vazio 
    [Tags]    signup-empty-email
    
    Remove user from database    ${email}
    
    Dado que estou na página de cadastro

    Quando preencho o campo de Cadastro com email vazio

    E clico no botão de cadastro

    Devo ver uma mensagem de erro no campo email

Cadastro com senha vazia
    [Tags]    signup-empty-password
    
    Remove user from database    ${email}
    
    Dado que estou na página de cadastro

    Quando preencho o campo de Cadastro com senha vazia

    E clico no botão de cadastro

    Devo ver uma mensagem de erro no campo senha

Cadastro com campos vazios
    [Tags]    signup-empty-fields
    
    Remove user from database    ${email}
    
    Dado que estou na página de cadastro

    Quando preencho o campo de cadastro com todos os campos vazios

    E clico no botão de cadastro

    Devo ver as mensagens de erro de campos vazios

Cadastro com senha menor que 6 digitos
    [Tags]    singup-password-five
    Remove user from database    ${email}
    
    Dado que estou na página de cadastro

    Quando preencho o campo senha com 5 digitos

    E clico no botão de cadastro

    Devo ver uma mensagem de erro pedindo para informar mais de 6 digitos 