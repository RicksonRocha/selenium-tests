*** Settings ***
Documentation       Verifica requerimentos gerais da Secretaria Online.

Resource            resources.robot

Test Setup          Abrir browser
Test Teardown       Fechar browser


*** Test Cases ***
Caso de Teste 1: Realizar um requerimento geral como aluno
    [Documentation]    Verifica se os contatos são corretamente mostrados.
    [Tags]    aluno    requerimento
    Acessar Secretaria Online como ALUNO
    Clicar em "Abrir Nova Solicitação"
    Selecionar o tipo de solicitação "Requerimento Geral"
    Preechar o campo da solicitação - sem arquivo
    Clicar em "Salvar"
    A solicitação criada deve aparecer na lista solicitações do aluno
