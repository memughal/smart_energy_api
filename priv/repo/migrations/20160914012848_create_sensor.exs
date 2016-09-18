defmodule SocketPoc.Repo.Migrations.CreateSensor do
  use Ecto.Migration

  def change do
    create table(:sensors) do
      add :title, :string
      timestamps
    end
  end
end
