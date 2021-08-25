require_relative "routes/signup"
require_relative "routes/sessions"
require_relative "routes/equipos"

require_relative "libs/mongo"
require_relative "helpers"

# modo para converter string para criptografia md5
require "digest/md5"

def to_md5(pass)
  return Digest::MD5.hexdigest(pass)
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  #processo de semente, inseri no banco de dados antes de rodar os testes
  config.before (:suite) do
    users = [
      { name: "Adam Bol", email: "adam@bol.com", password: to_md5("Senha123") },
      { name: "Tom Lima", email: "tom@hotmail.com", password: to_md5("Senha123") },
      { name: "Joy Miller", email: "joy@uol.com", password: to_md5("Senha123") },
      { name: "Messi", email: "messi@bol.com", password: to_md5("Senha123") },
      { name: "Gustavo", email: "gustavo@bol.com", password: to_md5("Senha123") },
    ]
    MongoDB.new.drop_danger
    MongoDB.new.insert_users(users)
  end
end
