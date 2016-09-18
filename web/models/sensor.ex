defmodule SocketPoc.Sensor do
  use SocketPoc.Web, :model

  @doc """
    Schema for sensors, their details and
    relation to the users.
  """
  schema "sensors" do
    field :title, :string

    has_many :user_sensors, SocketPoc.UserSensor
    has_many :users, through: [:user_sensors, :user]

    has_many :sensor_details, SocketPoc.SensorDetail
    timestamps
  end
end
