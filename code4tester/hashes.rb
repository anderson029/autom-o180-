
#hashes são componentes armazenados em uma única variavél atraves de chaves

anderson= { nome: "Anderson", email: "adn@gmail.com", idade: 30}
#puts anderson[:nome]

camila = {nome:"Camila topetinho", email: "topetinho@vemcomtudo.com", idade: 26}

pessoas = [anderson, camila]

puts pessoas[0][:idade]
puts pessoas[1][:nome]
