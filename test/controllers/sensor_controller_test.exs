defmodule SocketPoc.SensorControllerTest do
  use SocketPoc.ConnCase
  use ExUnit.Case, async: true

  alias SocketPoc.Router
  alias SocketPoc.{Sensor, SensorDetail}

  @opts Router.init([])
  test 'getting device info returns 200' do

    conn = build_conn(:get, "/device/1")
    response = Router.call(conn, @opts)
    assert response.status == 200
  end

  test 'getting device info' do

    test_sensor_1 = Repo.insert!(%Sensor{title: "test_sensor_1"})
    Repo.insert!(%SensorDetail{sensor_id: test_sensor_1.id, energy_consumption: 34, state: true})


    conn = build_conn(:get, "/device/" <> Integer.to_string(test_sensor_1.id))
    response = Router.call(conn, @opts)
    {:ok, obj} = Poison.decode(response.resp_body)

    assert response.status == 200
    assert obj["accumulative"]["title"] == test_sensor_1.title
  end
end
