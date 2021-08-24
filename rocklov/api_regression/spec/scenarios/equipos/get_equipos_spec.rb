describe "equipos/{equipos id}" do
  before(:all) do
    payload = {
      "email": "adam@bol.com",
      "password": "Senha123",
    }

    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end
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

    it "deve retornar 200" do
      expect(@response.code).to eql 200
    end

    it "validar o nome do equipamento" do
      expect(@response.parsed_response["name"]).to include (@payload[:name])
    end

    it "A categoia deve ser teclas" do
      expect(@response.parsed_response["category"]).to eql (@payload[:category])
    end
  end

  context "equipamento não existe" do
    before(:all) do
      id_not_found = MongoDB.new.get_mongo_id
      @response = Equipos.new.find_get_equipos(id_not_found, @user_id)
    end

    it "deve retornar o código 404" do
      expect(@response.code).to eql 404
    end
  end
end
