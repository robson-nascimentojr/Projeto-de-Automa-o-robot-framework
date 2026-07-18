*** Settings ***

Documentation    Online

library    Browser
Library   FakerLibrary
resource    ../resources/PageObjects/cadastro.page.robot


*** Test Cases *** 

Cadastro com sucesso
    [Tags]    signup-success

    Remove user from database    ${email}

    Start Session

    Go To    http://localhost:3000/signup
    
    #checkpoint
    Checkpoint
    
    Preencher Formulário de Cadastro
    
    Clicar botão de cadastro

    Validar mensagem de sucesso

Cadastro com usuario duplicado
    [Tags]    dup
    
    Remove user from database    ${email}

    Insert user into database    ${name}   ${email}   ${password}

    Start Session

    Go To    http://localhost:3000/signup
    

    #checkpoint
    Checkpoint
    
    Preencher Formulário de Cadastro
    
   Clicar botão de cadastro

    Validar mensagem de erro

Cadastro com nome vazio
    [tags]    signup-empty-name
    
    Remove user from database    ${email}
    
    Start Session
    Go To    http://localhost:3000/signup
    
    Checkpoint

    Preencher Formulário de Cadastro com nome vazio

    Clicar botão de cadastro

    Validar mensagem de erro de nome vazio

Cadastro com email vazio 
    [Tags]    signup-empty-email
    
    Remove user from database    ${email}
    
    Start Session
    Go To    http://localhost:3000/signup
    
    Checkpoint

    Preencher Formulário de Cadastro com email vazio

    Clicar botão de cadastro

    Validar mensagem de erro de email vazio

Cadastro com senha vazia
    [Tags]    signup-empty-password
    
    Remove user from database    ${email}
    
    Start Session
    Go To    http://localhost:3000/signup
    
    Checkpoint

    Preencher Formulário de Cadastro com senha vazia

    Clicar botão de cadastro

    Validar mensagem de erro de senha vazia

Cadastro com campos vazios
    [Tags]    signup-empty-fields
    
    Remove user from database    ${email}
    
    Start Session
    Go To    http://localhost:3000/signup
    
    Checkpoint

    Preencher Formulário com campos vazios

    Clicar botão de cadastro

    Validar todas as mensagens de erro de campos vazios