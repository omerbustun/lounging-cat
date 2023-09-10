defmodule LoungingCatWeb.ChannelControllerTest do
  use LoungingCatWeb.ConnCase

  import LoungingCat.SocialFixtures

  @create_attrs %{name: "some name", description: "some description", psk: "some psk"}
  @update_attrs %{name: "some updated name", description: "some updated description", psk: "some updated psk"}
  @invalid_attrs %{name: nil, description: nil, psk: nil}

  describe "index" do
    test "lists all channels", %{conn: conn} do
      conn = get(conn, ~p"/channels")
      assert html_response(conn, 200) =~ "Listing Channels"
    end
  end

  describe "new channel" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/channels/new")
      assert html_response(conn, 200) =~ "New Channel"
    end
  end

  describe "create channel" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/channels", channel: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/channels/#{id}"

      conn = get(conn, ~p"/channels/#{id}")
      assert html_response(conn, 200) =~ "Channel #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/channels", channel: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Channel"
    end
  end

  describe "edit channel" do
    setup [:create_channel]

    test "renders form for editing chosen channel", %{conn: conn, channel: channel} do
      conn = get(conn, ~p"/channels/#{channel}/edit")
      assert html_response(conn, 200) =~ "Edit Channel"
    end
  end

  describe "update channel" do
    setup [:create_channel]

    test "redirects when data is valid", %{conn: conn, channel: channel} do
      conn = put(conn, ~p"/channels/#{channel}", channel: @update_attrs)
      assert redirected_to(conn) == ~p"/channels/#{channel}"

      conn = get(conn, ~p"/channels/#{channel}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, channel: channel} do
      conn = put(conn, ~p"/channels/#{channel}", channel: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Channel"
    end
  end

  describe "delete channel" do
    setup [:create_channel]

    test "deletes chosen channel", %{conn: conn, channel: channel} do
      conn = delete(conn, ~p"/channels/#{channel}")
      assert redirected_to(conn) == ~p"/channels"

      assert_error_sent 404, fn ->
        get(conn, ~p"/channels/#{channel}")
      end
    end
  end

  defp create_channel(_) do
    channel = channel_fixture()
    %{channel: channel}
  end
end
