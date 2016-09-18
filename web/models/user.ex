defmodule SocketPoc.User do
  use SocketPoc.Web, :model

  @doc """
    Schema for users and their relation to the sensors.
  """
  schema "users" do
    field :name, :string

    has_many :user_sensors, SocketPoc.UserSensor
    has_many :sensors, through: [:user_sensors, :sensor]
    timestamps
  end
end
