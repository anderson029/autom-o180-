puts "Qual é o seu nome"
nome = gets.chomp
puts "Qual é sua idade"
idade = gets.chomp.to_i

if (idade>=18)
    puts  "Você tem, #{idade} anos, #{nome}, você pode tirar carteira de motorista"

elsif (idade>=7)
    puts  "Você só tem, #{idade} anos, #{nome}, melhor continuar andando de bicicleta"

else
    puts  "Você só tem, #{idade} anos, #{nome}, você é muito jovem, melhor andar de motoquinha"
end