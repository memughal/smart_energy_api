defmodule SocketPoc.UserSensor do
  use SocketPoc.Web, :model

  @doc """
    Schema for user sensor, manages relationship
    between sensors and users.
  """
  schema "user_sensors" do

    belongs_to :user, SocketPoc.User
    belongs_to :sensor, SocketPoc.Sensor
    timestamps
  end
end
