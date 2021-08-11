Dado('que acesso a página de cadastro') do
    @signup_page.open
end

Quando('submeto o seguinte formulário de cadastro:') do |table|

    user = table.hashes[0]

    #chamando a classe que acessa banco de dados e método que deleta email
    MongoDB.new.remove_user(user[:email])
    @signup_page.create(user)
end