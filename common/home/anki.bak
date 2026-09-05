{ config, pkgs, ... }:

{
	# anki with addons
	home.packages = with pkgs; [
				
		(anki.withAddons [
    			ankiAddons.passfail2
			ankiAddons.anki-connect
			(ankiAddons.recolor.withConfig {
				config = {
					colors = {
						ACCENT_CARD = [ "Card mode" "#00a" "#61afef" "--accent-card" ];
						ACCENT_DANGER = [ "Danger" "#c35617" "#e06b74" "--accent-danger" ];
						ACCENT_NOTE = [ "Note mode" "#0a0" "#98c379" "--accent-note" ];
						BORDER = [ "Border" "#aaa" "#111111" "--border" ];
						BORDER_FOCUS = [ "Border (focused input)" "#3daee9" "#61afef" "--border-focus" ];
						BORDER_STRONG = [ "Border (strong)" "#b6b6b6" "#292929" "--border-strong" ];
						BORDER_SUBTLE = [ "Border (subtle)" "#e7e7e7" "#111111" "--border-subtle" ];
						BUTTON_BG = [ "Button background" "#eff0f1" "#1b1d21" "--button-bg" ];
						BUTTON_DISABLED = [ "Button background (disabled)" "#777" "#666666" "--button-disabled" ];
						BUTTON_HOVER = [ "Button background (hover)" "#e5e5e5" "#2a2d32" [ "--button-gradient-start" "--button-gradient-end" ] ];
						BUTTON_HOVER_BORDER = [ "Button border (hover)" "#b6b6b6" "#292929" "--button-hover-border" ];
						BUTTON_PRIMARY_BG = [ "Button Primary Bg" "#3daee9" "#61afef" "--button-primary-bg" ];
						BUTTON_PRIMARY_DISABLED = [ "Button Primary Disabled" "#777" "#666666" "--button-primary-disabled" ];
						BUTTON_PRIMARY_GRADIENT_END = [ "Button Primary Gradient End" "#3daee9" "#61afef" "--button-primary-gradient-end" ];
						BUTTON_PRIMARY_GRADIENT_START = [ "Button Primary Gradient Start" "#3daee9" "#61afef" "--button-primary-gradient-start" ];
						CANVAS = [ "Background" "#ececec" "#111111" [ "--canvas" "--bs-body-bg" ] ];
						CANVAS_CODE = [ "Code editor background" "white" "#171717" "--canvas-code" ];
						CANVAS_ELEVATED = [ "Review" "#ececec" "#111111" "--canvas-elevated" ];
						CANVAS_GLASS = [ "Background (transparent text surface)" "#ffffff66" "#17171766" "--canvas-glass" ];
						CANVAS_INSET = [ "Background (inset)" "white" "#171717" "--canvas-inset" ];
						CANVAS_OVERLAY = [ "Background (menu & tooltip)" "#fcfcfc" "#272727" "--canvas-overlay" ];
						FG = [ "Text" "black" "#abb2bf" [ "--fg" "--bs-body-color" ] ];
						FG_DISABLED = [ "Text (disabled)" "#777" "#666666" "--fg-disabled" ];
						FG_FAINT = [ "Text (faint)" "#ddd" "#49505e" "--fg-faint" ];
						FG_LINK = [ "Text (link)" "#00a" "#61afef" "--fg-link" ];
						FG_SUBTLE = [ "Text (subtle)" "#333" "#cccccc" "--fg-subtle" ];
						FLAG_1 = [ "Flag 1" "#BF616A" "#e06b74" "--flag-1" ];
						FLAG_2 = [ "Flag 2" "#D08770" "#e09b69" "--flag-2" ];
						FLAG_3 = [ "Flag 3" "#A3BE8C" "#98c379" "--flag-3" ];
						FLAG_4 = [ "Flag 4" "#5E81AC" "#61afef" "--flag-4" ];
						FLAG_5 = [ "Flag 5" "#B48EAD" "#dd98cd" "--flag-5" ];
						FLAG_6 = [ "Flag 6" "#00d1b5" "#55b6c2" "--flag-6" ];
						FLAG_7 = [ "Flag 7" "#9649dd" "#a270c1" "--flag-7" ];
						HIGHLIGHT_BG = [ "Highlight background" "#3daee9" "#61afef" "--highlight-bg" ];
						HIGHLIGHT_FG = [ "Highlight text" "white" "#ffffff" "--highlight-fg" ];
						SCROLLBAR_BG = [ "Scrollbar background" "#ececec" "#111111" "--scrollbar-bg" ];
						SCROLLBAR_BG_ACTIVE = [ "Scrollbar background (active)" "#b6b6b6" "#292929" "--scrollbar-bg-active" ];
						SCROLLBAR_BG_HOVER = [ "Scrollbar background (hover)" "#e7e7e7" "#1b1d21" "--scrollbar-bg-hover" ];
						SELECTED_BG = [ "Selected Bg" "#e7e7e7" "#1b1d21" "--selected-bg" ];
						SELECTED_FG = [ "Selected Fg" "black" "#abb2bf" "--selected-fg" ];
						SHADOW = [ "Shadow" "#aaa" "#111111" "--shadow" ];
						SHADOW_FOCUS = [ "Shadow (focused input)" "#3daee9" "#61afef" "--shadow-focus" ];
						SHADOW_INSET = [ "Shadow (inset)" "#aaa" "#111111" "--shadow-inset" ];
						SHADOW_SUBTLE = [ "Shadow (subtle)" "#e7e7e7" "#111111" "--shadow-subtle" ];
						STATE_BURIED = [ "Buried" "#aaaa33" "#626262" "--state-buried" ];
						STATE_LEARN = [ "Learn" "#c35617" "#e06b74" "--state-learn" ];
						STATE_MARKED = [ "Marked" "#cce" "#9077dd" "--state-marked" ];
						STATE_NEW = [ "New" "#00a" "#61afef" "--state-new" ];
						STATE_REVIEW = [ "Review" "#0a0" "#98c379" "--state-review" ];
						STATE_SUSPENDED = [ "Suspended" "#dd0" "#e5c07a" "--state-suspended" ];
					};
					version = {
						major = 3;
						minor = 1;
					};
				};
			})
  		])
  	];
}
