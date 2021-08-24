describe "Post/Signup" do
  context "Cadastro com sucesso" do
    before(:all) do
      @payload = {
        "name": "Anderson",
        "email": "anderson@teste.com",
        "password": "Senha123",
      }
      MongoDB.new.remove_user(@payload[:email])
      @result = Signup.new.create(@payload)
    end

    it "Valindado status code" do
      expect(@result.code).to eql 200
    end

    it "validando nome" do
      expect(@result.parsed_response["name"]).to eql @payload[:name]
    end
  end

  context "usuario duplicado" do
    before(:all) do
      #dado que eu tenho um novo usuario
      @payload = {
        "name": "Sou duplicado",
        "email": "duplicado@ig.com",
        "password": "Senha123",
      }
      MongoDB.new.remove_user(@payload[:email])
      # e o email desse usuario já foi cadastrado no sistema
      Signup.new.create(@payload)
      #quando faço uma nova requisição
      @result = Signup.new.create(@payload)
    end

    it "deve retornar 409" do
      #então deve retornar 409
      expect(@result.code).to eql 409
    end

    it "validando mensagem de erro" do
      expect(@result.parsed_response["error"]).to eql "Email already exists :("
    end
  end

  examples = [
    {
      title: "nome em branco",
      payload: {
        "name": "",
        "email": "otavio@boaal.com",
        "password": "Senha123",
      },
      code: 412,
      error: "required name",
    },
    {
      title: "email em branco",
      payload: {
        "name": "Otavio",
        "email": "",
        "password": "Senha123",
      },
      code: 412,
      error: "required email",
    },
    {
      title: "senha em branco",
      payload: {
        "name": "Otavio",
        "email": "otavio@boaal.com",
        "password": "",
      },
      code: 412,
      error: "required password",
    },
  ]

  examples.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        @result = Signup.new.create(e[:payload])
      end

      it "Deve retornar 412" do
        expect(@result.code).to eql "#{e[:code]}".to_i
      end

      it "deve retornar a mensagem de erro" do
        expect(@result.parsed_response["error"]).to eql "#{e[:error]}"
      end
    end
  end
end
