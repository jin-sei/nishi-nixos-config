# Nishi: NixOS config

## rebuild system wide

```bash
sudo nixos-rebuild switch --flake .#nishi-virtual
```

## rebuild user wide

```bash
home-manager switch --flake .#jinsei@nishi-virtual
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

nix helper commands

```bash
# rebuild system, like nixos-rebuild switch
nh os switch -H nishi-virtual # -H flag is optional

# rebuild home, like home-manager switch
nh home switch -c jinsei@nishi-virtual # -c flag is optional
```
