#language: pt

Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    Para que eu possa anunciar meus equipamentos musicais

    @login
    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "anderson.teste@gmail.com" e "Senha123"
        Então sou redirecionado para o Dashboard

    Esquema do Cenário: Tentar Logar
        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | email_input              | senha_input | mensagem_output                  |
            | anderson.teste@gmail.com | 123teste    | Usuário e/ou senha inválidos.    |
            | anderson.teste@yahoo.com | Senha123    | Usuário e/ou senha inválidos.    |
            | anderson.teste*yahoo.com | Senha123    | Oops. Informe um email válido!   |
            |                          | Senha123    | Oops. Informe um email válido!   |
            | anderson.teste@gmail.com |             | Oops. Informe sua senha secreta! |