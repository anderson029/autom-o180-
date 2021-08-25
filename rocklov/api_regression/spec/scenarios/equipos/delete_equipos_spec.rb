#enconding: utf-8
describe "Delete/{equipos id}" do
  before(:all) do
    payload = {
      "email": "gustavo@bol.com",
      "password": "Senha123",
    }

    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end
  context "obter um unico equipamento" do
    before(:all) do
      @payload = {
        "thumbnail": Helpers::get_thumb("pedais.jpg"),
        "name": "pedais",
        "category": "Áudio e Tecnologia",
        "price": 199,
      }
      MongoDB.new.remove_equipo(@payload[:name], @user_id)
      equipo = Equipos.new.create(@payload, @user_id)
      @id_equipo = equipo.parsed_response["_id"]
      @response = Equipos.new.delete_equipo(@id_equipo, @user_id)
    end

    it "deve retornar 204" do
      expect(@response.code).to eql 204
    end
  end

  context "equipamento não existe" do
    before(:all) do
      id_not_found = MongoDB.new.get_mongo_id
      @response = Equipos.new.delete_equipo(id_not_found, @user_id)
    end

    it "deve retornar o código 204" do
      expect(@response.code).to eql 204
    end
  end
end
