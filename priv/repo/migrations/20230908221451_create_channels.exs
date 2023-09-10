defmodule LoungingCat.Repo.Migrations.CreateChannels do
  use Ecto.Migration

  def change do
    create table(:channels) do
      add :name, :string
      add :description, :string
      add :psk, :string

      timestamps()
    end
  end
end
