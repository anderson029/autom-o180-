
#array são componentes armazenados em uma única variavél atraves de posições
bandas = ["Ac/DC", "Sampa Crew", "Exaltasamba", "Queen"]

puts bandas[0]
puts bandas[1]
puts bandas[2]
puts bandas[3]
bandas.push("Michael Jackson") # método push adiciona arquivos em array
puts bandas[4]
puts "apaguei o queen".upcase
bandas.delete("Queen") # método delete remove itens de um array
puts bandas

pagode = bandas.find {|item| item == 'Exaltasamba'} # buscar um item dentro do array

puts pagode

samba = bandas.find {|element| element.include?('Crew')} # buscar um item dentro de um array que contem valor CREW

puts samba
