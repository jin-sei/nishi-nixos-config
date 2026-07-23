{ config, pkgs, inputs, ... }:

{
	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
	
	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
	
	# Enable networking
	networking.networkmanager.enable = true;
	
	# Pipewire (audio)
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};
	
	# Set your time zone.
	time.timeZone = "Europe/Paris";
	
	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";
	
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "fr_FR.UTF-8";
		LC_IDENTIFICATION = "fr_FR.UTF-8";
		LC_MEASUREMENT = "fr_FR.UTF-8";
		LC_MONETARY = "fr_FR.UTF-8";
		LC_NAME = "fr_FR.UTF-8";
		LC_NUMERIC = "fr_FR.UTF-8";
		LC_PAPER = "fr_FR.UTF-8";
		LC_TELEPHONE = "fr_FR.UTF-8";
		LC_TIME = "fr_FR.UTF-8";
	};
	
	# Configure keymap in X11
	services.xserver.xkb = {
		layout = "fr";
		variant = "";
	};
	
	# Configure console keymap
	console.keyMap = "fr";
	
	# FCITX input method (japanese keyboard)
	i18n.inputMethod = {
		enable = true;
		type = "fcitx5";
		fcitx5 = { 
			addons = with pkgs; [
				fcitx5-mozc
				fcitx5-gtk
			];
			settings.inputMethod = {
				GroupOrder."0" = "Default";
				"Groups/0" = {
					Name = "Default";
					"Default Layout" = "fr";
					DefaultIM = "mozc";
				};
				"Groups/0/Items/0".Name = "keyboard-fr";
				"Groups/0/Items/1".Name = "mozc";
			};
			ignoreUserConfig = true;
			waylandFrontend = true;
		};
	};
	
	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users."jinsei" = {
		isNormalUser = true;
		description = "jinsei";
		useDefaultShell = true;
		extraGroups = [ "networkmanager" "audio" "wheel" ];
		# packages = with pkgs; [];
	};
	
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;
	
	# Experimental features
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	
	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		tree
		git
		
		lshw
		wget
	     	curl

	     	vim
	];
	
	fonts.packages = with pkgs; [
		nerd-fonts.fira-code
		nerd-fonts.symbols-only
	];

	# enable zsh system-wide to source necessary files
	programs.zsh.enable = true;
	users.defaultUserShell = pkgs.zsh;
	
	# start ssh to manage keys (for git authentication)
	programs.ssh.startAgent = true;

	# gnupg (gpg)
	programs.gnupg.agent = {
		enable = true;
	};
			
	# enable the OpenSSH daemon.
	services.openssh.enable = true;
	
	# polkit (authentication)
	security.polkit.enable = true;
	
	# pam (for hyprlock)
	security.pam.services.hyprlock = {};
	
	# enabling hyprland module
	programs.hyprland = {
		enable = true;
		withUWSM = true;
    		xwayland.enable = true;
		portalPackage = pkgs.xdg-desktop-portal-hyprland;
	};

	# xdg portal
	xdg.portal = {
    		enable = true;
    		extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  	};
	
	# enable ly login manager
	services.displayManager.ly.enable = true;
}
