#Implementando capybara
require "capybara"
#Implementando capybara para funcionar com cucumber
require "capybara/cucumber"
require "faker"
require "allure-cucumber"

#ruby trabalha com  blocos então aqui vamos confugurar o capybara
Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = "http://rocklov-web:3000"
  config.default_max_wait_time = 10
end
=beginopcional allure para gerar reports
AllureCucumber.configure do |config|
  config.results_directory = "logs/"
  config.clean_results_directory = true
end
=end
