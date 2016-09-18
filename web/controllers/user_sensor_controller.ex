defmodule SocketPoc.UserSensorController do
  use SocketPoc.Web, :controller

  import Ecto.Query
  alias SocketPoc.UserSensor

  @doc """
    This function gets sensors and their related data
    for a specific user.
  """
  def getDevices(conn, %{"id" => id}) do

    {user_id, _} = Integer.parse(id)

    result = UserSensor
            |> where([us], us.user_id == ^user_id)
            |> select([us], {us})
            |> preload([:user, sensor: :sensor_details])
            |> Repo.all

    render conn, "index.json", data: result
  end
end
