require_relative "routes/signup"
require_relative "libs/mongo"

describe "Post/Signup" do
  context "Cadastro com sucesso" do
    before(:all) do
      @payload = {
        "name": "Anderson",
        "email": "anderson@teeeste.com",
        "password": "Senha123",
      }
      MongoDB.new.remove_user(@payload[:email])
      @result = Signup.new.create(@payload)
      puts @result
    end

    it "Valindado status code" do
      expect(@result.code).to eql 200
    end

    it "validando email" do
      expect(@result.parsed_response["name"]).to eql @payload[:name]
    end
  end
end
