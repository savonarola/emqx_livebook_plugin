import Config

config :livebook, LivebookWeb.Endpoint,
  pubsub_server: Livebook.PubSub,
  live_view: [signing_salt: "livebook"]

config :livebook,
  iframe_port: 8081,
  force_ssl_host: false,
  within_iframe: false,
  plugs: [],
  authentication_mode: :disabled,
  token_authentication: false,
  # password: System.get_env("LIVEBOOK_PASSWORD", "password"),
  cookie: :livebook_cookie,
  app_service_name: nil,
  app_service_url: nil,
  feature_flags: [],
  learn_notebooks: [],
  shutdown_callback: nil,
  update_instructions_url: nil,
  allowed_uri_schemes: []

config :livebook, LivebookWeb.Endpoint,
  url: [host: "localhost", path: "/", port: 8080],
  http: [
    port: "8080",
    transport_options: [socket_opts: [:inet6]]
  ],
  code_reloader: false,
  server: true,
  secret_key_base: "z9/3PbKl5GFeH3OJ8iHq7d8NyJg7SbzQ00yn5WgWlYpRCe0q0dVf4CWuqmYwgXKV",
  render_errors: [formats: [html: LivebookWeb.ErrorHTML], layout: false]

config :livebook,
  root_path: "/tmp/livebooks"

config :phoenix, :json_library, Jason
