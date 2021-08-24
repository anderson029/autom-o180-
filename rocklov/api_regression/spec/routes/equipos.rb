require_relative "base_api"

class Equipos < BaseApi
  def create(payload, user_id)
    return self.class.post("/equipos", body: payload, headers: { "user_id": user_id })
  end

  def find_get_equipos(equipo_id, user_id)
    return self.class.get("/equipos/#{equipo_id}", headers: { "user_id": user_id })
  end

  def list_equipos(user_id)
    return self.class.get("/equipos", headers: { "user_id": user_id })
  end

  def delete_equipo(equipo_id, user_id)
    return self.class.delete("/equipos/#{equipo_id}", headers: { "user_id": user_id })
  end
end
