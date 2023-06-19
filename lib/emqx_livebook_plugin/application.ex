defmodule EmqxLivebookPlugin.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    Application.put_env(:livebook, :default_runtime, Livebook.Runtime.Embedded.new())
    children = [
      # Starts a worker by calling: EmqxLivebookPlugin.Worker.start_link(arg)
      # {EmqxLivebookPlugin.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EmqxLivebookPlugin.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
