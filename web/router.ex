defmodule SocketPoc.Router do
  use SocketPoc.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SocketPoc do
    pipe_through :api

    get "/user/:id/devices", UserSensorController, :getDevices
    get "/device/:id", SensorController, :getDevice
  end
end
