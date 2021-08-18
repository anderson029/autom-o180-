#Implementando capybara
require "capybara"
#Implementando capybara para funcionar com cucumber
require "capybara/cucumber"
require "faker"
require "os"

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["CONFIG"]}"))

#configuração de ambientes multibrowser
case ENV["BROWSER"]
when "firefox"
  @driver = :selenium
when "fire_headless"
  @driver = :selenium_headless
when "chrome"
  @driver = :selenium_chrome
when "chrome_headless"
  @driver = :selenium_chrome_headless
else
  raise "Navegador Incorreto, selecione um navegador valido" #raise estoura uma excessão e não exuta mais o código, log e puts só apresenta nos steps
end
puts "Ambiente escolhido #{@driver}"

#ruby trabalha com  blocos então aqui vamos configurar o capybara
Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = CONFIG["url"]
  config.default_max_wait_time = 10
end
