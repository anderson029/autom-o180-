require_relative "routes/equipos"
require_relative "routes/sessions"
require_relative "libs/mongo"

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
      thumbnail = File.open(File.join(Dir.pwd, "spec/fixtures/images", "kramer.jpg"))
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
end
