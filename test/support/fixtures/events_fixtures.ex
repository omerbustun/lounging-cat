defmodule LoungingCat.EventsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LoungingCat.Events` context.
  """

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        place: "some place",
        date_time: ~N[2023-08-19 19:44:00]
      })
      |> LoungingCat.Events.create_event()

    event
  end

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        name: "some name",
        date: ~N[2023-08-19 19:53:00],
        location: "some location"
      })
      |> LoungingCat.Events.create_event()

    event
  end

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        name: "some name",
        date: ~N[2023-08-19 19:54:00],
        location: "some location"
      })
      |> LoungingCat.Events.create_event()

    event
  end

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        place: "some place",
        date_time: ~N[2023-08-19 19:55:00]
      })
      |> LoungingCat.Events.create_event()

    event
  end
end
