defmodule LoungingCat.SocialFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LoungingCat.Social` context.
  """

  @doc """
  Generate a channel.
  """
  def channel_fixture(attrs \\ %{}) do
    {:ok, channel} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description",
        psk: "some psk"
      })
      |> LoungingCat.Social.create_channel()

    channel
  end
end
