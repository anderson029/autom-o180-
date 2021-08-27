#language: pt

Funcionalidade: Remover Anúncios
    Sendo um anúnciante que possui um equipamento indesejado
    Quero poder remover esse anúncio
    Para que eu possa manter o meu dashboard atualziado

    Cenário: remover anúcio

        Dado que eu tenha um anúncio indesejado
            | thumb      | telecaster.jpg |
            | nome       | Telecaster     |
            | castegoria | Cordas         |
            | preco      | 50             |
        Quando eu solicito a exclusão desse item
            E confirmo a exclusão
        Então não devo ver esse item no meu Dashboard

    Cenário: Desistir da exclusão
        Dado que eu tenha um anúncio indesejado
            | thumb      | conga.jpg |
            | nome       | Conga     |
            | castegoria | Outros        |
            | preco      | 50             |
        Quando eu solicito a exclusão desse item
           Mas não confirmo a exclusão
        Então não devo ver esse item no meu Dashboard