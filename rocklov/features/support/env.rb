#Implementando capybara 
require "capybara"

#Implementando capybara para funcionar com cucumber
require "capybara/cucumber"

#ruby trabalha com  blocos então aqui vamos confugurar o capybara
Capybara.configure do |config|
    config.default_driver = :selenium_chrome
end