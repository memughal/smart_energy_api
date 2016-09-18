defmodule SocketPoc.UserSensorView do
  use SocketPoc.Web, :view

  def render("index.json", %{data: user_sensor}) do
    render_many(user_sensor, __MODULE__, "user_sensor.json")
  end

  def render("user_sensor.json", %{user_sensor: user_sensor}) do

    user_sensor_values = elem(user_sensor, 0)
    render_one(user_sensor_values.sensor, __MODULE__, "sensor.json")
  end

  def render("user.json", %{user_sensor: user}) do

    %{
      id: user.id,
      name: user.name
    }
  end

  def render("sensor.json", %{user_sensor: sensor}) do

    count = sensor.sensor_details
    |>  Enum.count

    energy_consumption = sensor.sensor_details
    |> Mth.sum_energy
    |> div(count)
    |> round

    last = sensor.sensor_details
    |> List.last

    sensor_detail = %{energy_consumption: energy_consumption, state: last.state}

    %{
      id: sensor.id,
      title: sensor.title,
      sensor_details: sensor_detail
    }
  end

  def render("sensor_details.json", %{user_sensor: sensor_details}) do

    %{
      id: sensor_details.id,
      energy_consumption: sensor_details.energy_consumption,
      state: sensor_details.state,
      inserted_at: sensor_details.inserted_at
    }
  end

end


defmodule Mth do

  def sum_energy([]) do
    0
  end

  def sum_energy([h|t]) do
    h.energy_consumption + sum_energy(t)
  end

end
