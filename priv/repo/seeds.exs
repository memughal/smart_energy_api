# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SocketPoc.Repo.insert!(%SocketPoc.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias SocketPoc.{Repo, User, Sensor, UserSensor, SensorDetail}

user1 = Repo.insert!(%User{name: "user_1"})
user2 = Repo.insert!(%User{name: "user_2"})


sensor1 = Repo.insert!(%Sensor{title: "KitchenAid"})
sensor2 = Repo.insert!(%Sensor{title: "Thermomix"})
sensor3 = Repo.insert!(%Sensor{title: "Fernseher"})

user1_sensor1 = Repo.insert!(%UserSensor{user_id: user1.id, sensor_id: sensor1.id})
user2_sensor1 = Repo.insert!(%UserSensor{user_id: user2.id, sensor_id: sensor2.id})
user2_sensor2 = Repo.insert!(%UserSensor{user_id: user2.id, sensor_id: sensor3.id})
user2_sensor3 = Repo.insert!(%UserSensor{user_id: user2.id, sensor_id: sensor1.id})

Repo.insert!(%SensorDetail{sensor_id: sensor1.id, energy_consumption: 34, state: true})
Repo.insert!(%SensorDetail{sensor_id: sensor1.id, energy_consumption: 40, state: true})
Repo.insert!(%SensorDetail{sensor_id: sensor1.id, energy_consumption: 20, state: true})
Repo.insert!(%SensorDetail{sensor_id: sensor1.id, energy_consumption: 40, state: true})

Repo.insert!(%SensorDetail{sensor_id: sensor2.id, energy_consumption: 54, state: true})
Repo.insert!(%SensorDetail{sensor_id: sensor2.id, energy_consumption: 50, state: true})
Repo.insert!(%SensorDetail{sensor_id: sensor2.id, energy_consumption: 49, state: true})
Repo.insert!(%SensorDetail{sensor_id: sensor2.id, energy_consumption: 0, state: false})
Repo.insert!(%SensorDetail{sensor_id: sensor2.id, energy_consumption: 45, state: true})
Repo.insert!(%SensorDetail{sensor_id: sensor2.id, energy_consumption: 45, state: true})
Repo.insert!(%SensorDetail{sensor_id: sensor2.id, energy_consumption: 40, state: true})

Repo.insert!(%SensorDetail{sensor_id: sensor3.id, energy_consumption: 34, state: true})
Repo.insert!(%SensorDetail{sensor_id: sensor3.id, energy_consumption: 0, state: false})
Repo.insert!(%SensorDetail{sensor_id: sensor3.id, energy_consumption: 40, state: true})
Repo.insert!(%SensorDetail{sensor_id: sensor3.id, energy_consumption: 20, state: true})
