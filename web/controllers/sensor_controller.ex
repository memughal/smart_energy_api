defmodule SocketPoc.SensorController do
  use SocketPoc.Web, :controller

  import Ecto.Query
  alias SocketPoc.Sensor

  @doc """
    This function gets data for a specific sensor.
  """
  def getDevice(conn, %{"id" => id}) do

    {sensor_id, _} = Integer.parse(id)

    result = Sensor
            |> where([s], s.id == ^sensor_id)
            |> select([s], {s})
            |> preload([:sensor_details])
            |> Repo.all

    render conn, "getDevice.json", data: result
  end
end
