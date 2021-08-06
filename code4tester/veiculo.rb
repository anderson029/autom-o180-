=begin 
classe é um objeto que tem características e funções
Carcterística = nome, modelo, cor, etc...
Funções = Ligar, buzinar, parar, etc...
=end

#herança quando criamos classes com métodos e funções incomum entre as classes filha
class Veiculo
    # criando acessores (característica)
    attr_accessor :nome, :cor, :marca

    #método construtor, ele é executado sempre que a classe é chamada
    def initialize(nome, marca)
        @nome = nome
        @marca = marca
    end
end

class Carro < Veiculo
    #criando funções
    def ligar
        puts "O #{@nome} pode ser ligado"
    end

    def dirigir
        puts "O #{@nome} está iniciando o trajeto"
    end
end

class Moto < Veiculo
    def ligar
        puts "O #{@nome} pode ser ligado"
    end

    def pilotar
        puts "A #{@nome} está iniciando o trajeto"
    end
end

#Instanciando a classe "carro" 
chevette = Carro.new("Chevette", "GM")

=begin 
Atribuindo valores as característica da classe quando não tem o "initialize"
chevette.nome = "Chevette"
chevette.cor = "Azul"
chevette.marca = "GM"
=end

fusca = Carro.new("Fusca", "VW")

#Chamando a função ligar da classe carro (no cmd rodar o arquivo carro.rb)
chevette.ligar
chevette.dirigir

#chamando outra variável utilizando o mesmo método
fusca.ligar
fusca.dirigir

moto = Moto.new("Faizer", "Yamaha")
moto.ligar
moto.pilotar

#.class é o método em ruby para verificar qual tipo de objeto estamos trabalhando (nesse caso tipo carro)
puts chevette.class



