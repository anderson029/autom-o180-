Dado('que estou logado com {string} e a senha {string}') do |email, password|
    @email = email
    
    @login_page.open
    @login_page.with(email, password)
end

Dado('que acesso o formulário de cadastro de anúncio') do
    click_button "Criar anúncio"
    #verificando se estou na tela correta:
    expect(page).to have_css "#equipoForm"
end

Dado('que eu tenho o seguinte equipamento') do |table|
    @anuncio = table.rows_hash

    MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

Quando('submeto o cadastro desse item') do

    img = Dir.pwd + "/features/support/fixtures/images/" + @anuncio[:img]
    find("#thumbnail input[type=file]", visible: false).set img
    find("input[placeholder$=equipamento]").set @anuncio[:nome]
    find("#category").find("option", text: @anuncio[:categoria]).select_option
    find("input[placeholder^='Valor']").set @anuncio[:preco]

    click_button ("Cadastrar")
end

Então('devo ver esse item no meu Dashboard') do
    anuncio = find(".equipo-list")
    expect(anuncio). to have_content @anuncio[:nome]
    expect(anuncio). to have_content "R$#{@anuncio[:preco]}/dia"
end