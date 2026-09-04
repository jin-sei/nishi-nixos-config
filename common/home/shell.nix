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
			# vi = "nvim"; # already handled in neovim.nix by programs.neovim.viAlias = true;
  			# update = "sudo nixos-rebuild switch";
		};

		# initContent = ''
		# function custom-clear-screen() {
		# 	zle clear-screen 
      		# 	echo ""
      		# 	zle reset-prompt
		# }
		# zle -N custom-clear-screen
		# bindkey '^L' custom-clear-screen
		# '';
		
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

			format = "╭─$username$hostname$directory$git_branch$git_status$line_break╰─$character";
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
				format = "@[$hostname](bold purple) "; 
			};
			
			directory = {
				format = "[$path](bold cyan)";
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
