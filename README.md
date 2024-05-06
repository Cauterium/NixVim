# Nixvim Config

My Neovim config using nixvim.

## Configuring

To start configuring, just add or modify the nix files in `./config`.
If you add a new configuration file, remember to add it to the
[`config/default.nix`](./config/default.nix) file

## Testing your new configuration

To test your configuration simply run the following command

```
nix run .
```

To run my configuration, you can run:

```
nix run 'github:Cauterium/nixvim'
```
