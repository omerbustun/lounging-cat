defmodule LoungingCatWeb.ChannelController do
  use LoungingCatWeb, :controller

  alias LoungingCat.Social
  alias LoungingCat.Social.Channel

  def index(conn, _params) do
    channels = Social.list_channels()
    render(conn, :index, channels: channels)
  end

  def new(conn, _params) do
    changeset = Social.change_channel(%Channel{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"channel" => channel_params}) do
    case Social.create_channel(channel_params) do
      {:ok, channel} ->
        conn
        |> put_flash(:info, "Channel created successfully.")
        |> redirect(to: ~p"/channels/#{channel}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    channel = Social.get_channel!(id)
    render(conn, :show, channel: channel)
  end

  def edit(conn, %{"id" => id}) do
    channel = Social.get_channel!(id)
    changeset = Social.change_channel(channel)
    render(conn, :edit, channel: channel, changeset: changeset)
  end

  def update(conn, %{"id" => id, "channel" => channel_params}) do
    channel = Social.get_channel!(id)

    case Social.update_channel(channel, channel_params) do
      {:ok, channel} ->
        conn
        |> put_flash(:info, "Channel updated successfully.")
        |> redirect(to: ~p"/channels/#{channel}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, channel: channel, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    channel = Social.get_channel!(id)
    {:ok, _channel} = Social.delete_channel(channel)

    conn
    |> put_flash(:info, "Channel deleted successfully.")
    |> redirect(to: ~p"/channels")
  end
end
