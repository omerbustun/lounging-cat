defmodule LoungingCat.Social.Channel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "channels" do
    field :name, :string
    field :description, :string
    field :psk, :string

    timestamps()
  end

  @doc false
  def changeset(channel, attrs) do
    channel
    |> cast(attrs, [:name, :description, :psk])
    |> validate_required([:name, :description, :psk])
  end
end
