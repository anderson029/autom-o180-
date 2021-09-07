#language: pt

Funcionalidade: Remover Anúncios
    Sendo um anúnciante que possui um equipamento indesejado
    Quero poder remover esse anúncio
    Para que eu possa manter o meu dashboard atualziado

    Contexto: Login
        * Login com "jurema@gmail.com" e a senha "Senha123"

    
    Cenário: remover anúncio

        Dado que eu tenha um anúncio indesejado
            | thumb     | telecaster.jpg |
            | nome      | Telecaster     |
            | categoria | Cordas         |
            | preco     | 50             |
        Quando eu solicito a exclusão desse item
            E confirmo a exclusão
        Então não devo ver esse item no meu Dashboard
@temp
    Cenário: Desistir da exclusão
        Dado que eu tenha um anúncio indesejado
            | thumb     | conga.jpg |
            | nome      | Conga     |
            | categoria | Outros    |
            | preco     | 50        |
        Quando eu solicito a exclusão desse item
            Mas não confirmo a exclusão
        Então esse item deve aparecer no meu Dashboard