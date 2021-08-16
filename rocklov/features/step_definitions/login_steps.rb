Dado("que acesso a página principal") do
  @login_page.open
end

Quando("submeto minhas credenciais com {string} e {string}") do |email_input, senha_input|
  @login_page.with(email_input, senha_input)
end
