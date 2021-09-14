Dado("que meu perfil de anunciante é {string} e {string}") do |email, password|
  @email_anunciante = email
  @pass_anunciante = password
end

Dado("que eu tenho o seguinte equipamento cadastrado:") do |table|
  user_id = SessionsService.new.get_user_id(@email_anunciante, @pass_anunciante)
  tabela = table.rows_hash
  thumbnail = File.open(File.join(Dir.pwd, "features/support/fixtures/images", tabela[:thumb]))
  @equipo = {
    "thumbnail": thumbnail,
    "name": tabela[:nome],
    "category": tabela[:categoria],
    "price": tabela[:preco],
  }

  MongoDB.new.remove_equipo(@equipo[:name], @email_anunciante)

  result = EquiposService.new.create(@equipo, user_id)
  @equipo_id = result.parsed_response["_id"]
end

Dado("acesso o meu dashboard") do
  @login_page.open
  @login_page.with(@email_anunciante, @pass_anunciante)
end

Quando("{string} e {string} solicita a locação desse equipo") do |email, password|
  user_id = SessionsService.new.get_user_id(email, password)
  EquiposService.new.booking(@equipo_id, user_id)
end

Então("devo ver a seguinte mensagem:") do |doc_string|
  expect_message = doc_string.gsub("DATA_ATUAL", Time.now.strftime("%d/%m/%y"))
 
  expect( @dash_page.order).to have_text expect_message
end

Então("devo ver os links: {string} e {string} no pedido") do |button_accept, button_reject|
 #sem page objects
  #expect(page).to have_selector ".notifications button", text: button_accept
  #expect(page).to have_selector ".notifications button", text: button_reject

#implementando page objects
  expect(@dash_page.order_actions(button_accept)),to be true
  expect(@dash_page.order_actions(button_reject)),to be true

end
