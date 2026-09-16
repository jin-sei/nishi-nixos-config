{ config, pkgs, ... }:

{
	# zsh
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		history.size = 10000;

		shellAliases = {
  			ll = "ls -lh";
			gt = "git status";
			cow = "fortune | cowsay";
			nvmpv = "nvidia-offload mpv";
			nv = "nvim -M"; # open read-only neovim
			ff = "fastfetch";
			matrix = "cmatrix -b -C green -u 10";
			tt = "tt -notheme";
			wc = "wl-copy";
			# vi = "nvim"; # already handled in neovim.nix by programs.neovim.viAlias = true;
  			# update = "sudo nixos-rebuild switch";
		};

		sessionVariables = {
			NEWT_COLORS="
			root=white,black
			border=black,lightgray
			window=lightgray,lightgray
			shadow=black,gray
			title=black,lightgray
			button=black,cyan
			actbutton=white,cyan
			compactbutton=black,lightgray
			checkbox=black,lightgray
			actcheckbox=lightgray,cyan
			entry=black,lightgray
			disentry=gray,lightgray
			label=black,lightgray
			listbox=black,lightgray
			actlistbox=black,lightgray
			sellistbox=lightgray,black
			actsellistbox=lightgray,black
			textbox=black,lightgray
			acttextbox=black,cyan
			emptyscale=,gray
			fullscale=,cyan
			helpline=white,black
			roottext=lightgrey,black";
		};

		# plugin management with oh-my-zsh
		oh-my-zsh = {
    			enable = true;
    			# plugins = [ "git" "thefuck" ];
    			# theme = "robbyrussell";
  		};
	};

	# starship
	programs.starship = {
		enable = true;
		enableZshIntegration = true;
		settings = {

			format = "╭─$username$hostname$nix_shell$directory$git_branch$git_status$line_break╰─$character";
			add_newline = true;

			character = {
				success_symbol = "──[>](green)";
				error_symbol = "──[>](red)"; 
			};

			username = {
				show_always = true;
				format = "[$user](bold cyan)";
			};
			
			hostname = {
				ssh_only = false;
				format = "@[$hostname](bold purple)"; 
			};

			nix_shell = {
				format = ":[$name]($style)";
				style = "bold blue";
				heuristic = false;
				unknown_msg = "shell";
			};
			
			directory = {
				format = " [$path](bold cyan)";
				truncation_length = 1;
      				truncation_symbol = "";
      				truncate_to_repo = false;
				read_only = "(RO) "; 
			};
			
			git_branch = {
				symbol = ""; 
				format = ":[$branch](bold blue) ";
			};
			
			git_status = {
				format = "([$all_status$ahead_behind]($style) )";
				conflicted = "=";
				ahead = ">";
				behind = "<";
				diverged = "<>";
				untracked = "?";
				modified = "!";
				staged = "+";
				renamed = "r";
				deleted = "x";
				stashed = "$";
			};
			
			# disables the package module which usually injects a box icon
			package.disabled = true; 
		};
	};
}
