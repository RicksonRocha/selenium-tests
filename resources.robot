*** Settings ***
Documentation       Resource dos testes da Secretaria Online

Library             SeleniumLibrary
Library             DateTime
Library             String


*** Variables ***
${LOGIN_PAGE_TEXT}              //h3[contains(.,'Secretaria On-line do SEPT - Login')]
${NEW_SOLICITATION_TEXT}        //h3[contains(.,'Nova Solicitação')]
${BTN_SOLICITATION}             //a[contains(.,'Abrir Nova Solicitação')]
${SOLICITATION_PAGE_TEXT}       //h2[contains(.,'Solicitações')]
${URL}                          http://200.236.3.198:28080/secretariaonline2/Home
${BROWSER}                      chrome
${GRR_ALUNO}                    GRR11111111
${SENHA_ALUNO}                  123
${TEXT}                         Texto para solicitação da Secretaria Online. Criado em
${CONSULT_LINK}                 //a[@href='consultarSolicitacao?origem=home&id=X'][contains(.,'Consultar')]


*** Keywords ***
Abrir browser
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar browser
    Capture Page Screenshot
    # Close Browser

Acessar Secretaria Online como ALUNO
    Go To    ${URL}
    Wait Until Element Is Visible    ${LOGIN_PAGE_TEXT}
    Logar com "${GRR_ALUNO}" "${SENHA_ALUNO}"

Logar com "${USUARIO}" "${SENHA}"
    Input Text    email    ${USUARIO}
    Input Text    senha    ${SENHA}
    Click Button    submit
    Wait Until Element Is Visible    ${SOLICITATION_PAGE_TEXT}

Clicar em "Abrir Nova Solicitação"
    Click Element    ${BTN_SOLICITATION}
    Wait Until Element Is Visible    ${NEW_SOLICITATION_TEXT}

Selecionar o tipo de solicitação "Requerimento Geral"
    Select From List By Label    //select[contains(@name, 'idTipoSolicitacao')]    Requerimento Geral
    Click Button    submit

Preechar o campo da solicitação - sem arquivo
    ${CURRENT_DATE}    Get Current Date
    ${SOLICITATION_TEXT}    Catenate    ${TEXT}    ${CURRENT_DATE}
    Input Text    descricao    ${SOLICITATION_TEXT}

Clicar em "Salvar"
    Click Button    submit
    ${CURRENT_URL}    Get Location
    Get Id From ${CURRENT_URL}
    Logoff

Logoff
    Click Element    (//a[@href='logarUsuarioSair1'][contains(.,'Sair')])[2]

Get Id From ${CURRENT_URL}
    ${STR_TMP}    Fetch From Left    ${CURRENT_URL}    &descricao
    ${STR_TMP}    Fetch From Right    ${STR_TMP}    ?id=
    Set Suite Variable    ${CREATED_SOLICITATION_ID}    ${STR_TMP}

A solicitação criada deve aparecer na lista solicitações do aluno
    Acessar Secretaria Online como ALUNO
    ${LOCATOR}    Replace String    ${CONSULT_LINK}    X    ${CREATED_SOLICITATION_ID}
    Wait Until Element Is Visible    ${LOCATOR}
    Logoff
