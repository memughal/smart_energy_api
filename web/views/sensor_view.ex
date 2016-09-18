defmodule SocketPoc.SensorView do
  use SocketPoc.Web, :view

  def render("getDevice.json", %{data: sensors}) do
    render_many(sensors, __MODULE__, "user_sensor.json")
    |> List.first
  end

  def render("user_sensor.json", %{sensor: user_sensor_details}) do

    sensor_info = elem(user_sensor_details, 0)
    %{
      statistics: render_many(sensor_info.sensor_details, __MODULE__, "sensor_details.json"),
      accumulative: render_one(sensor_info, __MODULE__, "sensor.json")
    }
  end

  def render("sensor_details.json", %{sensor: sensor_details}) do

    %{
      id: sensor_details.id,
      energy_consumption: sensor_details.energy_consumption,
      state: sensor_details.state,
      inserted_at: sensor_details.inserted_at
    }
  end

  def render("sensor.json", %{sensor: sensor}) do

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

end
