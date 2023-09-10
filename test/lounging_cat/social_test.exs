defmodule LoungingCat.SocialTest do
  use LoungingCat.DataCase

  alias LoungingCat.Social

  describe "channels" do
    alias LoungingCat.Social.Channel

    import LoungingCat.SocialFixtures

    @invalid_attrs %{name: nil, description: nil, psk: nil}

    test "list_channels/0 returns all channels" do
      channel = channel_fixture()
      assert Social.list_channels() == [channel]
    end

    test "get_channel!/1 returns the channel with given id" do
      channel = channel_fixture()
      assert Social.get_channel!(channel.id) == channel
    end

    test "create_channel/1 with valid data creates a channel" do
      valid_attrs = %{name: "some name", description: "some description", psk: "some psk"}

      assert {:ok, %Channel{} = channel} = Social.create_channel(valid_attrs)
      assert channel.name == "some name"
      assert channel.description == "some description"
      assert channel.psk == "some psk"
    end

    test "create_channel/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_channel(@invalid_attrs)
    end

    test "update_channel/2 with valid data updates the channel" do
      channel = channel_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", psk: "some updated psk"}

      assert {:ok, %Channel{} = channel} = Social.update_channel(channel, update_attrs)
      assert channel.name == "some updated name"
      assert channel.description == "some updated description"
      assert channel.psk == "some updated psk"
    end

    test "update_channel/2 with invalid data returns error changeset" do
      channel = channel_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_channel(channel, @invalid_attrs)
      assert channel == Social.get_channel!(channel.id)
    end

    test "delete_channel/1 deletes the channel" do
      channel = channel_fixture()
      assert {:ok, %Channel{}} = Social.delete_channel(channel)
      assert_raise Ecto.NoResultsError, fn -> Social.get_channel!(channel.id) end
    end

    test "change_channel/1 returns a channel changeset" do
      channel = channel_fixture()
      assert %Ecto.Changeset{} = Social.change_channel(channel)
    end
  end
end
