defmodule LoungingCat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LoungingCatWeb.Telemetry,
      # Start the Ecto repository
      LoungingCat.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LoungingCat.PubSub},
      # Start Finch
      {Finch, name: LoungingCat.Finch},
      # Start the Endpoint (http/https)
      LoungingCatWeb.Endpoint
      # Start a worker by calling: LoungingCat.Worker.start_link(arg)
      # {LoungingCat.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LoungingCat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LoungingCatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
