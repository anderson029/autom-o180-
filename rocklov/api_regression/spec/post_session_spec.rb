require_relative "routes/sessions"

describe "POST/sessions" do
  context "Login com sucesso" do
    before(:all) do #before all roda uma única vez sem all roda toda vez antes de cada IT
      @result = Sessions.new.login("adam@bol.com", "Senha123")
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida nome" do
      expect(@result["name"]).to eql "Adam lima"
      #puts @result["name"]
    end
  end

  context "Senha invalida" do
    before(:all) do #before all roda uma única vez sem all roda toda vez antes de cada IT
      @result = Sessions.new.login("adam@bol.com", "123456")
    end

    it "valida status code" do
      expect(@result.code).to eql 401
    end

    it "response text" do
      expect(@result["error"]).to eql "Unauthorized"
    end
  end
end
