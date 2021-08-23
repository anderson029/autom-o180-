require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

#Acessando banco de dados
class MongoDB
  def initialize
    client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
    @users = client[:users]
    @equipos = client[:equipos]
  end

  def remove_user(email)
    @users.delete_many({ email: email })
  end

  def get_user(email)
    user = @users.find({ email: email }).first
    return user[:_id]
  end

  def remove_equipo(nome, user_id)
    obj_id = BSON::ObjectId.from_string(user_id) #covertendo para object_id do mongo
    @equipos.delete_many({ name: nome, user: obj_id })
  end
end
