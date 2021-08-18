require "httparty"

describe "POST/sessions" do
  context "Login com sucesso" do
    before(:all) do #before all roda uma única vez sem all roda toda vez antes de cada IT
      payload = {
        "email": "adam@bol.com",
        "password": "Senha123",
      }
      @result = HTTParty.post(
        "http://rocklov-api:3333/sessions",
        body: payload.to_json,
        headers: {
          "Content-Type": "application/json",
        },
      )
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida nome" do
      expect(@result["name"]).to eql "Adam lima"
      #puts @result["name"]
    end
  end
end
