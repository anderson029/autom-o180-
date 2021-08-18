#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usuário cadastrado na rocklov que possui equipamentos músicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizalos para locação

    Contexto: Login
        * Login com "anderson.teste@gmail.com" e a senha "Senha123"

    @cadastroequipo
    Cenário: Novo equipamento
        Dado que acesso o formulário de cadastro de anúncio
            E que eu tenho o seguinte equipamento
            | img       | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu Dashboard

    Esquema do Cenário: Tentativa de cadastro de anúncio
        Dado que acesso o formulário de cadastro de anúncio
            E que eu tenho o seguinte equipamento
            | img       | <foto>             |
            | nome      | <nome_equipamento> |
            | categoria | <categoria>        |
            | preco     | <preco>            |
        Quando submeto o cadastro desse item
        Então deve conter a mensagem de alerta "<mensagem_output>"

        Exemplos:
            | foto          | nome_equipamento | categoria          | preco | mensagem_output                      |
            |               | Violão de nylon  | Cordas             | 150   | Adicione uma foto no seu anúncio!    |
            | clarinete.jpg |                  | Outros             | 200   | Informe a descrição do anúncio!      |
            | baixo.jpg     | Baixo            |                    | 100   | Informe a categoria                  |
            | amp.jpg       | Caixa de som     | Áudio e Tecnologia |       | Informe o valor da diária            |
            | amp.jpg       | Caixa de som     | Áudio e Tecnologia | abc   | O valor da diária deve ser numérico! |
            | amp.jpg       | Caixa de som     | Áudio e Tecnologia | 150A  | O valor da diária deve ser numérico! |
