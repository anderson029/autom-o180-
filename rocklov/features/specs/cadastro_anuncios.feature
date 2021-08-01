#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usuário cadastrado na rocklov que possui equipamentos músicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizalos para locação

    Cenário: Novo equipamento
        
        Dado que eu tenho o seguinte equipamento
            | img       | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu Dashboard