#rake é um recurso do ruby, serve para rodar uma única vez para todo projeto, já que o before roda antes de cada cenário.
#para rodar com rake: rake {nome da task}
require_relative "features/support/libs/mongo"
require "digest/md5"

def to_md5(pass)
  return Digest::MD5.hexdigest(pass)
end

task :test do
  puts "executando uma tarefa de teste"
end

task :local do
  CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/local.yml"))
  users = [
    { name: "Anderson", email: "anderson.teste@gmail.com", password: to_md5("Senha123") },
    { name: "Roberto", email: "roberto.teste@gmail.com", password: to_md5("Senha123") },
  ]

  MongoDB.new.drop_danger
  MongoDB.new.insert_users(users)
  sh ("cucumber") #chamando o cucumber para rodar com rake, se chamar somente o rake vai apenas criar a massa de teste.
end
