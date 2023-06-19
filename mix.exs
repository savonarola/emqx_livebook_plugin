defmodule EmqxLivebookPlugin.MixProject do
  use Mix.Project

  @version "0.1.5"

  def project do
    [
      app: :emqx_livebook_plugin,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      consolidate_protocols: false,
      releases: releases()
    ]
  end

  def releases() do
    [
      emqx_livebook_plugin: [
        applications: [
          emqx_livebook_plugin: :permanent
        ],
        include_erts: false,
        steps: [
          :assemble,
          &EmqxPluginHelper.make_plugin_release/1,
        ],
        emqx_plugin_info: %{
          authors: ["Ilya Averyanov"],
          builder: %{
            name: "Ilya Averyanov",
            contact: "av@rubybox.dev",
            website: "https://av.rubybox.dev"
          },
          repo: "https://github.com/savonarola/emqx_livebook_plugin",
          functionality: ["Livebook interface for EMQX"],
          compatibility: %{
            emqx: "~> 5.0"
          },
          description: "Livebook interface for EMQX",
          metadata_vsn: @version
        },
        emqx_plugin_opts: [
          include_src?: true,
          exclude_elixir?: false
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {EmqxLivebookPlugin.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:emqx_plugin_helper, "~> 0.1.0", github: "savonarola/emqx_plugin_helper", runtime: false},
      {:livebook, "~> 0.9"},
      {:kino, "~> 0.9"}
    ]
  end
end
