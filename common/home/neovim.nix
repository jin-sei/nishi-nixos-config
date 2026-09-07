{ config, pkgs, inputs, ... }:

{
	# neovim lua config files
	xdg.configFile."nvim" = {
		source = inputs.self + "/miscellaneous/dotfiles/neovim";
	 	target = "nvim";
		recursive = true;
	};

	# manage neovim plugins
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		# plugins = with pkgs.vimPlugins; [
		# 	nvim-lspconfig
		# 	nvim-treesitter.withAllGrammars
		# 	gruvbox-material
		# 	mini-nvim
    		# ];
	};
}
