defmodule SocketPoc.Repo.Migrations.CreateUserSensor do
  use Ecto.Migration

  def change do
    create table(:user_sensors) do
      add :user_id, references(:users, on_delete: :nothing, column: :id, type: :integer)
      add :sensor_id, references(:sensors, on_delete: :nothing, column: :id, type: :integer)
      # add :sensor_name, :string
      timestamps
    end

     create index(:user_sensors, [:user_id, :sensor_id], unique: true)
  end
end
