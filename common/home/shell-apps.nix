{ config, pkgs, ... }:

{
	# packages (stable)
	home.packages = (with pkgs; [
		# general shell apps
		tree
		fortune
		cowsay
		cmatrix
		tt
		# neovim lsp 
		lua-language-server
   		gopls				# Go
   	 	pyright				# Python
   	 	nil				# Nix
   	 	clang-tools			# C++ (provides clangd)
   	 	rust-analyzer			# Rust
   	 	vscode-langservers-extracted	# HTML & CSS
	]);

	# git
	programs.git = {
		enable = true;
		settings = {
			user = {
				name = "Jin Sei";
				email = "nils.rivaillon@protonmail.com";
			};
			init.defaultBranch = "main";
			core.editor = "vim";
		};
	};

	# btop
	programs.btop = {
		enable = true;
		settings = {
			color_theme = "TTY";
			theme_background = false;

		};
	};
	
	# fastfetch
	programs.fastfetch = {
		enable = true;
		settings = {
			logo = {
				source = "OSX";
				padding = {right=5;left=3;};
			};
			display = {
				color = "blue";
				separator = ": ";
				key = {width=14;};
			};
			modules = [
				"title"
       				{
					type = "separator";
					string = "─";
				}
       				"os"
       				"kernel"
       				"packages"
       				"shell"
       				"wm"
       				"host"
       				"cpu"
       				"gpu"
       				"memory"
       				"disk"
       				"terminal"
       				"break"
       				"colors"	
			];
		};
	};
}
