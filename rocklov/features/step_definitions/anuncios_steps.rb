Dado('que estou logado com {string} e a senha {string}') do |email, password|
    visit "/"
    find("input[placeholder='Seu e-email']").set email
    find("input[type=password]").set password
    click_button "Entrar"
end

Dado('que acesso o formulário de cadastro de anúncio') do
    click_button "Criar anúncio"
    #verificando se estou na tela correta:
    expect(page).to have_css "#equipoForm"
end

Dado('que eu tenho o seguinte equipamento') do |table|
    @anuncio = table.rows_hash
end

Quando('submeto o cadastro desse item') do

    thumb = Dir.pwd + "/feature/support/fixtures/images/" + @anuncio[:thumb]
    sleep 10
    find("#thumbnail input[type=file]", visible: false).set thumb
    find("input[placeholder$=equipamento]").set @anuncio[:nome]
    find("#category").find("option", text: @anuncio[:categoria]).select_option
    find("input[placeholder^='Valor']").set @anuncio[:preco]

    #click_button ("Cadastrar")
end

Então('devo ver esse item no meu Dashboard') do
    pending # Write code here that turns the phrase above into concrete actions
end