# Nishi: NixOS config

## rebuild system wide

```bash
sudo nixos-rebuild switch --flake .#nishi-virtual
```

## rebuild user wide

```bash
home-manager switch --flake .#jinsei@nishi-virtual
```
