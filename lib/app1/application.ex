defmodule App1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      App1Web.Telemetry,
      App1.Repo,
      {DNSCluster, query: Application.get_env(:app1, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: App1.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: App1.Finch},
      # Start a worker by calling: App1.Worker.start_link(arg)
      # {App1.Worker, arg},
      # Start to serve requests, typically the last entry
      App1Web.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: App1.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    App1Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
