describe "POST /equipo/ {equipo_id}/bookings" do
  before(:all) do
    @joy = {
      "name": "Joy Miller",
      "email": "joy@teste.com",
      "password": "Senha123",
    }
    MongoDB.new.remove_user(@joy[:email])
    result = Signup.new.create(@joy)
    @joy_id = result.parsed_response["_id"]
  end

  context "solicitando a fender strato para locação" do
    #dado que "Adam" tem uma fender strato para locação
    before(:all) do
      payload = {
        "email": "adam@bol.com",
        "password": "Senha123",
      }

      result = Sessions.new.login(payload)
      adam_id = result.parsed_response["_id"]
      fender = {
        "thumbnail": Helpers::get_thumb("fender-sb.jpg"),
        "name": "Guitarra",
        "category": "Cordas",
        "price": 199,
      }
      MongoDB.new.remove_equipo(fender[:name], adam_id)
      result = Equipos.new.create(fender, adam_id)
      @fender_id = result.parsed_response["_id"]

      #quando "joy miller" faz uma solicitação para alugar o equipamento
      @result = Equipos.new.booking(@fender_id, @joy_id)
    end
    it "deve retonrar o status 200" do
      expect(@result.code).to eql 200
    end
  end
end
