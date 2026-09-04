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

## updating

with nix helper (nh)

```bash
nh os switch -u # in case of crash on nh os switch, use nh os boot to add configuration in bootloader without switching
nh home switch
```

## useful commands

garbage collections dry run (see how much space I can save)

```bash
nix-collect-garbage --dry-run
```

list generations

```bash
nix profile history --profile /nix/var/nix/profiles/system
```

bootstrap home-manager (new machine)

```bash
nix run github:nix-community/home-manager -- switch --flake .#jinsei
```

bootstrap home-manager (new machine, no git clone)

```bash
nix run github:nix-community/home-manager -- switch --flake github:your-github-user/your-repo#your-username
```

run with nvidia gpu 

```bash
nvidia-offload mpv JoJo_S01E01.mkv
```

push to graphene phone with adb

```bash
adb push ~/Video/folder/file.mp4 /storage/self/primary/Movies
```
