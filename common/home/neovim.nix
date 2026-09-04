{ config, pkgs, inputs, ... }:

{
	# neovim
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		# plugins = with pkgs.vimPlugins; [
		# 	nvim-lspconfig
		# 	nvim-treesitter.withAllGrammars
		# 	plenary-nvim
		# 	gruvbox-material
		# 	mini-nvim
    		# ];
	};
}
