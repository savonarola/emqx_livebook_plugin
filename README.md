![Logo](./emqx-plus-livebook.png)

# Emqx Livebook Plugin

Integrating Livebook into EMQX PoC.

## Build

```shell
mix deps.get
MIX_ENV=prod mix release emqx_livebook_plugin --overwrite
```

## Usage

* Make sure EMQX and the plugin use the same Erlang and Elixir versions for building.
* Build the plugin.
* Build and run EMQX Elixir version:
```shell
make emqx-elixir
_build/emqx/rel/emqx/bin/emqx console
```
* Install and start the plugin via Dashboard or CLI.
* Open the Livebook at `http://localhost:8080`

## Caveats

Currently, the plugin does not support unloading and loading back, because Livebook makes some global changes in the system that are not reverted when unloading. This prevents the plugin from being loaded back.

This can be probably fixed.
