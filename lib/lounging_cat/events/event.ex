defmodule LoungingCat.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :place, :string
    field :date_time, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:place, :date_time])
    |> validate_required([:place, :date_time])
  end
end
