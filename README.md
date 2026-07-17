# Nishi: NixOS config

## rebuild system wide

using nixos-rebuild

```bash
sudo nixos-rebuild switch --flake .#nishi-virtual
```

with nix helper (nh) command

```bash
nh os switch -H nishi-virtual # -H flag is optional
```

## rebuild user wide

using home-manager

```bash
home-manager switch --flake .#jinsei@nishi-virtual
```

with nix helper (nh) command

```bash
nh home switch -c jinsei@nishi-virtual # -c flag is optional
```

## useful commands

garbage collections dry run (see how much space I can save)

```bash
nix-collect-garbage --dry-run
```

list generations

```bash
nixos-rebuild --list-generations
```

