=begin 
classe é um objeto que tem características e funções
Carcterística = nome, modelo, cor, etc...
Funções = Ligar, buzinar, parar, etc...
=end

class Carro
    # criando acessores (característica)
    attr_accessor :nome, :cor, :marca

    #criando funções
    def ligar
        puts "O #{nome} pode ser ligado"
    end
end

#Instanciando a classe "carro" 
chevette = Carro.new

# Atribuindo valores as característica da classe
chevette.nome = "Chevette"
chevette.cor = "Azul"
chevette.marca = "GM"

# Atribuindo mais um objeto para utilziar a mesma classe

fusca = Carro.new

fusca.nome = "Fusca"
fusca.cor = "Amarelo"
fusca.marca = "VW"


#Chamando a função ligar da classe carro (no cmd rodar o arquivo carro.rb)
chevette.ligar

#chamando outra variável utilizando o mesmo método
fusca.ligar

#.class é o método em ruby para verificar qual tipo de objeto estamos trabalhando (nesse caso tipo carro)
puts chevette.class

