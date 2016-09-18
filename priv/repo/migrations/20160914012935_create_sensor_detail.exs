defmodule SocketPoc.Repo.Migrations.CreateSensorDetail do
  use Ecto.Migration

  def change do
    create table(:sensor_details) do
      add :sensor_id, references(:sensors, on_delete: :nothing, column: :id, type: :integer)
      add :energy_consumption, :integer
      add :state, :boolean
      timestamps
    end
  end
end
