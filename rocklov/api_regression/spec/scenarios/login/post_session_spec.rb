describe "POST/sessions" do
  context "Login com sucesso" do
    before(:all) do #before all roda uma única vez sem all roda toda vez antes de cada IT
      payload = {
        "email": "adam@bol.com",
        "password": "Senha123",
      }
      @result = Sessions.new.login(payload)
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida nome" do
      expect(@result["name"]).to eql "Anderson"
    end
  end

  examples = [
    {
      title: "Senha invalida",
      payload: {
        "email": "adam@bol.com",
        "password": "123456",
      },
      code: 401,
      error: "Unauthorized",
    },
    {
      title: "Email em branco",
      payload: {
        "email": "",
        password: "123456",
      },
      code: 412,
      error: "required email",
    },
    {
      title: "Sem o campo email",
      payload: {
        password: "123456",
      },
      code: 412,
      error: "required email",
    },
    {
      title: "Senha em branco",
      payload: {
        "email": "adam@bol.com",
        password: "",
      },
      code: 412,
      error: "required password",
    },
    {
      title: "Sem o campo senha",
      payload: {
        "email": "adam@bol.com",
      },
      code: 412,
      error: "required password",
    },
  ]

  examples.each do |e|
    context "#{e[:title]}" do
      before(:all) do #before all roda uma única vez sem all roda toda vez antes de cada IT
        @result = Sessions.new.login(e[:payload])
      end

      it "valida status code #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end

      it "response text" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end
