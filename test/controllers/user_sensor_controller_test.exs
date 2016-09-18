defmodule SocketPoc.UserSensorControllerTest do
  use SocketPoc.ConnCase
  use ExUnit.Case, async: true

  alias SocketPoc.Router
  alias SocketPoc.{Repo, User, Sensor, UserSensor, SensorDetail}

  @opts Router.init([])
  test 'getting devices for a user returns 200' do

    conn = build_conn(:get, "/user/1/devices")
    response = Router.call(conn, @opts)
    assert response.status == 200
  end

  test 'getting devices for a user' do

    test_user_1 = Repo.insert!(%User{name: "test_user_1"})
    test_sensor_1 = Repo.insert!(%Sensor{title: "test_sensor_1"})
    Repo.insert!(%UserSensor{user_id: test_user_1.id, sensor_id: test_sensor_1.id})
    Repo.insert!(%SensorDetail{sensor_id: test_sensor_1.id, energy_consumption: 34, state: true})


    conn = build_conn(:get, "/user/" <> Integer.to_string(test_user_1.id) <>"/devices")
    response = Router.call(conn, @opts)
    {:ok, objList} = Poison.decode(response.resp_body)
    obj = List.first(objList)

    assert response.status == 200
    assert obj["title"] == test_sensor_1.title
  end
end
