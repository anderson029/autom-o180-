#language: pt

Funcionalidade: Cadastro
    Sendo um músico que possui equipamentos musicais
    Quero fazer o meu cadastro no RockLov
    Para que eu possa disponibilizá-los para locação

    Contexto: Página de login
        Dado que acesso a página de cadastro

    @cadastro
    Cenario: Fazer cadastro

        Quando submeto o seguinte formulário de cadastro:
            | nome              | email                    | senha    |
            | Anderson Oliveira | anderson.teste@teste.com | Senha123 |
        Então sou redirecionado para o Dashboard

    @tentativa_cadastro
    Esquema do Cenario: Tentativa de cadastro

        Quando submeto o seguinte formulário de cadastro:
            | nome         | email         | senha         |
            | <nome_input> | <email_input> | <senha_input> |
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | nome_input        | email_input        | senha_input | mensagem_output                  |
            |                   | anderson@gmail.com | Senha123    | Oops. Informe seu nome completo! |
            | Anderson Oliveira | anderson#gmail.com | Senha123    | Oops. Informe um email válido!   |
            | Anderson Oliveira |                    | Senha123    | Oops. Informe um email válido!   |
            | Anderson Oliveira | anderson@gmail.com |             | Oops. Informe sua senha secreta! |