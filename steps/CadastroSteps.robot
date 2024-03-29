*** Settings ***
Resource    ../Shared/main.robot




*** Keywords ***

Que esteja na tela HOME do site Demo Web Shop
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible   ${CABEÇALHO}
    Title Should Be                 Demo Web Shop


Vou até a página de endereços
    Go To                           ${URL}/customer/addresses

Clico em Add new
    Click Element                   ${BOTAO_ADD}

Clico em Register
    Click Element                   ${BOTAO_REGISTER}

Clico em Login
     Click Element                  ${BOTAO_LOGIN}
     
Clico em Log out
    Click Element                   ${BOTAO_LOGOUT}

Preencho meu email no campo newsletter
    Run Keyword    Gerar dados do nome
    Input Text                      ${CAMPO_NEWSLETTER}        ${USER_EMAIL}
    Click Element                   ${BOTAO_SUBSCRIBE}


Envio o formulário
    Run Keyword    Gerar dados do nome
    Run Keyword    Gerar dados do sobrenome
    Run Keyword    Gerar dados do email
    Click Element                   ${BOTAO_REGISTER}
    Click Element                   ${BOTAO_GENDER}
    Input Text                      ${CAMPO_FIRSTNAME}          ${FIRSTNAME}
    Input Text                      ${CAMPO_LASTNAME}           ${USER_LASTNAME}
    Input Text                      ${CAMPO_EMAIL}              ${USER_EMAIL}
    Input Text                      ${CAMPO_PASSWORD}           ${USER_PASSWORD}
    Input Text                      ${CAMPO_PASSWORD2}          ${USER_PASSWORD2}
    Click Element                   ${BOTAO_SUBMIT_REGISTER}

Envio o formulário com meus dados
    Input Text                      ${CAMPO_FIRSTNAME_ADDRESS}   ${FIRSTNAME}
    Input Text                      ${CAMPO_LASTNAME_ADDRESS}    ${USER_LASTNAME}
    Input Text                      ${CAMPO_EMAIL_ADDRESS}       ${USER_EMAIL}
    Click Element                   ${SELECT_COUNTRY}
    Input Text                      ${CAMPO_CITY}                ${USER_CITY}
    Input Text                      ${CAMPO_ADDRESS}             ${USER_ADDRESS}
    Input Text                      ${CAMPO_PHONE}               ${USER_PHONE}
    Input Text                      ${CAMPO_ZIP}                 ${USER_ZIP}
    Click Element                   ${BOTAO_SUBMIT_ADDRESS}

Envio meu usuário e senha
    Run Keyword    Gerar dados do email
    Input Text                      ${CAMPO_EMAIL}              ${USER_EMAIL}
    Input Text                      ${CAMPO_PASSWORD}           ${USER_PASSWORD}
    Click Element                   ${BOTAO_SUBMIT_LOGIN}


Devo receber a mensagem "${CADASTRO_MSG}"
    Page Should Contain             ${CADASTRO_MSG}

Devo visualizar "${CONFIRM_LOGIN}" no cabeçalho
    Page Should Contain             ${CONFIRM_LOGIN}

Devo visualizar uma mensagem "${NEWSLETTER_MSG}"
    Wait Until Page Contains        ${NEWSLETTER_MSG}

Devo visualizar a opção Login no cabeçalho
    Wait Until Element Is Visible    ${BOTAO_LOGIN}

Devo visualizar o título "${ENDERECO_MSG}"
    Page Should Contain             ${ENDERECO_MSG}


Fechar Navegador
    Close Browser
