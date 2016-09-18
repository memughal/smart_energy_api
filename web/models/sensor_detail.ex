defmodule SocketPoc.SensorDetail do
  use SocketPoc.Web, :model
  @doc """
    Schema for sensor details like energy and state.
  """
  schema "sensor_details" do

    belongs_to :sensor, SocketPoc.UserSensor

    field :energy_consumption, :integer
    field :state, :boolean
    timestamps
  end
end
