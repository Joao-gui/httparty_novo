#language: pt

@startup
Funcionalidade: Manter dados de Startup através da API
Como um usuário do sistema
Eu quero realizar as requisições na API
A fim de manipular as informações do cadastro de startup

Cenário: Cadastro de uma Startup
    Dado o endereço da API para manter o cadastro da Startup
    Quando realizar uma requisição para cadastrar uma startup
    Então a API irá retornar os dados do cadastro da Startup respondendo o código 201

Cenário: Colsultar uma Startup
    Dado o endereço da API para manter o cadastro da Startup
    Quando realizar uma requisição passando o ID da startup
    Então a API irá retornar os dados da Startup correspondente respondendo o código 200

Cenário: Alterar uma Startup
    Dado o endereço da API para manter o cadastro da Startup
    Quando realizar uma requisição para alterar uma startup
    Então a API irá retornar os dados da Startup alterados respondendo o código 200

@deletarFuncionar
Cenário: Deletar uma Startup
    Dado o endereço da API para manter o cadastro da Startup
    Quando realizar uma requisição para excluir uma startup
    Então a API irá retornar os dados da exclusão respondendo o código 200