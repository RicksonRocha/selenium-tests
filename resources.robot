*** Settings ***
Documentation       Resource dos testes da Secretaria Online

Library             SeleniumLibrary


*** Variables ***
${LOGIN_PAGE_TEXT}      //h3[contains(.,'Secretaria On-line do SEPT - Login')]
${CONTACT_LINK}         //a[contains(.,'Contato')]
${CONTACT_PAGE_TEXT}    //h3[contains(.,'Contato com os Administradores do Sistema')]


*** Keywords ***
Abrir browser
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar browser
    Capture Page Screenshot
    Close Browser

Acessar Secretaria Online no endereço "${URL}"
    Go To    ${URL}
    Wait Until Element Is Visible    ${LOGIN_PAGE_TEXT}

Acessar página de contato
    Click Element    locator=${CONTACT_LINK}

Verificar se contato é exibido
    Element Should Be Visible    locator=${CONTACT_PAGE_TEXT}
