require_relative "base_api"

class Equipos < BaseApi
  def create(payload, user_id)
    return self.class.post("/equipos", body: payload, headers: { "user_id": user_id })
  end

  def booking(equipo_id, user_locator_id)
    return self.class.post("/equipos/#{equipo_id}/bookings",
                           body: { date: Time.now.strftime("%d/%m/%Y") }.to_json,
                           headers: { "user_id": user_locator_id })
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

#Time.now = grava a data do sistema
#strftime("%d/%m/%Y")= formata a data dia mÊs e ano com 4 digitos
