describe "Post/equipos" do
  context "novo equipo" do
    #armazeando o token do usuario para passar no header
    before(:all) do
      payload = {
        "email": "adam@bol.com",
        "password": "Senha123",
      }

      result = Sessions.new.login(payload)
      @user_id = result.parsed_response["_id"]
    end
    before(:all) do
      thumbnail = Helpers::get_thumb("kramer.jpg")
      payload = {
        "thumbnail": thumbnail,
        "name": "Guitarra",
        "category": "Cordas",
        "price": 399,
      }
      MongoDB.new.remove_equipo(payload[:name], @user_id)
      @result = Equipos.new.create(payload, @user_id)
    end

    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end
  end

  context "não autorizado" do
    #armazenando o token do usuario para passar no header
    before(:all) do
      payload = {
        "thumbnail": Helpers::get_thumb("sanfona.jpg"),
        "name": "Guitarra",
        "category": "Cordas",
        "price": 399,
      }

      @result = Equipos.new.create(payload, nil)
    end

    it "deve retornar 401" do
      expect(@result.code).to eql 401
    end

    it "deve retornar a mensagem de erro" do
      expect(@result.parsed_response["error"]).to eql "Unauthorized"
    end
  end
end
