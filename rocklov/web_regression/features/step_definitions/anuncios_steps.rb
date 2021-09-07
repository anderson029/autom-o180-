Dado("Login com {string} e a senha {string}") do |email, password|
  @email = email

  @login_page.open
  @login_page.with(email, password)
  #Garatindo que estou no dashboard
  expect(@dash_page.on_dash?).to be true
end

Dado("que acesso o formulário de cadastro de anúncio") do
  @dash_page.goto_equipo_form
end

Dado("que eu tenho o seguinte equipamento") do |table|
  @anuncio = table.rows_hash

  MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

Quando("submeto o cadastro desse item") do
  @equipo_page.create(@anuncio)
end

Então("devo ver esse item no meu Dashboard") do
  expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
  expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end

Então("deve conter a mensagem de alerta {string}") do |expect_alert|
  #expect(@alert.messenger_alert).to have_content (expect_alert)
  #verificando se contém a mensagem com have_text
  expect(@alert.messenger_alert).to have_text (expect_alert)
end

# remover anuncios

Dado("que eu tenha um anúncio indesejado") do |table|
  user_id = page.execute_script(" return localStorage.getItem('user')") # extraindo id o usuário atráves do Javascript
  tabela = table.rows_hash
  thumbnail = File.open(File.join(Dir.pwd, "features/support/fixtures/images", tabela[:thumb]))
  @equipo = {
    "thumbnail": thumbnail,
    "name": tabela[:nome],
    "category": tabela[:categoria],
    "price": tabela[:preco],
  }

  EquiposService.new.create(@equipo, user_id)

  visit current_path # refresh na página atual
end

Quando("eu solicito a exclusão desse item") do
  @dash_page.request_remove(@equipo[:name])
  sleep 1 #think time
end

Quando("confirmo a exclusão") do
  @dash_page.confirm_remove
end

Quando("não confirmo a exclusão") do
  @dash_page.cancel_removal
end

Então("não devo ver esse item no meu Dashboard") do
  expect(
    @dash_page.has_no_equipo? (@equipo[:name])
  ).to be true
end

Então("esse item deve aparecer no meu Dashboard") do
  expect(@dash_page.equipo_list).to have_content @equipo[:name]
end
