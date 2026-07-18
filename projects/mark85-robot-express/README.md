# Mark85 Robot Express

Projeto de automacao de testes end-to-end para o Mark85, uma aplicacao web de gerenciamento de tarefas.

Este repositorio foi organizado para validar os principais fluxos de cadastro, login e disponibilidade da aplicacao usando Robot Framework, Browser Library e apoio direto no banco MongoDB para preparacao de massa de testes.

## Creditos e autoria

O produto Mark85, incluindo frontend e backend, e um projeto criado por Fernando Papito, professor de automaçao e referencia na comunidade de QA.

A autoria deste repositorio esta na automacao de testes: os cenarios, suites Robot, Page Objects e apoio de execucao foram desenvolvidos pelo autor deste repositorio como pratica de automacao.

Este projeto nao reivindica autoria sobre a aplicacao Mark85. Ele documenta e executa testes automatizados sobre a aplicacao criada pelo Fernando Papito.

## Visao geral

O workspace possui tres partes principais:

```text
apps/
  mark85/
    api/                 API REST do Mark85 em Node.js, Express e MongoDB
    web/                 frontend web do Mark85 servido por Express

projects/
  mark85-robot-express/  projeto de automacao com Robot Framework
```

A automacao considera a aplicacao rodando localmente nestes enderecos:

```text
Frontend: http://localhost:3000
Backend:  http://localhost:3333
```

## Tecnologias utilizadas

- Robot Framework
- Browser Library, baseada em Playwright
- Python
- PyMongo
- FakerLibrary
- Node.js
- Express
- MongoDB Atlas

## Estrutura da automacao

```text
mark85-robot-express/
  tests/
    online.robot         smoke test para validar se o webapp esta online
    signup.robot         cenarios de cadastro de usuario
    login.robot          cenarios de login

  resources/
    PageObjects/
      cadastro.page.robot
      login.page.robot
    libs/
      database.py        keywords Python para preparar/remover usuarios no MongoDB

  results/               relatorios gerados pelo Robot Framework
  logs/                  logs de execucoes anteriores
  browser/               evidencias e screenshots geradas durante execucoes
```

## Cenarios cobertos

### Disponibilidade

- Validar que o webapp esta online.
- Validar o titulo da pagina: `Mark85 by QAx`.

### Cadastro

- Cadastro com sucesso.
- Tentativa de cadastro com usuario duplicado.
- Cadastro com nome vazio.
- Cadastro com e-mail vazio.
- Cadastro com senha vazia.
- Cadastro com todos os campos obrigatorios vazios.

### Login

- Login com sucesso.
- Login com credenciais invalidas.

## Pre-requisitos

Antes de rodar os testes, instale:

- Node.js
- Python 3
- Robot Framework
- Browser Library
- MongoDB Atlas acessivel pela aplicacao

No PowerShell, se o comando `npm` estiver bloqueado por politica de execucao, use `npm.cmd`.

## Instalar dependencias da API

Na raiz do projeto:

```powershell
cd C:\ProjetoQAmark85\apps\mark85\api
npm.cmd install
```

## Instalar dependencias do frontend

```powershell
cd C:\ProjetoQAmark85\apps\mark85\web
npm.cmd install
```

## Preparar ambiente Python da automacao

```powershell
cd C:\ProjetoQAmark85\projects\mark85-robot-express
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install robotframework robotframework-browser robotframework-faker pymongo
rfbrowser init
```

## Subir a aplicacao localmente

Abra um terminal para a API:

```powershell
cd C:\ProjetoQAmark85\apps\mark85\api
npm.cmd start
```

Abra outro terminal para o frontend:

```powershell
cd C:\ProjetoQAmark85\apps\mark85\web
npm.cmd start
```

Com os dois servicos em execucao, acesse:

```text
http://localhost:3000
```

## Executar os testes

Dentro da pasta da automacao:

```powershell
cd C:\ProjetoQAmark85\projects\mark85-robot-express
robot -d results tests
```

Executar uma suite especifica:

```powershell
robot -d results tests\signup.robot
robot -d results tests\login.robot
robot -d results tests\online.robot
```

Executar por tag:

```powershell
robot -d results -i signup-success tests
robot -d results -i login-success tests
robot -d results -i login-invalid tests
```

## Relatorios

Apos a execucao, o Robot Framework gera os principais artefatos em `results/`:

```text
results/report.html
results/log.html
results/output.xml
```

Abra `report.html` para uma visao resumida da execucao e `log.html` para investigar cada passo dos testes.

## Observacoes sobre os testes

Os testes usam `headless=False` nos Page Objects, entao o navegador Chromium abre visualmente durante a execucao.

Para rodar em modo invisivel, altere `headless=False` para `headless=True` nos arquivos:

```text
resources/PageObjects/cadastro.page.robot
resources/PageObjects/login.page.robot
```

A lib `resources/libs/database.py` manipula diretamente a collection `users` para limpar ou preparar massa de teste antes dos cenarios.

## Cuidados antes de publicar no GitHub

Antes de subir este projeto para um repositorio publico, revise:

- Nao publicar credenciais reais de banco, tokens ou arquivos `.env`.
- Nao versionar `node_modules/`.
- Nao versionar ambientes virtuais Python, como `.venv/`.
- Nao versionar caches, como `__pycache__/`.
- Avaliar se os relatorios em `results/`, `logs/`, `log/` e screenshots em `browser/` devem ficar fora do repositorio.

Caso o repositorio seja publico, o ideal e mover qualquer string de conexao sensivel para variaveis de ambiente.

## Licenca e uso educacional

Este material tem finalidade educacional e de pratica em automacao de testes.

A aplicacao Mark85 pertence ao projeto original do Fernando Papito. Os testes automatizados deste repositorio representam uma implementacao propria de validacao sobre essa aplicacao.
