require_relative "base_api"

class Sessions < BaseApi
  def login(payload)
    return self.class.post("/sessions", body: payload.to_json, headers: @headers)
  end
end
