Before do
  @alert = Alert.new
  @login_page = LoginPage.new
  @signup_page = SignupPage.new
  @dash_page = DashPage.new
  @equipo_page = EquiposPage.new

  #trabalhar com tamanho máximo de tela
  page.driver.browser.manage.window.maximize

  #defindo o tamanho da tela padronizado
  #page.current_window.resize_to(1440, 900)
end

After do |scenario|
  nome_cenario = scenario.name.gsub(" ", "_").downcase
  log nome_cenario
  page.save_screenshot("logs/screenshot_evidency/#{nome_cenario}.png")
end
