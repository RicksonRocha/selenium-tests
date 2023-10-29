*** Settings ***
Documentation       Demonstração do Robot Framework com Secretaria Online.

Resource            resources.robot

Test Setup          Abrir browser
Test Teardown       Fechar browser


*** Test Cases ***
CT01: Verificar contatos da secreataria online
    [Documentation]    Verifica se os contatos são corretamente mostrados.
    [Tags]    contatos
    Acessar Secretaria Online no endereço "http://200.236.3.198:28080/secretariaonline2/Home"
    Acessar página de contato
    Verificar se contato é exibido
