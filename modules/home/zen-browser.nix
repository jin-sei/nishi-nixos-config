{ config, pkgs, inputs,... }:
{
	imports = [
		inputs.zen-browser.homeModules.beta
		# or inputs.zen-browser.homeModules.twilight
		# or inputs.zen-browser.homeModules.twilight-official
	];

	programs.zen-browser = {
		
		enable = true;
		setAsDefaultBrowser = true;
		enablePrivateDesktopEntry = true;
		
		policies.Cookies.Allow = [
			"https://account.proton.me"
			"https://pass.proton.me"
			"https://calendar.proton.me"

			"https://google.com"
			"https://mail.google.com"
			"https://drive.google.com"

			"https://letterboxd.com"
			"https://serializd.com"

			"https://duckduckgo.com"
			"https://duck.ai"

			"https://webmail.utc.fr"
			"https://moodle.utc.fr"
			"https://utc.fr"
			"https://ent.utc.fr"

			"https://app.slack.com"
			"https://plask.slack.com"

			"https://app.todoist.com"
			"https://web.whatsapp.com"
			"https://github.com"
		];
		
		profiles.default = {
			search = {
				force = true;
				default = "ddg";
				engines = {
					nix-packages = {
    						name = "Nix Packages";
						urls = [{
							template = "https://search.nixos.org/packages";
							params = [
								{ name = "type"; value = "packages"; }
								{ name = "query"; value = "{searchTerms}"; }
							];
						}];
						
						icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
						definedAliases = [ "@nix" ];
					};

					youtube = {
						name = "YouTube";
						urls = [{ template = "https://www.youtube.com/results?search_query={searchTerms}"; }];
						definedAliases = [ "@you" "@yt" ];
					};	
				};
			};
			settings = {
				"privacy.sanitize.sanitizeOnShutdown" = true;
				"privacy.clearOnShutdown.cache" = true;
				"privacy.clearOnShutdown.cookies" = true;
				"privacy.clearOnShutdown.downloads" = true;
				"privacy.clearOnShutdown.formdata" = true;
				"privacy.clearOnShutdown.history" = true;
				"privacy.clearOnShutdown.offlineApps" = true;
				"privacy.clearOnShutdown.sessions" = true;
				"privacy.clearOnShutdown.siteSettings" = false;
				
				"network.cookie.lifetimePolicy" = 2;
				
				"full-screen-api.ignore-widgets" = true;

				"browser.translations.enable" = false;
				"browser.translations.automaticallyPopup" = false;
				"extensions.formautofill.addresses.enabled" = false;
				"extensions.formautofill.creditCards.enabled" = false;
			};
		};
	};
}
