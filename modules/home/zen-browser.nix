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
			"https://github.com"
			"https://moodle.utc.fr"
			"https://utc.fr"
			"https://account.proton.me"
			"https://app.todoist.com"
			"https://mail.google.com"
			"https://calendar.proton.me"
			"https://google.com"
			"https://letterboxd.com"
			"https://serializd.com"
			"https://duckduckgo.com"
			"https://webmail.utc.fr"
			"https://drive.google.com"
			"https://ent.utc.fr"
			"https://duck.ai"
		];
		
		profiles.default = {
			search = {
				force = true;
				default = "ddg";
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
