#Implementando capybara
require "capybara"
#Implementando capybara para funcionar com cucumber
require "capybara/cucumber"
require "faker"
require "allure-cucumber"

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["CONFIG"]}"))
#ruby trabalha com  blocos então aqui vamos confugurar o capybara
Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = CONFIG["url"]
  config.default_max_wait_time = 10
end
