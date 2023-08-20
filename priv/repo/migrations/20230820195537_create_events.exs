defmodule LoungingCat.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :place, :string
      add :date_time, :naive_datetime

      timestamps()
    end
  end
end
