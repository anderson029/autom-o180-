describe "GET /equipos/{equipos id}" do

  #Dado que tenho um usuário cadastrado
  before(:all) do
    payload = {
      "email": "adam@bol.com",
      "password": "Senha123",
    }

    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end

  #Quando cadastro o equipamento
  context "obter um unico equipamento" do
    before(:all) do
      @payload = {
        "thumbnail": Helpers::get_thumb("sanfona.jpg"),
        "name": "sanfona",
        "category": "Outros",
        "price": 499,
      }
      MongoDB.new.remove_equipo(@payload[:name], @user_id)
      equipo = Equipos.new.create(@payload, @user_id)
      @id_equipo = equipo.parsed_response["_id"]
      @response = Equipos.new.find_get_equipos(@id_equipo, @user_id)
    end

    #Então deve retornar o código 200
    it "deve retornar 200" do
      expect(@response.code).to eql 200
    end

    #E o nome do equipamento
    it "validar o nome do equipamento" do
      expect(@response.parsed_response["name"]).to include (@payload[:name])
    end
    #E a categoria
    it "A categoia deve ser teclas" do
      expect(@response.parsed_response["category"]).to eql (@payload[:category])
    end
  end
  #Quando consulto um equipamento que não existe
  context "equipamento não existe" do
    before(:all) do
      id_not_found = MongoDB.new.get_mongo_id
      @response = Equipos.new.find_get_equipos(id_not_found, @user_id)
    end
    #Enatão deve retornr o código 404
    it "deve retornar o código 404" do
      expect(@response.code).to eql 404
    end
  end
end

describe "GET/equipos" do
  #Dado que tenho um usuário cadastrado

  before(:all) do
    payload = {
      "email": "tom@hotmail.com",
      "password": "Senha123",
    }

    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end

  #Quando cadastro vários equipamentos
  context "obter uma lista de equipamentos" do
    before(:all) do
      payloads = [
        {
          "thumbnail": Helpers::get_thumb("sanfona.jpg"),
          "name": "sanfona",
          "category": "Outros",
          "price": 600,
        },
        {
          "thumbnail": Helpers::get_thumb("baixo.jpg"),
          "name": "cordas",
          "category": "cordas",
          "price": 150,
        },
        {
          "thumbnail": Helpers::get_thumb("mic.jpg"),
          "name": "mic",
          "category": "Outros",
          "price": 30,
        },
      ]
      payloads.each do |payload|
        MongoDB.new.remove_equipo(payload[:name], @user_id)
        Equipos.new.create(payload, @user_id)
      end

      #E consulto a lista de equipamentos
      @result = Equipos.new.list_equipos(@user_id)
    end

    #Então deve retornar o código 200
    it "retornar o código 200" do
      expect(@result.code).to eql 200
    end

    it "retornar uma lista" do
      expect(@result.parsed_response).not_to be_empty # garatindo se a lista não está vazia
      puts @result.parsed_response.class #verificando o tipo do elemento que a api devolve
    end
  end
end
