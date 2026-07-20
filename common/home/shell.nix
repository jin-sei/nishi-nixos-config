{ config, pkgs, ... }:

{
	# zsh
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
  			ll = "ls -l";
			gt = "git status && tree";
			cow = "fortune | cowsay";
  			# update = "sudo nixos-rebuild switch";
		};
		history.size = 10000;
		
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

			format = "$username$hostname$directory$git_branch$git_status$line_break$character";
			add_newline = true;

			character = {
				success_symbol = "[\\$>](bold green)";
				error_symbol = "[\\$>](bold red)"; 
			};

			username = {
				show_always = true;
				format = "[$user]($style)";
			};
			
			hostname = {
				ssh_only = false;
				format = "@[$hostname]($style) "; 
			};
			
			directory = {
				format = "[$path]($style)";
				truncation_length = 1;
      				truncation_symbol = "";
      				truncate_to_repo = false;
				read_only = "(RO) "; 
			};
			
			git_branch = {
				symbol = ""; 
				format = ":[$branch]($style) ";
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
