{ config, pkgs, inputs, ... }:

{
	# neovim lua config files
	xdg.configFile."nvim/lua" = {
		source = inputs.self + "/miscellaneous/dotfiles/neovim/lua";
	 	target = "nvim/lua";
		recursive = true;
	};

	# manage neovim plugins
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;

		# replaces init.lua
		initLua = ''
			require("colors")
			require("settings")
			require("treesitter")
		'';

		plugins = with pkgs.vimPlugins; [
			nvim-treesitter.withAllGrammars
    		];
	};
}
