require "httparty"

class Sessions
  include HTTParty
  base_uri "http://rocklov-api:3333"

  def login(email, senha)
    payload = {
      "email": email,
      "password": senha,
    }
    @headers = {
      "Content-Type" => "application/json",
    }

    return self.class.post("/sessions", body: payload.to_json, headers: @headers)
  end
end
